-- AutoCollectSystem.lua
-- Handles auto-collection of mutation materials

local AutoCollectSystem = {}

function AutoCollectSystem:Collect(zone)
    print("Auto-collecting materials from zone:", zone.Name)
    -- Add materials to player inventory
    return {material = zone.ExclusiveMutation, amount = math.random(1,3)}
end

return AutoCollectSystem
