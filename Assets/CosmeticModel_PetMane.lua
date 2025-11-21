-- CosmeticModel_PetMane.lua
-- Unique pet mane cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Solar Mane"
CosmeticModel.Mesh = {
    Shape = "Mane",
    Material = "Solar Fiber",
    Color = {R = 1.0, G = 0.8, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Animated Flames", "Light Burst"}
}

return CosmeticModel
