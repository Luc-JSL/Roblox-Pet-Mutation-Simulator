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
    mutationRate = mutationRate or 0.1
    
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

-- Calculate gene compatibility for breeding
function GeneSystem:GetCompatibility(genesA, genesB)
    local matches = 0
    local total = 0
    
    for trait, valueA in pairs(genesA) do
        local valueB = genesB[trait]
        if valueB then
            total = total + 1
            if valueA == valueB then
                matches = matches + 1
            end
        end
    end
    
    return total > 0 and (matches / total) or 0
end

-- Get gene rarity score
function GeneSystem:GetRarityScore(genes)
    local score = 0
    local rarityValues = {
        Color = {Red = 1, Blue = 1, Green = 1, Gold = 3, Shadow = 4, Crystal = 5},
        Size = {Tiny = 2, Small = 1, Medium = 1, Large = 1, Giant = 3},
        Ability = {Speed = 1, Strength = 1, Intelligence = 2, Stealth = 2, ["Mutation Boost"] = 4, ["Boss Slayer"] = 5},
        Personality = {Shy = 1, Hyper = 1, Aggressive = 1, Friendly = 1, Greedy = 2, Loyal = 3}
    }
    
    for trait, value in pairs(genes) do
        if rarityValues[trait] and rarityValues[trait][value] then
            score = score + rarityValues[trait][value]
        end
    end
    
    return score
end

return GeneSystem
