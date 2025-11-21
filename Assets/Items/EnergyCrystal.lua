-- EnergyCrystal.lua
-- Placeholder model for Energy Crystal item

local EnergyCrystal = {}

EnergyCrystal.Name = "Energy Crystal"
EnergyCrystal.Mesh = {
    Shape = "Crystal",
    Material = "Energy Quartz",
    Color = {R = 0.3, G = 0.9, B = 0.7},
    Glow = true,
    UniqueFeatures = {"Animated Spark", "Energy Pulse"}
}

return EnergyCrystal
