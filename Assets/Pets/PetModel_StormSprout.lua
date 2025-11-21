-- PetModel_StormSprout.lua
-- Unique 3D model definition for Storm Sprout pet

local PetModel = {}

PetModel.Name = "Storm Sprout"
PetModel.Mesh = {
    Shape = "Plant Dragon",
    Material = "Bio-Electric Vine",
    Color = {R = 0.3, G = 0.8, B = 0.5},
    Glow = true,
    UniqueFeatures = {"Lightning Leaves", "Root Wings", "Storm Aura"}
}

PetModel.Animations = {
    Idle = "SproutIdle",
    Fly = "SproutFly",
    Special = "StormBurst"
}

PetModel.Abilities = {
    "Thunder Strike",
    "Root Heal"
}

return PetModel
