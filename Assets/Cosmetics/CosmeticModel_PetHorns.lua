-- CosmeticModel_PetHorns.lua
-- Unique pet horns cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Crystal Horns"
CosmeticModel.Mesh = {
    Shape = "Horns",
    Material = "Crystal",
    Color = {R = 0.7, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Growth", "Light Refraction"}
}

return CosmeticModel
