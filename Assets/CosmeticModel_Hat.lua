-- CosmeticModel_Hat.lua
-- Unique cosmetic hat asset for pets

local CosmeticModel = {}

CosmeticModel.Name = "Star Crown"
CosmeticModel.Mesh = {
    Shape = "Crown",
    Material = "Gold Star",
    Color = {R = 1.0, G = 0.9, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Animated Stars", "Shimmer Effect"}
}

return CosmeticModel
