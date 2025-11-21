-- EvolutionSystem.lua
-- Handles pet evolution stages and requirements

local EvolutionSystem = {}

EvolutionSystem.Stages = {"Egg", "Juvenile", "Adult", "Legendary"}

function EvolutionSystem:CanEvolve(pet, requirements)
    -- Check if pet meets requirements (level, quest, material)
    return true -- Placeholder
end

function EvolutionSystem:Evolve(pet)
    local currentStage = pet.stage or "Egg"
    local nextStageIndex = table.find(self.Stages, currentStage) + 1
    if nextStageIndex <= #self.Stages then
        pet.stage = self.Stages[nextStageIndex]
    end
    return pet
end

return EvolutionSystem
