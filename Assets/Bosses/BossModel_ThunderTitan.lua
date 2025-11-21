-- BossModel_ThunderTitan.lua
-- Unique model for Thunder Titan boss

local BossModel = {}

BossModel.Name = "Thunder Titan"
BossModel.Mesh = {
    Shape = "Titan",
    Material = "Thunder Stone",
    Color = {R = 0.9, G = 0.9, B = 0.3},
    Glow = true,
    UniqueFeatures = {"Electric Aura", "Lightning Fists", "Storm Crown"}
}

BossModel.Animations = {
    Idle = "TitanIdle",
    Smash = "TitanSmash",
    Charge = "TitanCharge"
}

BossModel.Abilities = {
    "Lightning Slam",
    "Storm Shield"
}

return BossModel
