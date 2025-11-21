-- PetModel_SolarLion.lua
-- Placeholder model for Solar Lion pet

local PetModel = {}

PetModel.Name = "Solar Lion"
PetModel.Mesh = {
    Shape = "Lion",
    Material = "Solar Fiber",
    Color = {R = 1.0, G = 0.8, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Radiant Mane", "Light Burst"}
}

PetModel.Animations = {
    Idle = "LionIdle",
    Roar = "LionRoar"
}

PetModel.Abilities = {
    "Sun Roar",
    "Solar Shield"
}

return PetModel
