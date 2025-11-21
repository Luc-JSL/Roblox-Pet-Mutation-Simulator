-- BossModel_CelestialSerpent.lua
-- Unique model for Celestial Serpent boss

local BossModel = {}

BossModel.Name = "Celestial Serpent"
BossModel.Mesh = {
    Shape = "Serpent",
    Material = "Celestial Scale",
    Color = {R = 0.7, G = 0.8, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Star Frill", "Comet Tail", "Glowing Eyes"}
}

BossModel.Animations = {
    Idle = "SerpentIdle",
    Strike = "SerpentStrike",
    Coil = "SerpentCoil"
}

BossModel.Abilities = {
    "Comet Strike",
    "Celestial Shield"
}

return BossModel
