-- ZoneModel_EnchantedForest.lua
-- Unique 3D model definition for Enchanted Forest zone

local ZoneModel = {}

ZoneModel.Name = "Enchanted Forest"
ZoneModel.Mesh = {
    Shape = "Forest",
    Material = "Magic Wood",
    Color = {R = 0.2, G = 0.7, B = 0.3},
    Glow = true,
    UniqueFeatures = {"Glowing Mushrooms", "Animated Trees", "Mystic Mist"}
}

ZoneModel.Animations = {
    Idle = "ForestIdle",
    Bloom = "ForestBloom"
}

ZoneModel.ExclusiveMutation = "Storm Sprout"

return ZoneModel
