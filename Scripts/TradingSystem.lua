-- TradingSystem.lua
-- Handles pet and material trading between players

local TradingSystem = {}

function TradingSystem:Trade(playerA, playerB, itemA, itemB)
    print("Trading", itemA, "from", playerA, "with", itemB, "from", playerB)
    -- Exchange items between players
    -- Update inventories
    return true
end

return TradingSystem
