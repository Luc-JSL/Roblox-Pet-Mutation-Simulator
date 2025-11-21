-- HomeModel_MysticTreehouse.lua
-- Unique model for Mystic Treehouse pet home

local HomeModel = {}

HomeModel.Name = "Mystic Treehouse"
HomeModel.Mesh = {
    Shape = "Treehouse",
    Material = "Mystic Wood",
    Color = {R = 0.3, G = 0.7, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Animated Leaves", "Floating Platforms"}
}

return HomeModel
