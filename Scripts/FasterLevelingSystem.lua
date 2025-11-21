-- FasterLevelingSystem.lua
-- Handles faster pet leveling logic

local FasterLevelingSystem = {}

function FasterLevelingSystem:BoostLeveling(pet)
    print("Boosting leveling speed for pet:", pet.genes)
    pet.xpBoost = true
    return pet
end

return FasterLevelingSystem
