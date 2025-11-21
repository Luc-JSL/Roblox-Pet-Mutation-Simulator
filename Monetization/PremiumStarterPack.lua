-- PremiumStarterPack.lua
-- Defines premium starter pets and pay-to-win features

local PremiumStarterPack = {}

PremiumStarterPack.PremiumPetGenes = {
    Color = "Crystal",
    Size = "Giant",
    Ability = "Mutation Boost",
    Personality = "Loyal"
}

function PremiumStarterPack:GetPremiumPet()
    local Pet = require(script.Parent.Parent.Scripts.Pet)
    return Pet.new(self.PremiumPetGenes)
end

PremiumStarterPack.Features = {
    ExtraMutationSlots = true,
    FasterMutationTimes = true,
    ExclusiveGeneTypes = {"Shadow", "Crystal"}
}

return PremiumStarterPack
