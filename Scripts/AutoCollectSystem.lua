-- AutoCollectSystem.lua
-- Handles auto-collection of mutation materials

local AutoCollectSystem = {}

-- Auto-collection settings
AutoCollectSystem.CollectionRate = 30 -- seconds between collections
AutoCollectSystem.ActiveCollectors = {}
AutoCollectSystem.Upgrades = {
    FasterCollection = {cost = 100, speedMultiplier = 0.8}, -- 20% faster
    BetterYields = {cost = 200, yieldMultiplier = 2.0}, -- Double materials
    ZoneUnlock = {cost = 500, unlockPremiumZones = true}
}

function AutoCollectSystem:StartAutoCollection(player, zone)
    if not player or not zone then return false end
    
    local playerId = player.UserId
    if self.ActiveCollectors[playerId] then
        self:StopAutoCollection(player)
    end
    
    local collectionRate = self.CollectionRate
    local yieldMultiplier = 1
    
    -- Apply upgrades
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    if playerData and playerData.upgrades then
        if playerData.upgrades.FasterCollection then
            collectionRate = collectionRate * self.Upgrades.FasterCollection.speedMultiplier
        end
        if playerData.upgrades.BetterYields then
            yieldMultiplier = yieldMultiplier * self.Upgrades.BetterYields.yieldMultiplier
        end
    end
    
    self.ActiveCollectors[playerId] = {
        zone = zone,
        player = player,
        lastCollection = os.time(),
        collectionRate = collectionRate,
        yieldMultiplier = yieldMultiplier
    }
    
    print("Auto-collection started for", player.Name, "in zone:", zone.Name)
    return true
end

function AutoCollectSystem:StopAutoCollection(player)
    if not player then return false end
    
    local playerId = player.UserId
    if self.ActiveCollectors[playerId] then
        self.ActiveCollectors[playerId] = nil
        print("Auto-collection stopped for", player.Name)
        return true
    end
    
    return false
end

function AutoCollectSystem:ProcessCollections()
    local currentTime = os.time()
    
    for playerId, collector in pairs(self.ActiveCollectors) do
        if currentTime - collector.lastCollection >= collector.collectionRate then
            self:Collect(collector.player, collector.zone, collector.yieldMultiplier)
            collector.lastCollection = currentTime
        end
    end
end

function AutoCollectSystem:Collect(player, zone, yieldMultiplier)
    if not player or not zone then return nil end
    
    yieldMultiplier = yieldMultiplier or 1
    local baseAmount = math.random(1, 3)
    local finalAmount = math.floor(baseAmount * yieldMultiplier)
    
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    
    if playerData then
        playerData.materials[zone.ExclusiveMutation] = (playerData.materials[zone.ExclusiveMutation] or 0) + finalAmount
        
        -- Small chance for bonus materials
        if math.random() < 0.1 then
            local bonusMaterial = "Rare Crystal"
            playerData.materials[bonusMaterial] = (playerData.materials[bonusMaterial] or 0) + 1
            print("Bonus material collected:", bonusMaterial)
        end
    end
    
    print("Auto-collected", finalAmount, zone.ExclusiveMutation, "from", zone.Name, "for", player.Name)
    return {material = zone.ExclusiveMutation, amount = finalAmount}
end

function AutoCollectSystem:PurchaseUpgrade(player, upgradeName)
    if not player or not upgradeName or not self.Upgrades[upgradeName] then
        return false, "Invalid upgrade"
    end
    
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    
    if not playerData then
        return false, "Player data not found"
    end
    
    local upgrade = self.Upgrades[upgradeName]
    if playerData.coins < upgrade.cost then
        return false, "Not enough coins"
    end
    
    if not playerData.upgrades then
        playerData.upgrades = {}
    end
    
    if playerData.upgrades[upgradeName] then
        return false, "Upgrade already owned"
    end
    
    -- Purchase upgrade
    playerData.coins = playerData.coins - upgrade.cost
    playerData.upgrades[upgradeName] = true
    
    print("Upgrade purchased:", upgradeName, "for", player.Name)
    return true, "Upgrade purchased successfully"
end

function AutoCollectSystem:GetCollectionStatus(player)
    if not player then return nil end
    
    local playerId = player.UserId
    local collector = self.ActiveCollectors[playerId]
    
    if collector then
        local timeUntilNext = collector.collectionRate - (os.time() - collector.lastCollection)
        return {
            active = true,
            zone = collector.zone.Name,
            timeUntilNext = math.max(0, timeUntilNext),
            yieldMultiplier = collector.yieldMultiplier
        }
    end
    
    return {active = false}
end

return AutoCollectSystem
