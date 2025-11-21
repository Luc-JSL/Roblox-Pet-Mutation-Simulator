-- StarlightGem.lua
-- Unique model for Starlight Gem item

local StarlightGem = {}

StarlightGem.Name = "Starlight Gem"
StarlightGem.Mesh = {
    Shape = "Gem",
    Material = "Starlight Crystal",
    Color = {R = 0.8, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Shine", "Light Pulse"}
}

return StarlightGem
