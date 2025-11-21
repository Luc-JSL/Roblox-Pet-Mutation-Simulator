-- RandomEvents.lua
-- Handles random mutation storms, legendary spawns, and treasure drops

local RandomEvents = {}

RandomEvents.Events = {
    {Type = "Mutation Storm", Effect = "Randomize traits"},
    {Type = "Legendary Creature", Effect = "Spawn rare pet"},
    {Type = "Treasure Drop", Effect = "Award mutation materials"}
}

function RandomEvents:TriggerEvent(eventType)
    for _, event in ipairs(self.Events) do
        if event.Type == eventType then
            print("Triggering event:", eventType, "Effect:", event.Effect)
            return event.Effect
        end
    end
    print("Event not found:", eventType)
    return nil
end

return RandomEvents
