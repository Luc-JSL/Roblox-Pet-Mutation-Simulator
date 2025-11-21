-- BossManager.lua
-- Handles boss battles and genetic weaknesses

local BossManager = {}

BossManager.Bosses = {
    {
        Name = "Chimera King",
        Weakness = {Ability = "Boss Slayer", Color = "Shadow"},
        Reward = 1000
    },
    {
        Name = "Mutant Hydra",
        Weakness = {Ability = "Mutation Boost", Size = "Giant"},
        Reward = 1500
    }
}

function BossManager:CanDefeatBoss(pet, boss)
    for trait, value in pairs(boss.Weakness) do
        if pet.genes[trait] ~= value then
            return false
        end
    end
    return true
end

return BossManager
