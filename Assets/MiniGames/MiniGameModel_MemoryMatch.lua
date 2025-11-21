-- MiniGameModel_MemoryMatch.lua
-- Placeholder model for Memory Match mini-game

local MiniGameModel = {}

MiniGameModel.Name = "Memory Match"
MiniGameModel.Mesh = {
    Shape = "Card Table",
    Material = "Memory Foam",
    Color = {R = 0.8, G = 0.7, B = 0.5},
    Glow = false,
    UniqueFeatures = {"Animated Cards", "Score Counter"}
}

MiniGameModel.Animations = {
    Idle = "MemoryIdle",
    Flip = "CardFlip"
}

MiniGameModel.Reward = "Memory Trait"

return MiniGameModel
