-- BossBattleUI.lua
-- UI logic for boss battle interface

local BossBattleUI = {}

BossBattleUI.Elements = {
    BossHealthBar = true,
    PetSelectionPanel = true,
    WeaknessIndicator = true,
    SpecialAttackButton = true
}

function BossBattleUI:ShowBoss(boss)
    -- Display boss info and health
end

function BossBattleUI:SelectPet(pet)
    -- Select pet for battle
end

function BossBattleUI:ShowWeakness(weakness)
    -- Display boss weakness
end

return BossBattleUI
