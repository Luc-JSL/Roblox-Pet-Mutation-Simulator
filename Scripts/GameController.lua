local SlotMachineSystem = require(script.Parent.SlotMachineSystem)
function GameController:SpinSlotMachine(isPaid, season)
    local result = SlotMachineSystem:Spin(isPaid, season)
    if result.tier == "Legendary" then
        -- Award legendary mutation, pet, or cosmetic
        print("Legendary win! Award:", result.reward)
        -- Add to player's inventory, pets, or cosmetics
    elseif result.tier == "Rare" then
        print("Rare win! Award:", result.reward)
        -- Add rare mutation, stone, or item
    else
        print("Common win! Award:", result.reward)
        -- Add coins, XP, or small mutation
    end
    -- Trigger slot machine UI animation and SFX
    local SlotMachineUI = require(script.Parent.Parent.UI.SlotMachineUI)
    SlotMachineUI:ShowResult(result)
    return result
end
-- GameController.lua
-- Main game loop and system integration

local GameController = {}
local SoundManager = require(script.Parent.SoundManager)

function GameController:StartGame()
    -- Initialize systems, load UI, spawn starter pet
    SoundManager:PlayMusic(1) -- Play main theme
    SoundManager:PlaySFX("UIClick")
end

function GameController:MutatePet(petA, petB)
    -- Integrate mutation, chain, and evolution systems
    SoundManager:PlaySFX("Mutation")
    local MutationChamber = require(script.Parent.MutationChamber)
    local newPet = MutationChamber:Mutate(petA, petB)
    return newPet
end

function GameController:BreedPets(petA, petB)
    SoundManager:PlaySFX("UIClick")
    local BreedingSystem = require(script.Parent.BreedingSystem)
    local DynamicPetGrowth = require(script.Parent.DynamicPetGrowth)
    local hybridGenes = BreedingSystem:Breed(petA, petB)
    local newPet = require(script.Parent.Pet).new(hybridGenes)
    DynamicPetGrowth:UpdatePersonality(newPet, "Play")
    return newPet
end

function GameController:ExploreZone(zone)
    SoundManager:PlaySFX("UIClick")
    local ExplorationZones = require(script.Parent.ExplorationZones)
    print("Exploring zone:", zone)
    -- Trigger zone events and exclusive mutations
end

function GameController:PlayMiniGame(game)
    SoundManager:PlaySFX("MiniGameWin")
    local MiniGames = require(script.Parent.MiniGames)
    print("Playing mini-game:", game)
    -- Launch mini-game and reward system
end

function GameController:TradePets(playerA, playerB, petA, petB)
    SoundManager:PlaySFX("Trade")
    local TradingSystem = require(script.Parent.TradingSystem)
    return TradingSystem:Trade(playerA, playerB, petA, petB)
end

function GameController:CustomizePet(pet, cosmetic)
    SoundManager:PlaySFX("UIClick")
    local CustomizationSystem = require(script.Parent.CustomizationSystem)
    print("Customizing pet:", pet, "with", cosmetic)
    -- Apply customization
end

function GameController:ShowCodex()
    SoundManager:PlaySFX("UIClick")
    local CustomizationSystem = require(script.Parent.CustomizationSystem)
    print("Codex:", CustomizationSystem.Codex)
    -- Display mutation codex
end

return GameController
