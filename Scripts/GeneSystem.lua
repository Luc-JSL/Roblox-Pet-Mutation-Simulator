-- GeneSystem.lua
-- Handles pet gene generation, mutation, and combination

local GeneSystem = {}

-- Define possible gene traits
GeneSystem.Traits = {
    Color = {"Red", "Blue", "Green", "Gold", "Shadow", "Crystal"},
    Size = {"Tiny", "Small", "Medium", "Large", "Giant"},
    Ability = {"Speed", "Strength", "Intelligence", "Stealth", "Mutation Boost", "Boss Slayer"},
    Personality = {"Shy", "Hyper", "Aggressive", "Friendly", "Greedy", "Loyal"}
}

-- Generate random genes for a pet
function GeneSystem:GenerateGenes(isPremium)
    local genes = {}
    for trait, options in pairs(self.Traits) do
        if isPremium and trait == "Ability" then
            genes[trait] = "Mutation Boost" -- Premium pets get a special ability
        else
            genes[trait] = options[math.random(#options)]
        end
    end
    return genes
end

-- Combine two pets' genes to create a new pet
function GeneSystem:MutateGenes(genesA, genesB, mutationRate)
    local newGenes = {}
    for trait, _ in pairs(self.Traits) do
        if math.random() < mutationRate then
            -- Random mutation
            newGenes[trait] = self.Traits[trait][math.random(#self.Traits[trait])]
        else
            -- Inherit from one parent
            newGenes[trait] = math.random() < 0.5 and genesA[trait] or genesB[trait]
        end
    end
    return newGenes
end

return GeneSystem
