-- BossModel_MutantHydra.lua
-- Unique 3D model definition for the Mutant Hydra boss

local BossModel = {}

BossModel.Name = "Mutant Hydra"
BossModel.Mesh = {
    Shape = "Serpentine Hydra",
    Material = "Bio-Metal",
    Color = {R = 0.3, G = 0.8, B = 0.4},
    Glow = true,
    UniqueFeatures = {"Regenerating Heads", "Toxic Spikes", "Animated Venom Flow"}
}

BossModel.Animations = {
    Idle = "HydraIdle",
    Attack = "HydraBite",
    Special = "VenomSpray"
}

BossModel.Abilities = {
    "Mutation Boost Weakness",
    "Venom Shield"
}

return BossModel
