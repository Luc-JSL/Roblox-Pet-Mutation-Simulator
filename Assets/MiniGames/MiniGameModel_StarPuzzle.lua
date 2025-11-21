-- MiniGameModel_StarPuzzle.lua
-- Unique model for Star Puzzle mini-game

local MiniGameModel = {}

MiniGameModel.Name = "Star Puzzle"
MiniGameModel.Mesh = {
    Shape = "Puzzle Board",
    Material = "Starlight Wood",
    Color = {R = 0.7, G = 0.8, B = 1.0},
    Glow = true,
    UniqueFeatures = {"Animated Stars", "Puzzle Lights"}
}

MiniGameModel.Animations = {
    Idle = "PuzzleIdle",
    Solve = "PuzzleSolve"
}

MiniGameModel.Reward = "Starlight Trait"

return MiniGameModel
