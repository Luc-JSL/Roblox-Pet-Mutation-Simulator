-- MiniGameModel_RaceArena.lua
-- Unique 3D model definition for Race Arena mini-game

local MiniGameModel = {}

MiniGameModel.Name = "Race Arena"
MiniGameModel.Mesh = {
    Shape = "Track",
    Material = "Speed Alloy",
    Color = {R = 0.9, G = 0.9, B = 0.2},
    Glow = true,
    UniqueFeatures = {"Speed Boost Pads", "Animated Scoreboard", "Spectator Stands"}
}

MiniGameModel.Animations = {
    Idle = "ArenaIdle",
    Race = "ArenaRace"
}

MiniGameModel.Reward = "Speed Trait"

return MiniGameModel
