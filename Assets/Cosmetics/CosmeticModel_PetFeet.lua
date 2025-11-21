-- CosmeticModel_PetFeet.lua
-- Unique pet feet cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Thunder Feet"
CosmeticModel.Mesh = {
    Shape = "Feet",
    Material = "Thunder Stone",
    Color = {R = 0.9, G = 0.9, B = 0.3},
    Glow = true,
    UniqueFeatures = {"Electric Sparks", "Animated Step"}
}

return CosmeticModel
