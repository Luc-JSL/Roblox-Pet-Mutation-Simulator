-- MiniGameModel_PuzzleZone.lua
-- Unique 3D model definition for Puzzle Zone mini-game

local MiniGameModel = {}

MiniGameModel.Name = "Puzzle Zone"
MiniGameModel.Mesh = {
    Shape = "Maze",
    Material = "Puzzle Stone",
    Color = {R = 0.7, G = 0.7, B = 0.9},
    Glow = true,
    UniqueFeatures = {"Moving Walls", "Hidden Switches", "Animated Lights"}
}

MiniGameModel.Animations = {
    Idle = "PuzzleIdle",
    Solve = "PuzzleSolve"
}

MiniGameModel.Reward = "Intelligence Trait"

return MiniGameModel
