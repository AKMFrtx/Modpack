local intermediatemulti = angelsmods.marathon.intermediatemulti

data:extend(
{
  --SILICON
  -- SMELTING INTERMEDIATE
  {
    type = "recipe",
    name = "silica-ore-processing",
    category = "ore-processing",
    subgroup = "angels-silicon",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"quartz", 4}
    },
    results=
    {
      {type="item", name="processed-silica", amount=2},
	  {type="item", name="slag", amount=1, probability=0.3}, --DrD
    },
    main_product= "processed-silica",
    icon = "__angelssmelting__/graphics/icons/processed-silica.png", --DrD
    icon_size = 32,
    order = "b[processed-silica]",
  },
  {
    type = "recipe",
    name = "silica-processed-processing",
    category = "pellet-pressing",
    subgroup = "angels-silicon",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"processed-silica", 3}
    },
    results=
    {
      {type="item", name="pellet-silica", amount=4},
    },
    main_product= "pellet-silica",
    --icon = "__angelssmelting__/graphics/icons/pellet-silica.png",
    icon_size = 32,
    order = "c[pellet-silica]",
  },
  {
    type = "recipe",
    name = "processed-silicon-smelting",
    category = "chemical-smelting",
    subgroup = "angels-silicon",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="item", name="processed-silica", amount=8},
      {type="fluid", name="gas-hydrogen-chloride", amount=60},
    },
    results=
    {
      {type="fluid", name="liquid-trichlorosilane", amount=120},
      {type="fluid", name="gas-hydrogen", amount=30},
    },
    main_product= "liquid-trichlorosilane",
    icon_size = 32,
    order = "d[liquid-trichlorosilane]",
  },
  {
    type = "recipe",
    name = "pellet-silicon-smelting",
    category = "chemical-smelting",
    subgroup = "angels-silicon",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="item", name="pellet-silica", amount=8},
      {type="item", name="ingot-aluminium", amount=6},
      {type="fluid", name="gas-hydrogen", amount=60},
    },
    results=
    {
      {type="fluid", name="gas-silane", amount=120},
      {type="item", name="solid-aluminium-oxide", amount=6},
    },
    main_product= "gas-silane",
    icon_size = 32,
    order = "e[gas-silane]",
  },
  -- SMELTING RESULTS
  {
    type = "recipe",
    name = "silicon-ore-smelting",
    category = "blast-smelting",
    subgroup = "angels-silicon",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="item", name="quartz", amount=24},
      {type="item", name="solid-carbon", amount=6},
    },
    results=
    {
      {type="item", name="ingot-silicon", amount=24},
    },
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/ingot-silicon.png",
      },
      {
        icon = "__angelspetrochem__/graphics/icons/num_1.png",
        tint = angelsmods.smelting.number_tint,
        scale = 0.32,
        shift = {-12, -12},
      },
    },
    icon_size = 32,
    order = "f[ingot-silicon]-a",
  },
  {
    type = "recipe",
    name = "liquid-trichlorosilane-smelting",
    category = "chemical-smelting",
    subgroup = "angels-silicon",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="liquid-trichlorosilane", amount=90},
      {type="item", name="ingot-silicon", amount=6},
    },
    results=
    {
      {type="item", name="ingot-silicon", amount=24},
    },
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/ingot-silicon.png",
      },
      {
        icon = "__angelspetrochem__/graphics/icons/num_2.png",
        tint = angelsmods.smelting.number_tint,
        scale = 0.32,
        shift = {-12, -12},
      },
    },
    icon_size = 32,
    order = "f[ingot-silicon]-b",
  },
  {
    type = "recipe",
    name = "gas-silane-smelting",
    category = "chemical-smelting",
    subgroup = "angels-silicon",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="fluid", name="gas-silane", amount=90},
      {type="item", name="ingot-silicon", amount=6},
    },
    results=
    {
      {type="item", name="ingot-silicon", amount=24},
    },
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/ingot-silicon.png",
      },
      {
        icon = "__angelspetrochem__/graphics/icons/num_3.png",
        tint = angelsmods.smelting.number_tint,
        scale = 0.32,
        shift = {-12, -12},
      },
    },
    icon_size = 32,
    order = "f[ingot-silicon]-c",
  },
  {
    type = "recipe",
    name = "powder-silicon",
    category = "advanced-crafting",
    subgroup = "angels-silicon",
    energy_required = 0.5,
    enabled = "false",
    ingredients =
    {
      {type="item", name="ingot-silicon", amount=1},
    },
    results =
    {
      {type="item", name="powder-silicon", amount=1},
    },
    icon_size = 32,
    order = "g[powder-silicon]",
  },
  -- CASTING INTERMEDIATE
  {
    type = "recipe",
    name = "molten-silicon-smelting",
    category = "induction-smelting",
    subgroup = "angels-silicon-casting",
    energy_required = 4,
    enabled = "false",
    ingredients =
    {
      {type="item", name="ingot-silicon", amount=12},
    },
    results=
    {
      {type="fluid", name="liquid-molten-silicon", amount=120},
    },
    main_product= "liquid-molten-silicon",
    --icon = "__angelssmelting__/graphics/icons/molten-silicon.png",
    icon_size = 32,
    order = "h[liquid-molten-silicon]",
  },
  {
    type = "recipe",
    name = "angels-mono-silicon-seed",
    category = "casting",
    subgroup = "angels-silicon-casting",
    normal =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=5},
        {type="fluid", name="gas-nitrogen", amount=10}        
      },
      results=
      {
        {type="item", name="angels-mono-silicon-seed", amount=5}
      },
    },
    expensive =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=6 * intermediatemulti},
        {type="fluid", name="gas-nitrogen", amount=10 * intermediatemulti}        
      },
      results=
      {
        {type="item", name="angels-mono-silicon-seed", amount=5}
      },
    },
    icon_size = 32,
    order = "i[angels-mono-silicon-seed]",
  },
  {
    type = "recipe",
    name = "angels-quartz-crucible",
    category = "crafting",
    subgroup = "angels-silicon-casting",
    normal =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="item", name="quartz", amount=1}
      },
      results=
      {
        {type="item", name="angels-quartz-crucible", amount=1}
      },
    },
    expensive =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="item", name="quartz", amount=1 * intermediatemulti}
      },
      results=
      {
        {type="item", name="angels-quartz-crucible", amount=1}
      },
    },
    icon_size = 32,
    order = "j[angels-quartz-crucible]",
    },
  -- CASTING RESULT
  {
    type = "recipe",
    name = "angels-mono-silicon-1",
    category = "casting",
    subgroup = "angels-silicon-casting",
    normal =
    {
      enabled = "false",
      energy_required = 6,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=40},
        {type="item", name="angels-mono-silicon-seed", amount=1}
      },
      results=
      {
        {type="item", name="angels-mono-silicon", amount=4}
      },
    },
    expensive =
    {
      enabled = "false",
      energy_required = 6,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=40 * intermediatemulti},
        {type="item", name="angels-mono-silicon-seed", amount=1}
      },
      results=
      {
        {type="item", name="angels-mono-silicon", amount=4}
      },
    },
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/silicon-mono.png",
      },
      {
        icon = "__angelspetrochem__/graphics/icons/num_1.png",
        tint = angelsmods.smelting.number_tint,
        scale = 0.32,
        shift = {-12, -12},
      },
    },    
    icon_size = 32,
    order = "k[angels-mono-silicon]-a",
  },
  {
    type = "recipe",
    name = "angels-mono-silicon-2",
    category = "casting",
    subgroup = "angels-silicon-casting",
    normal =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=40},
        {type="item", name="angels-quartz-crucible", amount=1},
        {type="item", name="angels-mono-silicon-seed", amount=1}        
      },
      results=
      {
        {type="item", name="angels-mono-silicon", amount=6},
        {type="item", name="angels-quartz-crucible", amount=1, catalyst_amount=1, probability = 0.80}
      },
      main_product = "angels-mono-silicon",
    },
    expensive =
    {
      enabled = "false",
      energy_required = 4,
      ingredients =
      {
        {type="fluid", name="liquid-molten-silicon", amount=50 * intermediatemulti},
        {type="item", name="angels-quartz-crucible", amount=1},
        {type="item", name="angels-mono-silicon-seed", amount=1}
      },
      results=
      {
        {type="item", name="angels-mono-silicon", amount=6},
        {type="item", name="angels-quartz-crucible", amount=1, catalyst_amount=1, probability = 0.80}
      },
      main_product = "angels-mono-silicon",
    },
    icons = {
      {
        icon = "__angelssmelting__/graphics/icons/silicon-mono.png",
      },
      {
        icon = "__angelspetrochem__/graphics/icons/num_2.png",
        tint = angelsmods.smelting.number_tint,
        scale = 0.32,
        shift = {-12, -12},
      },
    },
    icon_size = 32,
    order = "k[angels-mono-silicon]-b",
  },
  {
    type = "recipe",
    name = "angels-silicon-wafer",
    category = "crafting",
    subgroup = "angels-silicon-casting",
    enabled = "false",
    energy_required = 2,
    ingredients =
    {
      {type="item", name="angels-mono-silicon", amount=1}
    },
    results=
    {
      {type="item", name="angels-silicon-wafer", amount_min=1, amount_max=5}
    },
    icon_size = 32,
    order = "l[angels-silicon-wafer]",
  },
  -- order m reserved for bob silicon processing
}
)