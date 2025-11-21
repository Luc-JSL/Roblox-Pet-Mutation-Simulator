-- ExplorationZones.lua
-- Handles unique biomes and seasonal mutation events

local ExplorationZones = {}

ExplorationZones.Biomes = {
    {Name = "Volcano", ExclusiveMutation = "Magma Drake"},
    {Name = "Ice Cave", ExclusiveMutation = "Frost Prism"},
    {Name = "Enchanted Forest", ExclusiveMutation = "Storm Sprout"}
}

ExplorationZones.SeasonalEvents = {
    {Event = "Mutation Storm", Effect = "Randomize all pet traits"},
    {Event = "Legendary Roam", Effect = "Spawn rare creatures"}
}

return ExplorationZones
