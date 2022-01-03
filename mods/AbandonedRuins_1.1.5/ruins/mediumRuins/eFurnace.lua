return
{
  variables =
  {
    {name = "random-belt", type = "entity-expression", value = {type = "random-of-entity-type", entity_type = "transport-belt"}},
    {name = "random-inserter", type = "entity-expression", value = {type = "random-from-list", list = {"inserter", "fast-inserter", "stack-inserter", "filter-inserter"}}},
  },
  entities =
  {
    {{type = "variable", name = "random-belt"}, {x = -3.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -2.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -1.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -0.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 0.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 1.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 2.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 3.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 4.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 5.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 6.5, y = -6.5}, {dir = "west", dead = 0.2}},
    {"medium-electric-pole-remnants", {x = -4.5, y = -5.5}, {}},
    {"electric-furnace", {x = -4.5, y = -3.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -3.5, y = -5.5}, {dead = 0.2}},
    {"electric-furnace", {x = -1.5, y = -3.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -1.5, y = -5.5}, {dead = 0.2}},
    {"electric-furnace", {x = 1.5, y = -3.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 2.5, y = -5.5}, {dead = 0.2}},
    {"electric-furnace", {x = 4.5, y = -3.5}, {dead = 0.2}},
    {"medium-electric-pole-remnants", {x = 4.5, y = -5.5}, {}},
    {{type = "variable", name = "random-inserter"}, {x = 5.5, y = -5.5}, {dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -7.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -6.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -5.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -4.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -3.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -2.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -2.5, y = -1.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -3.5, y = -1.5}, {dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -1.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -0.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 0.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 1.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 0.5, y = -1.5}, {dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 2.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 3.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 3.5, y = -1.5}, {dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 4.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 5.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 6.5, y = -0.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -4.5, y = 0.5}, {dir = "south", dead = 0.2}},
    {"electric-furnace", {x = -4.5, y = 2.5}, {dead = 0.2}},
    {"medium-electric-pole-remnants", {x = -3.5, y = 0.5}, {}},
    {"electric-furnace", {x = -1.5, y = 2.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -0.5, y = 0.5}, {dir = "south", dead = 0.2}},
    {"medium-electric-pole-remnants", {x = 1.5, y = 0.5}, {}},
    {{type = "variable", name = "random-inserter"}, {x = 0.5, y = 0.5}, {dir = "south", dead = 0.2}},
    {"electric-furnace", {x = 1.5, y = 2.5}, {dead = 0.2}},
    {"electric-furnace", {x = 4.5, y = 2.5}, {dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 4.5, y = 0.5}, {dir = "south", dead = 0.2}},
    {"medium-electric-pole-remnants", {x = -4.5, y = 4.5}, {}},
    {{type = "variable", name = "random-belt"}, {x = -4.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -2.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -3.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -3.5, y = 4.5}, {dir = "south", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = -2.5, y = 4.5}, {dir = "south", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -0.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = -1.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {"medium-electric-pole-remnants", {x = 1.5, y = 4.5}, {}},
    {{type = "variable", name = "random-belt"}, {x = 1.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 0.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 0.5, y = 4.5}, {dir = "south", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 3.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 2.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 5.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 4.5, y = 5.5}, {dir = "west", dead = 0.2}},
    {{type = "variable", name = "random-inserter"}, {x = 4.5, y = 4.5}, {dir = "south", dead = 0.2}},
    {{type = "variable", name = "random-belt"}, {x = 6.5, y = 5.5}, {dir = "west", dead = 0.2}},
  },
}
