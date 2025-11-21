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
        local sound = Instance.new("Sound")
        sound.SoundId = soundId
        sound.Volume = self.Volume * 0.7
        sound.Parent = game:GetService("SoundService")
        sound:Play()
        
        -- Clean up after playing
        sound.Ended:Connect(function()
            sound:Destroy()
        end)
        
        print("Playing SFX:", name)
    else
        warn("SFX not found:", name)
    end
end

function SoundManager:PlayMusic(trackIndex)
    local newTrack = self.MusicTracks[trackIndex] or self.MusicTracks[1]
    
    -- Stop current music if playing
    if self.CurrentMusicSound then
        self.CurrentMusicSound:Stop()
        self.CurrentMusicSound:Destroy()
    end
    
    -- Create and play new music
    self.CurrentMusicSound = Instance.new("Sound")
    self.CurrentMusicSound.SoundId = newTrack
    self.CurrentMusicSound.Volume = self.Volume
    self.CurrentMusicSound.Looped = true
    self.CurrentMusicSound.Parent = game:GetService("SoundService")
    self.CurrentMusicSound:Play()
    
    self.CurrentMusic = newTrack
    print("Playing music track:", trackIndex)
end

function SoundManager:SetVolume(vol)
    self.Volume = math.clamp(vol, 0, 1)
    
    -- Update current music volume
    if self.CurrentMusicSound then
        self.CurrentMusicSound.Volume = self.Volume
    end
    
    print("Volume set to:", self.Volume)
end

function SoundManager:StopMusic()
    if self.CurrentMusicSound then
        self.CurrentMusicSound:Stop()
        self.CurrentMusicSound:Destroy()
        self.CurrentMusicSound = nil
    end
end

function SoundManager:FadeMusic(targetVolume, duration)
    if not self.CurrentMusicSound then return end
    
    local tweenInfo = TweenInfo.new(duration or 2, Enum.EasingStyle.Quad)
    local tween = game:GetService("TweenService"):Create(self.CurrentMusicSound, tweenInfo, {Volume = targetVolume})
    tween:Play()
end

return SoundManager
