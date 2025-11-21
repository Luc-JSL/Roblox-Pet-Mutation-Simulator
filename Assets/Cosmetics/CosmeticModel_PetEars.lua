-- CosmeticModel_PetEars.lua
-- Unique pet ears cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Fairy Ears"
CosmeticModel.Mesh = {
    Shape = "Ears",
    Material = "Fairy Silk",
    Color = {R = 0.8, G = 0.6, B = 0.9},
    Glow = true,
    UniqueFeatures = {"Animated Wiggle", "Sparkle Effect"}
}

return CosmeticModel
