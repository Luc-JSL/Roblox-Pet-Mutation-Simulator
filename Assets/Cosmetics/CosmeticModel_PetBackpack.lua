-- CosmeticModel_PetBackpack.lua
-- Unique pet backpack cosmetic asset

local CosmeticModel = {}

CosmeticModel.Name = "Adventure Backpack"
CosmeticModel.Mesh = {
    Shape = "Backpack",
    Material = "Explorer Canvas",
    Color = {R = 0.4, G = 0.3, B = 0.2},
    Glow = false,
    UniqueFeatures = {"Animated Flap", "Hidden Pockets"}
}

return CosmeticModel
