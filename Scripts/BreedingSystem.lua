-- BreedingSystem.lua
-- Handles pet breeding and hybrid creation

local BreedingSystem = {}

function BreedingSystem:Breed(petA, petB)
    local hybridTraits = {}
    for trait, valueA in pairs(petA.genes) do
        local valueB = petB.genes[trait]
        if valueA == valueB then
            hybridTraits[trait] = valueA
        else
            hybridTraits[trait] = math.random() < 0.5 and valueA or valueB
        end
    end
    return hybridTraits
end

return BreedingSystem
