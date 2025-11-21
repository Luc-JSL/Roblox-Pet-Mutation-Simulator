-- SlotMachineUI.lua
-- Animated slot machine interface for spins and rewards

local SlotMachineUI = {}

SlotMachineUI.Elements = {
    FreeMachine = {
        label = "Free Spin",
        odds = "Lower",
        button = "Spin Free",
        onClick = function(slotSystem)
            local result = slotSystem:Spin(false)
            SlotMachineUI:ShowResult(result)
        end
    },
    PaidMachine = {
        label = "Robux Spin",
        odds = "Better",
        button = "Spin for Robux",
        onClick = function(slotSystem)
            local result = slotSystem:Spin(true)
            SlotMachineUI:ShowResult(result)
        end
    },
    ResultPanel = {
        label = "Result",
        animation = "Flash, Sparkle, PetAnim",
        sfx = "Win/Jackpot"
    }
}

function SlotMachineUI:ShowResult(result)
    print("Slot Result:", result.tier, result.reward)
    -- Animated effects
    if result.tier == "Legendary" then
        print("[ANIMATION] Legendary: Flashing lights, sparkles, pet animation, legendary aura")
    elseif result.tier == "Rare" then
        print("[ANIMATION] Rare: Sparkles, pet animation")
    else
        print("[ANIMATION] Common: Basic spin animation")
    end
    -- Sound triggers
    local SoundManager = require(script.Parent.Parent.Scripts.SoundManager)
    if result.tier == "Legendary" then
        SoundManager:PlaySFX("MiniGameWin")
    elseif result.tier == "Rare" then
        SoundManager:PlaySFX("Mutation")
    else
        SoundManager:PlaySFX("UIClick")
    end
    -- Reward integration
    if result.reward == "Coins" then
        print("[REWARD] Add coins to player")
    elseif result.reward == "XP Boost" then
        print("[REWARD] Boost pet XP")
    elseif result.reward == "Small Mutation" or result.reward == "Rare Mutation" or result.reward == "Hybrid Mutation" or result.reward == "Super Rare Mutation" then
        print("[REWARD] Add mutation to pet")
    elseif result.reward == "Evolution Stone" then
        print("[REWARD] Add evolution stone to inventory")
    elseif result.reward == "Exclusive Pet" then
        print("[REWARD] Add exclusive pet to collection")
    elseif result.reward == "Super Rare Cosmetic" or result.reward == "Pumpkin Hat" or result.reward == "Snowflake Skin" then
        print("[REWARD] Add cosmetic to inventory")
    elseif result.reward == "Free Spin" then
        print("[BONUS] Award free spin")
    elseif result.reward == "Extra Coins" then
        print("[BONUS] Award extra coins")
    end
end

return SlotMachineUI
