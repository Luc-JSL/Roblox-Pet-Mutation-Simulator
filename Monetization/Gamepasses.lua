-- Gamepasses.lua
-- Handles gamepass logic for monetization

local Gamepasses = {}

Gamepasses.List = {
    ExtraMutationSlot = {
        Id = 123456,
        Description = "Unlock an extra mutation slot!"
    },
    FasterMutation = {
        Id = 234567,
        Description = "Speed up mutation times!"
    },
    ExclusiveGenes = {
        Id = 345678,
        Description = "Access exclusive gene types!"
    }
}

function Gamepasses:HasPass(player, passName)
    -- Placeholder: Replace with Roblox gamepass check
    return false
end

return Gamepasses
