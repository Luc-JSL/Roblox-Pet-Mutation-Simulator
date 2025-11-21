-- DynamicPetGrowth.lua
-- Handles pet personality and growth based on player interaction

local DynamicPetGrowth = {}

DynamicPetGrowth.Personalities = {"Friendly", "Mischievous", "Lazy", "Aggressive", "Curious"}

function DynamicPetGrowth:UpdatePersonality(pet, interaction)
    if interaction == "Feed" then
        pet.personality = "Friendly"
    elseif interaction == "Train" then
        pet.personality = "Aggressive"
    elseif interaction == "Play" then
        pet.personality = "Mischievous"
    else
        pet.personality = "Lazy"
    end
    return pet
end

return DynamicPetGrowth
