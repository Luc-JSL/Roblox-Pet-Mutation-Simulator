-- CosmeticModel_Trail.lua
-- Unique cosmetic trail asset for pets

local CosmeticModel = {}

CosmeticModel.Name = "Lightning Trail"
CosmeticModel.Mesh = {
    Shape = "Trail",
    Material = "Electric Spark",
    Color = {R = 0.9, G = 0.9, B = 0.3},
    Glow = true,
    UniqueFeatures = {"Animated Lightning", "Sparkle Effect"}
}

return CosmeticModel
