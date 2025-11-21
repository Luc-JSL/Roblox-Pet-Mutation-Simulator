-- BossModel_PhoenixEmperor.lua
-- Unique 3D model definition for Phoenix Emperor boss

local BossModel = {}

BossModel.Name = "Phoenix Emperor"
BossModel.Mesh = {
    Shape = "Fiery Bird",
    Material = "Molten Feather",
    Color = {R = 1.0, G = 0.5, B = 0.1},
    Glow = true,
    UniqueFeatures = {"Animated Flames", "Regenerating Wings", "Fire Aura"}
}

BossModel.Animations = {
    Idle = "PhoenixIdle",
    Attack = "PhoenixStrike",
    Special = "RebirthFlare"
}

BossModel.Abilities = {
    "Rebirth",
    "Fire Shield"
}

return BossModel
