-- CosmeticModel_PetEyes.lua
-- Unique pet eyes cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Mystic Eyes"
CosmeticModel.Mesh = {
    Shape = "Eyes",
    Material = "Mystic Gem",
    Color = {R = 0.2, G = 0.9, B = 0.8},
    Glow = true,
    UniqueFeatures = {"Animated Shine", "Color Shift"}
}

return CosmeticModel
