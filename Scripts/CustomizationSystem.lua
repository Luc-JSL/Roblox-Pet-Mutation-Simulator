-- CustomizationSystem.lua
-- Handles pet cosmetics, homes, and mutation codex

local CustomizationSystem = {}

CustomizationSystem.Cosmetics = {"Hats", "Wings", "Trails", "Color Palettes"}
CustomizationSystem.Homes = {"Island", "Forest Den", "Crystal Cave"}
CustomizationSystem.Codex = {}

function CustomizationSystem:AddMutationToCodex(mutation)
    table.insert(self.Codex, mutation)
end

return CustomizationSystem
