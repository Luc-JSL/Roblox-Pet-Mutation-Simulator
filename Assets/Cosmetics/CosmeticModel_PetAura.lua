-- CosmeticModel_PetAura.lua
-- Unique pet aura cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Celestial Aura"
CosmeticModel.Mesh = {
    Shape = "Aura",
    Material = "Starlight",
    Color = {R = 0.8, G = 0.7, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Sparkles", "Orbiting Stars"}
}

return CosmeticModel
