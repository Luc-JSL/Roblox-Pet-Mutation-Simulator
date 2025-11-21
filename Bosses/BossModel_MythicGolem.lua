-- BossModel_MythicGolem.lua
-- Unique 3D model definition for Mythic Golem boss

local BossModel = {}

BossModel.Name = "Mythic Golem"
BossModel.Mesh = {
    Shape = "Stone Giant",
    Material = "Mythic Stone",
    Color = {R = 0.6, G = 0.5, B = 0.4},
    Glow = true,
    UniqueFeatures = {"Animated Cracks", "Glowing Runes", "Earthquake Effect"}
}

BossModel.Animations = {
    Idle = "GolemIdle",
    Attack = "GolemSmash",
    Special = "RuneBurst"
}

BossModel.Abilities = {
    "Earthquake",
    "Rune Shield"
}

return BossModel
