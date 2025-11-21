-- RandomEvents.lua
-- Handles random mutation storms, legendary spawns, and treasure drops

local RandomEvents = {}

RandomEvents.Events = {
    {Type = "Mutation Storm", Effect = "Randomize traits"},
    {Type = "Legendary Creature", Effect = "Spawn rare pet"},
    {Type = "Treasure Drop", Effect = "Award mutation materials"}
}

return RandomEvents
