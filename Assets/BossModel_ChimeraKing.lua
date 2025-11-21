-- BossModel_ChimeraKing.lua
-- Unique 3D model definition for the Chimera King boss

local BossModel = {}

BossModel.Name = "Chimera King"
BossModel.Mesh = {
    Shape = "Multi-headed Beast",
    Material = "Shadow Crystal",
    Color = {R = 0.1, G = 0.1, B = 0.3},
    Glow = true,
    UniqueFeatures = {"Animated Heads", "Tail Spikes", "Aura of Darkness"}
}

BossModel.Animations = {
    Idle = "ChimeraIdle",
    Attack = "ChimeraStrike",
    Special = "ShadowRoar"
}

BossModel.Abilities = {
    "Boss Slayer Weakness",
    "Shadow Shield"
}

return BossModel
