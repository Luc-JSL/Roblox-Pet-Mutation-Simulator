-- EvolutionSystem.lua
-- Handles pet evolution stages and requirements

local EvolutionSystem = {}

EvolutionSystem.Stages = {"Egg", "Juvenile", "Adult", "Legendary"}

-- Evolution requirements for each stage
EvolutionSystem.Requirements = {
    Juvenile = {level = 5, material = nil},
    Adult = {level = 15, material = "Evolution Stone"},
    Legendary = {level = 30, material = "Legendary Crystal"}
}

function EvolutionSystem:CanEvolve(pet, requirements)
    if not pet then return false end
    
    requirements = requirements or self:GetRequirements(pet.stage)
    if not requirements then return false end
    
    local canEvolve = (pet.level or 1) >= (requirements.level or 1)
    
    if requirements.material then
        if not pet.materials or not pet.materials[requirements.material] or pet.materials[requirements.material] < 1 then
            canEvolve = false
        end
    end
    
    return canEvolve
end

function EvolutionSystem:GetRequirements(currentStage)
    local stageIndex = nil
    for i, stage in ipairs(self.Stages) do
        if stage == currentStage then
            stageIndex = i
            break
        end
    end
    
    if stageIndex and stageIndex < #self.Stages then
        local nextStage = self.Stages[stageIndex + 1]
        return self.Requirements[nextStage]
    end
    
    return nil
end

function EvolutionSystem:Evolve(pet)
    if not pet then return nil end
    
    local currentStage = pet.stage or "Egg"
    local requirements = self:GetRequirements(currentStage)
    
    if not self:CanEvolve(pet, requirements) then
        print("Pet cannot evolve yet. Requirements not met.")
        return pet
    end
    
    local nextStageIndex = nil
    for i, stage in ipairs(self.Stages) do
        if stage == currentStage then
            nextStageIndex = i + 1
            break
        end
    end
    
    if nextStageIndex and nextStageIndex <= #self.Stages then
        pet.stage = self.Stages[nextStageIndex]
        
        -- Consume required materials
        if requirements and requirements.material and pet.materials then
            pet.materials[requirements.material] = (pet.materials[requirements.material] or 0) - 1
        end
        
        -- Boost stats upon evolution
        pet.level = (pet.level or 1) + 5
        pet.experience = pet.experience or 0
        
        print("Pet evolved to stage:", pet.stage)
    else
        print("Pet is at max stage.")
    end
    
    return pet
end

-- Get evolution preview
function EvolutionSystem:GetEvolutionPreview(pet)
    if not pet then return nil end
    
    local currentStage = pet.stage or "Egg"
    local requirements = self:GetRequirements(currentStage)
    
    if not requirements then
        return {canEvolve = false, reason = "Already at max stage"}
    end
    
    local canEvolve = self:CanEvolve(pet, requirements)
    local reason = ""
    
    if not canEvolve then
        if (pet.level or 1) < requirements.level then
            reason = "Need level " .. requirements.level
        elseif requirements.material and (not pet.materials or not pet.materials[requirements.material] or pet.materials[requirements.material] < 1) then
            reason = "Need " .. requirements.material
        end
    end
    
    return {
        canEvolve = canEvolve,
        requirements = requirements,
        reason = reason,
        nextStage = self.Stages[self:GetStageIndex(currentStage) + 1]
    }
end

function EvolutionSystem:GetStageIndex(stage)
    for i, s in ipairs(self.Stages) do
        if s == stage then return i end
    end
    return 1
end

return EvolutionSystem
