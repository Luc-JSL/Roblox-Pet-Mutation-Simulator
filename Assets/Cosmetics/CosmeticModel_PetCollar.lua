-- CosmeticModel_PetCollar.lua
-- Unique pet collar cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Royal Collar"
CosmeticModel.Mesh = {
    Shape = "Collar",
    Material = "Royal Velvet",
    Color = {R = 0.6, G = 0.2, B = 0.8},
    Glow = true,
    UniqueFeatures = {"Gem Studs", "Animated Shine"}
}

return CosmeticModel
