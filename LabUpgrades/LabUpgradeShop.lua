-- LabUpgradeShop.lua
-- Handles lab upgrades and shop logic

local LabUpgradeShop = {}

LabUpgradeShop.Upgrades = {
    {Name = "Gene Analyzer", Cost = 100, Effect = "See hidden gene traits"},
    {Name = "Mutation Accelerator", Cost = 250, Effect = "Faster mutation times"},
    {Name = "Personality Scanner", Cost = 150, Effect = "Reveal pet personalities"},
    {Name = "Boss Radar", Cost = 500, Effect = "Find boss weaknesses"}
}

function LabUpgradeShop:BuyUpgrade(player, upgradeName)
    -- Placeholder: Replace with purchase logic
    return true
end

return LabUpgradeShop
