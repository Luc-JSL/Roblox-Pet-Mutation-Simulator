-- MutationChamber.lua
-- Handles mutation UI logic and mutation process

local MutationChamber = {}

MutationChamber.Settings = {
    Heat = 0.5,
    Energy = 0.5,
    DNAMixRate = 0.5
}

function MutationChamber:Mutate(petA, petB)
    local mutationRate = self.Settings.DNAMixRate
    local GeneSystem = require(script.Parent.GeneSystem)
    local newGenes = GeneSystem:MutateGenes(petA.genes, petB.genes, mutationRate)
    return require(script.Parent.Pet).new(newGenes)
end

return MutationChamber
