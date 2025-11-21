-- MutationChamberModel.lua
-- Unique 3D model definition for the mutation chamber

local MutationChamberModel = {}

MutationChamberModel.Name = "Quantum Mutation Chamber"
MutationChamberModel.Mesh = {
    Shape = "Spherical Capsule",
    Material = "Translucent Alloy",
    Color = {R = 0.2, G = 0.7, B = 0.9},
    Glow = true,
    UniqueFeatures = {"Rotating DNA Helix", "Animated Energy Core", "Gene Particle Effects"}
}

MutationChamberModel.Animations = {
    Idle = "ChamberIdle",
    Activate = "GeneFusionPulse"
}

MutationChamberModel.Interaction = {
    Sliders = {"Heat", "Energy", "DNAMixRate"},
    Effects = {"Random Mutation Sparks", "Trait Reveal Flash"}
}

return MutationChamberModel
