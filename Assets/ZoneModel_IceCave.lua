-- ZoneModel_IceCave.lua
-- Unique 3D model definition for Ice Cave zone

local ZoneModel = {}

ZoneModel.Name = "Ice Cave"
ZoneModel.Mesh = {
    Shape = "Cave",
    Material = "Ice Crystal",
    Color = {R = 0.6, G = 0.9, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Icicle Columns", "Frozen Lake", "Crystal Formations"}
}

ZoneModel.Animations = {
    Idle = "IceCaveIdle",
    Freeze = "IceCaveFreeze"
}

ZoneModel.ExclusiveMutation = "Frost Prism"

return ZoneModel
