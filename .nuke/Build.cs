﻿using System;
using System.Diagnostics;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Nuke.Common;
using Nuke.Common.Git;
using Nuke.Common.IO;
using Serilog;
using SharpCompress.Common;
using SharpCompress.Readers;
partial class Build : NukeBuild {
    /// Support plugins are available for:
    ///   - JetBrains ReSharper        https://nuke.build/resharper
    ///   - JetBrains Rider            https://nuke.build/rider
    ///   - Microsoft VisualStudio     https://nuke.build/visualstudio
    ///   - Microsoft VSCode           https://nuke.build/vscode
    public static int Main() => Execute<Build>(x => x.PrintInfo);

    [GitRepository] public GitRepository GitRepo = null!;

    Target PrintInfo => _ => _
        .Executes(() =>
        {
            Log.Information("Root directory: {RootDirectory}", RootDirectory);
            Log.Information("Branch: {BranchName}", GitRepo.Branch);
            Log.Information("Commit: {CommitHash}", GitRepo.Commit);

            try {
                var requiredFactorioVersion = GetRequiredFactorioVersion();
                Log.Information("For Factorio: {FactorioVersion} and higher", requiredFactorioVersion);
                Log.Information("Download Factorio {FactorioVersion}: {FactorioDownloading}", requiredFactorioVersion, Utils.GetFactorioDownloadLinkForCurrentOs(requiredFactorioVersion.ToString()));
            }
            catch (Exception e) {
                Log.Error(e, "Failed to determine Factorio version");
            }
        });

    Target PrepareHeadless => _ => _
        .Executes(async () =>
        {
            if (!OperatingSystem.IsLinux()) {
                Log.Warning("Seems like you are running on non-linux os");
                Log.Warning("Factorio headless server will only available for linux!");
            }
            var requiredFactorioVersion = GetRequiredFactorioVersion();
            var headlessPath = Path.Combine("factorio_headless", requiredFactorioVersion.ToString());
            if (!Directory.Exists(headlessPath)) {
                try {
                    Log.Information("Downloading and extracting archive");
                    await using var stream = await Utils.HttpClient.GetStreamAsync(Utils.GetFactorioDownloadLinkForCurrentOs(requiredFactorioVersion.ToString(), "headless", "linux64"));
                    using var reader = ReaderFactory.Open(stream);
                    Directory.CreateDirectory(headlessPath);
                    reader.WriteAllToDirectory(headlessPath, new ExtractionOptions() { ExtractFullPath = true });

                    Log.Information("Factorio extracted");
                    Log.Information("Testing factorio launchability");
                    await EnsureFactorioServerCanLaunch(Path.Combine(headlessPath, "factorio"));
                }
                catch (Exception e) {
                    Log.Fatal(e, "Failed to download factorio headless server");
                    Directory.Delete(headlessPath, true);
                    throw;
                }
            }

            Log.Information("Factorio {RequiredVersion} server downloaded!", requiredFactorioVersion);
        });

    Target EnsureLaunchability => _ => _
        .DependsOn(PrepareHeadless)
        .Executes(async () =>
        {
            var requiredFactorioVersion = GetRequiredFactorioVersion();
            var headlessPath = Path.Combine("factorio_headless", requiredFactorioVersion.ToString(), "factorio");

            // Linking mods
            if (!Directory.Exists(Path.Combine(headlessPath, "mods"))) {
                Directory.CreateSymbolicLink(Path.Combine(headlessPath, "mods"), Path.Combine(RootDirectory, "mods"));
            }

            Log.Information("Testing PARANOIDAL launchability");
            await EnsureFactorioServerCanLaunch(headlessPath);
        });

    Target ZipMods => _ => _
        .Executes(() =>
        {
            var targetDirectory = RootDirectory / "zipped-mods";
            Log.Information("Zipping mods to {TargetDirectory}", targetDirectory);
            FileSystemTasks.EnsureCleanDirectory(targetDirectory);

            var mods = Directory.EnumerateDirectories(RootDirectory / "mods");
            Parallel.ForEach(mods, (modPath, _) =>
            {
                var mod = new FactorioMod(modPath);
                try {
                    var modZipPath = targetDirectory / $"{mod.GetInternalName()}_{mod.GetModVersion()}.zip";
                    Log.Information("Zipping {ModName} to {ModZipPath}", mod.GetInternalName(), modZipPath);
                    Zip(modZipPath, modPath);
                }
                catch (Exception e) {
                    Log.Error("Failed to get version of mod {ModName}, due to {Reason}", mod.GetInternalName(), e.Message);
                }
            });
        });

    Target PullLocalization => _ => _
        .Executes(async () =>
        {
            var stream = await Utils.HttpClient.GetStreamAsync(Utils.LocalizationModFolderPullAddress);
            using var reader = new ZipArchive(stream);

            var paranoidalLocaleFolder = RootDirectory / "mods" / "ParanoidalLocale";
            FileSystemTasks.EnsureCleanDirectory(paranoidalLocaleFolder);
            var zipArchiveEntries = reader.Entries.Where(entry => entry.Length != 0).ToList();
            foreach (var entry in zipArchiveEntries) {
                var filePath = paranoidalLocaleFolder / entry.FullName[46..];
                FileSystemTasks.EnsureExistingParentDirectory(filePath);
                entry.ExtractToFile(filePath);
            }

            Log.Information("Extracted {Count} files", zipArchiveEntries.Count);
        });

    async Task EnsureFactorioServerCanLaunch(string factorioServerLocation) {
        Assert.True(OperatingSystem.IsLinux(), "Factorio can be started only on linux");

        File.Delete(Path.Combine(factorioServerLocation, "non-existent-save"));

        var serverFile = Path.Combine(factorioServerLocation, "bin/x64/factorio");
        Utils.Chmod(serverFile);

        Log.Information("Starting factorio server");
        var processStartInfo = new ProcessStartInfo() {
            UseShellExecute = false,
            FileName = serverFile,
            Arguments = "--start-server non-existent-save",
            RedirectStandardOutput = true,
        };
        using var process = Process.Start(processStartInfo).NotNull("Process.Start(processStartInfo) != null");
        process!.BeginOutputReadLine();

        var factorioInitialized = false;
        Log.Debug("Redirection Factorio output:");
        process!.OutputDataReceived += (sender, args) =>
        {
            if (args.Data == null) return;
            Log.Debug("{FactorioLogEntry}", args.Data);
            if (args.Data.Contains("Factorio initialised")) {
                factorioInitialized = true;
                // ReSharper disable once AccessToDisposedClosure
                process.Kill(true);
            }
        };

        var cancellationTokenSource = new CancellationTokenSource(TimeSpan.FromMinutes(15));
        try {
            await process.WaitForExitAsync(cancellationTokenSource.Token);
        }
        catch (TaskCanceledException) {
            Log.Error("Process hasn't started in 15 minutes. Aborting");
            process.Kill();
            throw;
        }

        if (!factorioInitialized) {
            throw new Exception("Factorio dont start successfully");
        }
    }

    Version GetRequiredFactorioVersion() {
        RootDirectory.NotNull("Git repository not found");
        var paranoidalRepository = new ParanoidalRepository(RootDirectory);
        var coreModPath = paranoidalRepository.LocateMod(ParanoidalRepository.CoreModeName).NotNull("Cannot locate core mod")!;
        var coreMod = new FactorioMod(coreModPath);
        return coreMod.GetDependsOnFactorioVersion();
    }
}