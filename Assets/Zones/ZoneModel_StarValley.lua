-- ZoneModel_StarValley.lua
-- Placeholder model for Star Valley zone

local ZoneModel = {}

ZoneModel.Name = "Star Valley"
ZoneModel.Mesh = {
    Shape = "Valley",
    Material = "Starlight Grass",
    Color = {R = 0.6, G = 0.7, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Twinkling Stars", "Animated Sky"}
}

ZoneModel.Animations = {
    Idle = "ValleyIdle",
    Shine = "ValleyShine"
}

ZoneModel.ExclusiveMutation = "Solar Lion"

return ZoneModel
