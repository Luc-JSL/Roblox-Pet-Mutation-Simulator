-- CosmeticModel_Wings.lua
-- Unique cosmetic wings asset for pets

local CosmeticModel = {}

CosmeticModel.Name = "Aurora Wings"
CosmeticModel.Mesh = {
    Shape = "Wings",
    Material = "Aurora Feather",
    Color = {R = 0.5, G = 0.8, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Color Flow", "Light Trails"}
}

return CosmeticModel
