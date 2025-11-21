-- GameController.lua
-- Main game loop and system integration

local GameController = {}
local SoundManager = require(script.Parent.SoundManager)
local SlotMachineSystem = require(script.Parent.SlotMachineSystem)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Player data structure
GameController.PlayerData = {}

function GameController:StartGame(player)
    -- Initialize systems, load UI, spawn starter pet
    if not player then return false end
    
    -- Initialize player data
    self.PlayerData[player.UserId] = {
        pets = {},
        materials = {},
        coins = 100,
        level = 1,
        inventory = {}
    }
    
    -- Play startup sounds
    SoundManager:PlayMusic(1)
    SoundManager:PlaySFX("UIClick")
    
    -- Create starter pet
    local GeneSystem = require(script.Parent.GeneSystem)
    local starterGenes = GeneSystem:GenerateGenes(false)
    local starterPet = self:CreatePet(starterGenes, "Starter")
    self.PlayerData[player.UserId].pets[1] = starterPet
    
    print("Game started for player:", player.Name)
    return true
end

function GameController:CreatePet(genes, petType)
    return {
        id = math.random(100000, 999999),
        genes = genes,
        level = 1,
        stage = "Egg",
        petType = petType or "Common",
        materials = {},
        experience = 0
    }
end

function GameController:MutatePet(player, petA, petB)
    if not player or not petA or not petB then return nil end
    
    SoundManager:PlaySFX("Mutation")
    local GeneSystem = require(script.Parent.GeneSystem)
    local mutatedGenes = GeneSystem:MutateGenes(petA.genes, petB.genes, 0.3)
    local newPet = self:CreatePet(mutatedGenes, "Mutated")
    
    -- Add to player's collection
    local playerData = self.PlayerData[player.UserId]
    if playerData then
        table.insert(playerData.pets, newPet)
    end
    
    return newPet
end

function GameController:BreedPets(player, petA, petB)
    if not player or not petA or not petB then return nil end
    
    SoundManager:PlaySFX("UIClick")
    local BreedingSystem = require(script.Parent.BreedingSystem)
    local hybridGenes = BreedingSystem:Breed(petA, petB)
    local newPet = self:CreatePet(hybridGenes, "Hybrid")
    
    -- Add to player's collection
    local playerData = self.PlayerData[player.UserId]
    if playerData then
        table.insert(playerData.pets, newPet)
    end
    
    return newPet
end

function GameController:ExploreZone(player, zoneName)
    if not player or not zoneName then return nil end
    
    SoundManager:PlaySFX("UIClick")
    local MapSystem = require(script.Parent.MapSystem)
    local zone = MapSystem:NavigateTo(zoneName)
    
    if zone then
        -- Reward exclusive materials
        local playerData = self.PlayerData[player.UserId]
        if playerData then
            playerData.materials[zone.ExclusiveMutation] = (playerData.materials[zone.ExclusiveMutation] or 0) + 1
        end
        return zone
    end
    return nil
end

function GameController:PlayMiniGame(player, gameName)
    if not player or not gameName then return false end
    
    SoundManager:PlaySFX("MiniGameWin")
    
    -- Reward coins and XP
    local playerData = self.PlayerData[player.UserId]
    if playerData then
        playerData.coins = playerData.coins + math.random(10, 50)
        playerData.level = playerData.level + 1
    end
    
    print("Playing mini-game:", gameName, "for player:", player.Name)
    return true
end

function GameController:TradePets(playerA, playerB, petA, petB)
    if not playerA or not playerB or not petA or not petB then return false end
    
    SoundManager:PlaySFX("Trade")
    local TradingSystem = require(script.Parent.TradingSystem)
    return TradingSystem:Trade(playerA, playerB, petA, petB)
end

function GameController:CustomizePet(player, pet, cosmetic)
    if not player or not pet or not cosmetic then return false end
    
    SoundManager:PlaySFX("UIClick")
    local CustomizationSystem = require(script.Parent.CustomizationSystem)
    
    -- Apply cosmetic to pet
    if not pet.cosmetics then pet.cosmetics = {} end
    pet.cosmetics[cosmetic.type] = cosmetic
    
    print("Customizing pet:", pet.id, "with", cosmetic.name)
    return true
end

function GameController:ShowCodex(player)
    if not player then return {} end
    
    SoundManager:PlaySFX("UIClick")
    local CustomizationSystem = require(script.Parent.CustomizationSystem)
    return CustomizationSystem.Codex
end

function GameController:SpinSlotMachine(player, isPaid, season)
    if not player then return nil end
    
    local result = SlotMachineSystem:Spin(isPaid, season)
    
    -- Award rewards based on tier
    local playerData = self.PlayerData[player.UserId]
    if playerData then
        if result.tier == "Legendary" then
            -- Award legendary mutation, pet, or cosmetic
            if result.reward == "Exclusive Pet" then
                local GeneSystem = require(script.Parent.GeneSystem)
                local legendaryGenes = GeneSystem:GenerateGenes(true)
                local legendaryPet = self:CreatePet(legendaryGenes, "Legendary")
                table.insert(playerData.pets, legendaryPet)
            elseif result.reward == "Super Rare Cosmetic" then
                playerData.inventory[result.reward] = (playerData.inventory[result.reward] or 0) + 1
            end
        elseif result.tier == "Rare" then
            if result.reward == "Evolution Stone" then
                playerData.materials[result.reward] = (playerData.materials[result.reward] or 0) + 1
            end
        else
            -- Common rewards
            if result.reward == "Coins" then
                playerData.coins = playerData.coins + math.random(10, 100)
            elseif result.reward == "XP Boost" then
                playerData.level = playerData.level + 1
            end
        end
    end
    
    return result
end

function GameController:GetPlayerData(player)
    if not player then return nil end
    return self.PlayerData[player.UserId]
end

return GameController
