-- BreedingSystem.lua
-- Handles pet breeding and hybrid creation

local BreedingSystem = {}

-- Breeding cooldowns and requirements
BreedingSystem.Cooldowns = {}
BreedingSystem.BreedingCost = 50 -- coins

function BreedingSystem:CanBreed(petA, petB)
    if not petA or not petB then return false, "Invalid pets" end
    if petA.id == petB.id then return false, "Cannot breed pet with itself" end
    if (petA.level or 1) < 5 or (petB.level or 1) < 5 then return false, "Pets must be level 5+" end
    
    local cooldownKey = petA.id .. "_" .. petB.id
    local reverseCooldownKey = petB.id .. "_" .. petA.id
    
    if self.Cooldowns[cooldownKey] or self.Cooldowns[reverseCooldownKey] then
        return false, "Pets are on breeding cooldown"
    end
    
    return true, ""
end

function BreedingSystem:Breed(petA, petB, playerCoins)
    local canBreed, reason = self:CanBreed(petA, petB)
    if not canBreed then
        return nil, reason
    end
    
    if (playerCoins or 0) < self.BreedingCost then
        return nil, "Not enough coins"
    end
    
    local hybridTraits = {}
    local GeneSystem = require(script.Parent.GeneSystem)
    local compatibility = GeneSystem:GetCompatibility(petA.genes, petB.genes)
    
    -- Higher compatibility = better chance of getting good traits
    for trait, valueA in pairs(petA.genes) do
        local valueB = petB.genes[trait]
        if valueA == valueB then
            -- Same trait = guaranteed inheritance
            hybridTraits[trait] = valueA
        else
            -- Different traits = random selection with compatibility bonus
            local roll = math.random()
            if roll < (0.5 + compatibility * 0.2) then
                -- Favor better trait based on rarity
                local rarityA = self:GetTraitRarity(trait, valueA)
                local rarityB = self:GetTraitRarity(trait, valueB)
                hybridTraits[trait] = rarityA > rarityB and valueA or valueB
            else
                hybridTraits[trait] = math.random() < 0.5 and valueA or valueB
            end
        end
    end
    
    -- Small chance for mutation during breeding
    if math.random() < 0.1 then
        local mutatedTraits = GeneSystem:MutateGenes(hybridTraits, hybridTraits, 0.05)
        for trait, value in pairs(mutatedTraits) do
            hybridTraits[trait] = value
        end
    end
    
    -- Set breeding cooldown
    local cooldownKey = petA.id .. "_" .. petB.id
    self.Cooldowns[cooldownKey] = os.time() + 300 -- 5 minute cooldown
    
    return hybridTraits, "Breeding successful"
end

function BreedingSystem:GetTraitRarity(trait, value)
    local rarityMap = {
        Color = {Red = 1, Blue = 1, Green = 1, Gold = 3, Shadow = 4, Crystal = 5},
        Size = {Tiny = 2, Small = 1, Medium = 1, Large = 1, Giant = 3},
        Ability = {Speed = 1, Strength = 1, Intelligence = 2, Stealth = 2, ["Mutation Boost"] = 4, ["Boss Slayer"] = 5},
        Personality = {Shy = 1, Hyper = 1, Aggressive = 1, Friendly = 1, Greedy = 2, Loyal = 3}
    }
    
    if rarityMap[trait] and rarityMap[trait][value] then
        return rarityMap[trait][value]
    end
    return 1
end

function BreedingSystem:ClearCooldowns()
    local currentTime = os.time()
    for key, cooldownTime in pairs(self.Cooldowns) do
        if currentTime >= cooldownTime then
            self.Cooldowns[key] = nil
        end
    end
end

return BreedingSystem
