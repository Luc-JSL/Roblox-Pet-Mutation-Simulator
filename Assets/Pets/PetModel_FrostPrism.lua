-- PetModel_FrostPrism.lua
-- Unique 3D model definition for Frost Prism pet

local PetModel = {}

PetModel.Name = "Frost Prism"
PetModel.Mesh = {
    Shape = "Crystal Fox",
    Material = "Frosted Glass",
    Color = {R = 0.7, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Prismatic Tail", "Glowing Eyes", "Snowflake Aura"}
}

PetModel.Animations = {
    Idle = "FrostIdle",
    Walk = "FrostWalk",
    Special = "PrismPulse"
}

PetModel.Abilities = {
    "Freeze Touch",
    "Prism Shield"
}

return PetModel
