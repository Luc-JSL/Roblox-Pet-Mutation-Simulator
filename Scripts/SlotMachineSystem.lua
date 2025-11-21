-- SlotMachineSystem.lua
-- Handles slot machine logic, rewards, and odds

local SlotMachineSystem = {}
local SoundManager = require(script.Parent.SoundManager)

SlotMachineSystem.Tiers = {
    Common = {odds = 0.7, rewards = {"Coins", "XP Boost", "Small Mutation"}},
    Rare = {odds = 0.25, rewards = {"Rare Mutation", "Evolution Stone"}},
    Legendary = {odds = 0.05, rewards = {"Hybrid Mutation", "Exclusive Pet", "Super Rare Cosmetic"}}
}

SlotMachineSystem.Specials = {
    Jackpot = {condition = "ThreeLegendary", reward = "Super Rare Mutation"},
    FreeSpin = {condition = "SpecialIcon", reward = "Free Spin"},
    Multiplier = {condition = "MutationCoin", reward = "Extra Coins"}
}

SlotMachineSystem.Seasonal = {
    Winter = {rewards = {"Frost Mutation", "Snowflake Skin"}},
    Halloween = {rewards = {"Shadow Mutation", "Pumpkin Hat"}}
}

function SlotMachineSystem:Spin(isPaid, season)
    local oddsBoost = isPaid and 0.15 or 0
    local tierRoll = math.random()
    local tier = "Common"
    if tierRoll > (self.Tiers.Common.odds - oddsBoost) then
        tier = tierRoll > (self.Tiers.Common.odds + self.Tiers.Rare.odds - oddsBoost) and "Legendary" or "Rare"
    end
    local rewards = self.Tiers[tier].rewards
    if season and self.Seasonal[season] then
        for _, r in ipairs(self.Seasonal[season].rewards) do
            table.insert(rewards, r)
        end
    end
    local reward = rewards[math.random(#rewards)]
    SoundManager:PlaySFX(reward == "Super Rare Mutation" and "MiniGameWin" or "UIClick")
    return {tier = tier, reward = reward}
end

return SlotMachineSystem
