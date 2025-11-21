-- ZoneModel_Volcano.lua
-- Unique 3D model definition for Volcano zone

local ZoneModel = {}

ZoneModel.Name = "Volcano"
ZoneModel.Mesh = {
    Shape = "Mountain",
    Material = "Lava Rock",
    Color = {R = 0.8, G = 0.3, B = 0.1},
    Glow = true,
    UniqueFeatures = {"Flowing Lava", "Smoke Plumes", "Erupting Crater"}
}

ZoneModel.Animations = {
    Idle = "VolcanoIdle",
    Erupt = "VolcanoErupt"
}

ZoneModel.ExclusiveMutation = "Magma Drake"

return ZoneModel
