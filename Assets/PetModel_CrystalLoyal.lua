-- PetModel_CrystalLoyal.lua
-- Unique 3D model definition for the premium Crystal Loyal pet

local PetModel = {}

PetModel.Name = "Crystal Loyal"
PetModel.Mesh = {
    Shape = "Quadruped",
    Material = "Crystal",
    Color = {R = 0.5, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Gem Horns", "Tail Prism", "Animated Aura"}
}

PetModel.Animations = {
    Idle = "CrystalIdle",
    Walk = "CrystalWalk",
    Special = "AuraPulse"
}

PetModel.Abilities = {
    "Mutation Boost",
    "Loyalty Shield"
}

return PetModel
