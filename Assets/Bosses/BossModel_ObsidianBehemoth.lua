-- BossModel_ObsidianBehemoth.lua
-- Placeholder model for Obsidian Behemoth boss

local BossModel = {}

BossModel.Name = "Obsidian Behemoth"
BossModel.Mesh = {
    Shape = "Giant Behemoth",
    Material = "Obsidian Rock",
    Color = {R = 0.1, G = 0.1, B = 0.2},
    Glow = false,
    UniqueFeatures = {"Cracking Armor", "Earthquake Stomp"}
}

BossModel.Animations = {
    Idle = "BehemothIdle",
    Smash = "BehemothSmash"
}

BossModel.Abilities = {
    "Obsidian Slam",
    "Armor Up"
}

return BossModel
