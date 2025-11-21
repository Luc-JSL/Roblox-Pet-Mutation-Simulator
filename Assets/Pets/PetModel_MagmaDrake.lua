-- PetModel_MagmaDrake.lua
-- Unique model for Magma Drake pet

local PetModel = {}

PetModel.Name = "Magma Drake"
PetModel.Mesh = {
    Shape = "Dragon",
    Material = "Molten Rock",
    Color = {R = 1.0, G = 0.4, B = 0.1},
    Glow = true,
    UniqueFeatures = {"Lava Wings", "Fire Breath", "Cracking Scales"}
}

PetModel.Animations = {
    Idle = "DrakeIdle",
    Fly = "DrakeFly",
    Attack = "DrakeFire"
}

PetModel.Abilities = {
    "Lava Burst",
    "Molten Armor"
}

return PetModel
