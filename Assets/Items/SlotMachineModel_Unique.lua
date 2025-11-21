-- SlotMachineModel_Unique.lua
-- Unique model for the slot machine asset

local SlotMachineModel = {}

SlotMachineModel.Name = "Celestial Slot Machine"
SlotMachineModel.Mesh = {
    Shape = "Slot Machine",
    Material = "Starlight Alloy",
    Color = {R = 0.7, G = 0.8, B = 1.0},
    Glow = true,
    UniqueFeatures = {
        "Animated Reels",
        "Flashing Lights",
        "Sparkle Effects",
        "Pet Icon Symbols",
        "Legendary Aura"
    }
}

SlotMachineModel.Animations = {
    Idle = "SlotIdle",
    Spin = "SlotSpin",
    Win = "SlotWin",
    Jackpot = "SlotJackpot"
}

SlotMachineModel.SFX = {
    Spin = "rbxassetid://12345678",
    Win = "rbxassetid://23456789",
    Jackpot = "rbxassetid://34567890"
}

return SlotMachineModel
