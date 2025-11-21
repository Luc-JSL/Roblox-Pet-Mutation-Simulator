-- CosmeticModel_PetWhiskers.lua
-- Unique pet whiskers cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Starlight Whiskers"
CosmeticModel.Mesh = {
    Shape = "Whiskers",
    Material = "Starlight Thread",
    Color = {R = 0.9, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Twinkle", "Light Trails"}
}

return CosmeticModel
