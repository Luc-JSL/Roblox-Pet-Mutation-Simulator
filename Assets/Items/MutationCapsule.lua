-- MutationCapsule.lua
-- Unique asset for mutation capsule item

local MutationCapsule = {}

MutationCapsule.Name = "Mutation Capsule"
MutationCapsule.Mesh = {
    Shape = "Capsule",
    Material = "Gene Glass",
    Color = {R = 0.8, G = 0.2, B = 0.8},
    Glow = true,
    UniqueFeatures = {"Animated DNA", "Particle Swirl"}
}

return MutationCapsule
