-- ZoneModel_MoonSanctum.lua
-- Unique model for Moon Sanctum zone

local ZoneModel = {}

ZoneModel.Name = "Moon Sanctum"
ZoneModel.Mesh = {
    Shape = "Sanctum",
    Material = "Moonstone",
    Color = {R = 0.8, G = 0.8, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Moonlight Pillars", "Animated Mist"}
}

ZoneModel.Animations = {
    Idle = "SanctumIdle",
    Glow = "SanctumGlow"
}

ZoneModel.ExclusiveMutation = "Aether Wolf"

return ZoneModel
