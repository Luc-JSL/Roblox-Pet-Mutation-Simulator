-- Pet.lua
-- Pet object with genes and personality-driven behavior

local Pet = {}
Pet.__index = Pet

function Pet.new(genes)
    local self = setmetatable({}, Pet)
    self.genes = genes
    self.energy = 100
    self.happiness = 50
    return self
end

function Pet:Act()
    if self.genes.Personality == "Hyper" then
        self.energy = math.max(self.energy - 10, 0)
        self.happiness = self.happiness + 5
    elseif self.genes.Personality == "Shy" then
        self.happiness = self.happiness + 2
    elseif self.genes.Personality == "Aggressive" then
        self.energy = math.max(self.energy - 5, 0)
        self.happiness = self.happiness + 1
    else
        self.happiness = self.happiness + 3
    end
end

return Pet
