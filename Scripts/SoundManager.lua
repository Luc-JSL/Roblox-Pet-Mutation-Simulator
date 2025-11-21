-- SoundManager.lua
-- Handles custom SFX and background music for game immersion

local SoundManager = {}

SoundManager.SFX = {
    Mutation = "rbxassetid://12345678",
    Evolution = "rbxassetid://23456789",
    Trade = "rbxassetid://34567890",
    MiniGameWin = "rbxassetid://45678901",
    UIClick = "rbxassetid://56789012"
}

SoundManager.MusicTracks = {
    "rbxassetid://67890123", -- Main theme
    "rbxassetid://78901234", -- Adventure
    "rbxassetid://89012345"  -- Calm zone
}

SoundManager.CurrentMusic = nil
SoundManager.Volume = 0.5

function SoundManager:PlaySFX(name)
    local soundId = self.SFX[name]
    if soundId then
        -- Play SFX (pseudo-code, replace with engine-specific)
        print("Playing SFX:", soundId)
    end
end

function SoundManager:PlayMusic(trackIndex)
    self.CurrentMusic = self.MusicTracks[trackIndex] or self.MusicTracks[1]
    -- Play music (pseudo-code)
    print("Playing music:", self.CurrentMusic)
end

function SoundManager:SetVolume(vol)
    self.Volume = math.clamp(vol, 0, 1)
    -- Set music volume (pseudo-code)
    print("Music volume set to:", self.Volume)
end

return SoundManager
