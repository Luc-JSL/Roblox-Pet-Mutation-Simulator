-- CosmeticModel_SolarCape.lua
-- Unique cosmetic model for Solar Cape

local CosmeticModel = {}

CosmeticModel.Name = "Solar Cape"
CosmeticModel.Mesh = {
    Shape = "Cape",
    Material = "Solar Fiber",
    Color = {R = 1.0, G = 0.8, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Animated Flames", "Light Burst"}
}

return CosmeticModel
