-- CosmeticModel_MoonCrown.lua
-- Unique cosmetic model for Moon Crown

local CosmeticModel = {}

CosmeticModel.Name = "Moon Crown"
CosmeticModel.Mesh = {
    Shape = "Crown",
    Material = "Moon Silver",
    Color = {R = 0.9, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Moonlight", "Floating Orbs"}
}

return CosmeticModel
