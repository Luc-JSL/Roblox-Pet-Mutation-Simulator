-- MiniGameModel_BattleChallenge.lua
-- Unique 3D model definition for Battle Challenge mini-game

local MiniGameModel = {}

MiniGameModel.Name = "Battle Challenge"
MiniGameModel.Mesh = {
    Shape = "Arena",
    Material = "Battle Steel",
    Color = {R = 0.6, G = 0.2, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Rotating Platforms", "Animated Barriers", "Battle Effects"}
}

MiniGameModel.Animations = {
    Idle = "BattleIdle",
    Fight = "BattleFight"
}

MiniGameModel.Reward = "Mutation Capsule"

return MiniGameModel
