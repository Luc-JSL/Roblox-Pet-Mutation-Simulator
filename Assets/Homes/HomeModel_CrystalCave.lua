-- HomeModel_CrystalCave.lua
-- Unique pet home asset: Crystal Cave

local HomeModel = {}

HomeModel.Name = "Crystal Cave"
HomeModel.Mesh = {
    Shape = "Cave",
    Material = "Crystal Stone",
    Color = {R = 0.7, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Glowing Crystals", "Reflective Walls", "Animated Mist"}
}

return HomeModel
