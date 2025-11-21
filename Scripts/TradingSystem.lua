-- TradingSystem.lua
-- Handles pet and material trading between players

local TradingSystem = {}

-- Active trade offers
TradingSystem.ActiveTrades = {}
TradingSystem.TradeRequests = {}

function TradingSystem:SendTradeRequest(playerA, playerB, itemA, itemB)
    if not playerA or not playerB or playerA == playerB then
        return false, "Invalid players"
    end
    
    local tradeId = playerA.UserId .. "_" .. playerB.UserId .. "_" .. os.time()
    
    self.TradeRequests[tradeId] = {
        playerA = playerA,
        playerB = playerB,
        itemA = itemA,
        itemB = itemB,
        timestamp = os.time(),
        status = "pending"
    }
    
    print("Trade request sent from", playerA.Name, "to", playerB.Name)
    return true, tradeId
end

function TradingSystem:AcceptTrade(tradeId, acceptingPlayer)
    local trade = self.TradeRequests[tradeId]
    if not trade then
        return false, "Trade request not found"
    end
    
    if trade.playerB ~= acceptingPlayer then
        return false, "Not authorized to accept this trade"
    end
    
    if trade.status ~= "pending" then
        return false, "Trade is no longer pending"
    end
    
    -- Validate trade
    local valid, reason = self:ValidateTrade(trade)
    if not valid then
        return false, reason
    end
    
    -- Execute trade
    return self:ExecuteTrade(trade)
end

function TradingSystem:ValidateTrade(trade)
    -- Check if both players still have their items
    local GameController = require(script.Parent.GameController)
    local playerDataA = GameController:GetPlayerData(trade.playerA)
    local playerDataB = GameController:GetPlayerData(trade.playerB)
    
    if not playerDataA or not playerDataB then
        return false, "Player data not found"
    end
    
    -- Validate player A has the item
    local hasItemA = false
    if trade.itemA.type == "pet" then
        for _, pet in ipairs(playerDataA.pets) do
            if pet.id == trade.itemA.id then
                hasItemA = true
                break
            end
        end
    elseif trade.itemA.type == "material" then
        hasItemA = (playerDataA.materials[trade.itemA.name] or 0) >= (trade.itemA.amount or 1)
    end
    
    -- Validate player B has the item
    local hasItemB = false
    if trade.itemB.type == "pet" then
        for _, pet in ipairs(playerDataB.pets) do
            if pet.id == trade.itemB.id then
                hasItemB = true
                break
            end
        end
    elseif trade.itemB.type == "material" then
        hasItemB = (playerDataB.materials[trade.itemB.name] or 0) >= (trade.itemB.amount or 1)
    end
    
    if not hasItemA then
        return false, trade.playerA.Name .. " no longer has the offered item"
    end
    
    if not hasItemB then
        return false, trade.playerB.Name .. " no longer has the requested item"
    end
    
    return true, ""
end

function TradingSystem:ExecuteTrade(trade)
    local GameController = require(script.Parent.GameController)
    local playerDataA = GameController:GetPlayerData(trade.playerA)
    local playerDataB = GameController:GetPlayerData(trade.playerB)
    
    -- Remove items from original owners
    if trade.itemA.type == "pet" then
        for i, pet in ipairs(playerDataA.pets) do
            if pet.id == trade.itemA.id then
                table.remove(playerDataA.pets, i)
                break
            end
        end
    elseif trade.itemA.type == "material" then
        playerDataA.materials[trade.itemA.name] = (playerDataA.materials[trade.itemA.name] or 0) - (trade.itemA.amount or 1)
    end
    
    if trade.itemB.type == "pet" then
        for i, pet in ipairs(playerDataB.pets) do
            if pet.id == trade.itemB.id then
                table.remove(playerDataB.pets, i)
                break
            end
        end
    elseif trade.itemB.type == "material" then
        playerDataB.materials[trade.itemB.name] = (playerDataB.materials[trade.itemB.name] or 0) - (trade.itemB.amount or 1)
    end
    
    -- Add items to new owners
    if trade.itemA.type == "pet" then
        table.insert(playerDataB.pets, trade.itemA)
    elseif trade.itemA.type == "material" then
        playerDataB.materials[trade.itemA.name] = (playerDataB.materials[trade.itemA.name] or 0) + (trade.itemA.amount or 1)
    end
    
    if trade.itemB.type == "pet" then
        table.insert(playerDataA.pets, trade.itemB)
    elseif trade.itemB.type == "material" then
        playerDataA.materials[trade.itemB.name] = (playerDataA.materials[trade.itemB.name] or 0) + (trade.itemB.amount or 1)
    end
    
    -- Mark trade as completed
    trade.status = "completed"
    
    print("Trade completed between", trade.playerA.Name, "and", trade.playerB.Name)
    return true, "Trade completed successfully"
end

function TradingSystem:CancelTrade(tradeId, cancelingPlayer)
    local trade = self.TradeRequests[tradeId]
    if not trade then
        return false, "Trade request not found"
    end
    
    if trade.playerA ~= cancelingPlayer and trade.playerB ~= cancelingPlayer then
        return false, "Not authorized to cancel this trade"
    end
    
    trade.status = "cancelled"
    print("Trade cancelled by", cancelingPlayer.Name)
    return true, "Trade cancelled"
end

function TradingSystem:GetActiveTrades(player)
    local trades = {}
    for tradeId, trade in pairs(self.TradeRequests) do
        if (trade.playerA == player or trade.playerB == player) and trade.status == "pending" then
            trades[tradeId] = trade
        end
    end
    return trades
end

return TradingSystem
