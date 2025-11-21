-- EvolutionSystem.lua
-- Handles pet evolution stages and requirements

local EvolutionSystem = {}

EvolutionSystem.Stages = {"Egg", "Juvenile", "Adult", "Legendary"}

function EvolutionSystem:CanEvolve(pet, requirements)
    local canEvolve = pet.level >= (requirements.level or 1)
    if requirements.material and not pet.materials[requirements.material] then
        canEvolve = false
    end
    return canEvolve
end

function EvolutionSystem:Evolve(pet)
    local currentStage = pet.stage or "Egg"
    local nextStageIndex = nil
    for i, stage in ipairs(self.Stages) do
        if stage == currentStage then nextStageIndex = i + 1 break end
    end
    if nextStageIndex and nextStageIndex <= #self.Stages then
        pet.stage = self.Stages[nextStageIndex]
        print("Pet evolved to stage:", pet.stage)
    else
        print("Pet is at max stage.")
    end
    return pet
end

return EvolutionSystem
