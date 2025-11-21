-- BossModel_Leviathan.lua
-- Unique 3D model definition for Leviathan boss

local BossModel = {}

BossModel.Name = "Leviathan"
BossModel.Mesh = {
    Shape = "Sea Serpent",
    Material = "Abyssal Scale",
    Color = {R = 0.1, G = 0.3, B = 0.7},
    Glow = true,
    UniqueFeatures = {"Animated Waves", "Glowing Eyes", "Water Aura"}
}

BossModel.Animations = {
    Idle = "LeviathanIdle",
    Attack = "LeviathanBite",
    Special = "TsunamiCrash"
}

BossModel.Abilities = {
    "Tsunami",
    "Abyssal Shield"
}

return BossModel
