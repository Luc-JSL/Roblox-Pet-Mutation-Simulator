-- MiniGames.lua
-- Handles mini-games and daily challenges

local MiniGames = {}

MiniGames.Games = {
    {Name = "Race Arena", Reward = "Speed Trait"},
    {Name = "Puzzle Zone", Reward = "Intelligence Trait"},
    {Name = "Battle Challenge", Reward = "Mutation Capsule"}
}

MiniGames.DailyQuests = {
    "Collect 3 rare mutation materials",
    "Level a pet to stage 3",
    "Win a race arena mini-game"
}

return MiniGames
