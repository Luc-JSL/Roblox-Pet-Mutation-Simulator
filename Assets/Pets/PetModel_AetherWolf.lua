-- PetModel_AetherWolf.lua
-- Unique model for Aether Wolf pet

local PetModel = {}

PetModel.Name = "Aether Wolf"
PetModel.Mesh = {
    Shape = "Wolf",
    Material = "Aether Mist",
    Color = {R = 0.5, G = 0.7, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Floating Fur", "Glowing Eyes", "Mist Tail"}
}

PetModel.Animations = {
    Idle = "WolfIdle",
    Howl = "WolfHowl",
    Run = "WolfRun"
}

PetModel.Abilities = {
    "Mist Dash",
    "Aether Shield"
}

return PetModel
