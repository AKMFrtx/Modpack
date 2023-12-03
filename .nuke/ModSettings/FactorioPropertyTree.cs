using System;
using System.Collections.Generic;
using System.Linq;

namespace ModSettings;

public class FactorioPropertyTree {
    FactorioPropertyTree(FactorioPropertyTreeType type, object? value) {
        Type = type;
        Value = value;
    }

    public static FactorioPropertyTree CreateNone()
        => new(FactorioPropertyTreeType.None, null);

    public static FactorioPropertyTree Create(double value)
        => new(FactorioPropertyTreeType.Number, value);

    public static FactorioPropertyTree Create(bool value)
        => new(FactorioPropertyTreeType.Bool, value);

    public static FactorioPropertyTree Create(string value)
        => new(FactorioPropertyTreeType.String, value);

    public static FactorioPropertyTree Create(IEnumerable<FactorioPropertyTree> value)
        => new(FactorioPropertyTreeType.List, value.ToList());

    public static FactorioPropertyTree Create(IReadOnlyDictionary<string, FactorioPropertyTree> value)
        => new(FactorioPropertyTreeType.Dictionary, value.ToDictionary());

    public static FactorioPropertyTree ReadFromStream(ModSettingsSteamReader streamReader) {
        var type = (FactorioPropertyTreeType)streamReader.ReadByte();
        _ = streamReader.ReadBool();

        object? content = type switch {
            FactorioPropertyTreeType.None       => null,
            FactorioPropertyTreeType.Bool       => streamReader.ReadBool(),
            FactorioPropertyTreeType.Number     => streamReader.ReadDouble(),
            FactorioPropertyTreeType.String     => streamReader.ReadString(),
            FactorioPropertyTreeType.List       => streamReader.ReadList(),
            FactorioPropertyTreeType.Dictionary => streamReader.ReadDictionary(),
            _                                   => throw new ArgumentOutOfRangeException(nameof(type), "No such PropertyTree type supported")
        };

        return new FactorioPropertyTree(type, content);
    }

    public void WriteToStream(ModSettingsStreamWriter streamWriter) {
        streamWriter.WriteByte((byte)Type);
        streamWriter.WriteBool(false);

        switch (Type) {
            case FactorioPropertyTreeType.None:
                break;
            case FactorioPropertyTreeType.Bool:
                streamWriter.WriteBool(AsBool());
                break;
            case FactorioPropertyTreeType.Number:
                streamWriter.WriteDouble(AsNumber());
                break;
            case FactorioPropertyTreeType.String:
                streamWriter.WriteString(AsString());
                break;
            case FactorioPropertyTreeType.List:
                streamWriter.WriteList(AsList());
                break;
            case FactorioPropertyTreeType.Dictionary:
                streamWriter.WriteDictionary(AsDictionary());
                break;
            default:
                throw new ArgumentOutOfRangeException();
        }
    }

    public FactorioPropertyTreeType Type { get; }
    public object? Value { get; }

    public bool AsBool()
        => (bool)Value!;

    public double AsNumber()
        => (double)Value!;

    public string AsString()
        => (string)Value!;

    public IReadOnlyList<FactorioPropertyTree> AsList()
        => (IReadOnlyList<FactorioPropertyTree>)Value!;

    public IReadOnlyDictionary<string, FactorioPropertyTree> AsDictionary()
        => (IReadOnlyDictionary<string, FactorioPropertyTree>)Value!;
}