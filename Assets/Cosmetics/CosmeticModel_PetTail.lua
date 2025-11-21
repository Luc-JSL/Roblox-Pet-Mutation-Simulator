-- CosmeticModel_PetTail.lua
-- Unique pet tail cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Dragon Tail"
CosmeticModel.Mesh = {
    Shape = "Tail",
    Material = "Dragon Scale",
    Color = {R = 0.6, G = 0.2, B = 0.1},
    Glow = true,
    UniqueFeatures = {"Animated Movement", "Fire Tip"}
}

return CosmeticModel
