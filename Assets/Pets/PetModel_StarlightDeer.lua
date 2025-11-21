-- PetModel_StarlightDeer.lua
-- Unique model for Starlight Deer pet

local PetModel = {}

PetModel.Name = "Starlight Deer"
PetModel.Mesh = {
    Shape = "Deer",
    Material = "Starlight Crystal",
    Color = {R = 0.8, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Glowing Antlers", "Star Aura", "Crystal Hooves"}
}

PetModel.Animations = {
    Idle = "DeerIdle",
    Leap = "DeerLeap",
    Shine = "DeerShine"
}

PetModel.Abilities = {
    "Star Leap",
    "Crystal Shield"
}

return PetModel
