-- SettingsUI.lua
-- UI for game settings including music and SFX controls

local SettingsUI = {}

SettingsUI.Elements = {
    MusicSlider = {
        label = "Music Volume",
        min = 0,
        max = 1,
        value = 0.5,
        onChange = function(newVolume, soundManager)
            soundManager:SetVolume(newVolume)
        end
    },
    MusicTrackDropdown = {
        label = "Music Track",
        options = {"Main Theme", "Adventure", "Calm Zone"},
        selected = 1,
        onChange = function(trackIndex, soundManager)
            soundManager:PlayMusic(trackIndex)
        end
    },
    SFXToggle = {
        label = "Enable SFX",
        enabled = true,
        onChange = function(enabled, soundManager)
            soundManager.SFXEnabled = enabled
        end
    },
    SaveButton = {
        label = "Save Settings",
        onClick = function(soundManager)
            print("Settings saved! Volume:", soundManager.Volume, "Track:", soundManager.CurrentMusic, "SFX:", soundManager.SFXEnabled)
        end
    }
}

function SettingsUI:ShowSettings(soundManager)
    -- Render settings UI with slider, dropdown, and toggle
    print("Showing settings UI")
    print("Music Volume:", soundManager.Volume)
    print("Current Track:", soundManager.CurrentMusic)
    print("SFX Enabled:", soundManager.SFXEnabled)
end

return SettingsUI
