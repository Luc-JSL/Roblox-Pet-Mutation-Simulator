-- MutationChamberUI.lua
-- UI logic for mutation chamber sliders and controls

local MutationChamberUI = {}

MutationChamberUI.Sliders = {
    Heat = 0.5,
    Energy = 0.5,
    DNAMixRate = 0.5
}

function MutationChamberUI:UpdateSlider(sliderName, value)
    self.Sliders[sliderName] = value
end

function MutationChamberUI:GetSettings()
    return self.Sliders
end

return MutationChamberUI
