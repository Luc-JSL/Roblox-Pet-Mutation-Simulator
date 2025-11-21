-- CustomizationSystem.lua
-- Handles pet cosmetics, homes, and mutation codex

local CustomizationSystem = {}

-- Available cosmetics with costs and rarity
CustomizationSystem.Cosmetics = {
    Hats = {
        {name = "Basic Cap", cost = 50, rarity = "Common", id = "hat_basic"},
        {name = "Crown of Kings", cost = 500, rarity = "Legendary", id = "hat_crown"},
        {name = "Wizard Hat", cost = 200, rarity = "Rare", id = "hat_wizard"}
    },
    Wings = {
        {name = "Fairy Wings", cost = 100, rarity = "Common", id = "wings_fairy"},
        {name = "Dragon Wings", cost = 800, rarity = "Legendary", id = "wings_dragon"},
        {name = "Butterfly Wings", cost = 150, rarity = "Rare", id = "wings_butterfly"}
    },
    Trails = {
        {name = "Sparkle Trail", cost = 75, rarity = "Common", id = "trail_sparkle"},
        {name = "Fire Trail", cost = 300, rarity = "Rare", id = "trail_fire"},
        {name = "Galaxy Trail", cost = 1000, rarity = "Legendary", id = "trail_galaxy"}
    },
    ColorPalettes = {
        {name = "Rainbow", cost = 25, rarity = "Common", id = "color_rainbow"},
        {name = "Sunset", cost = 100, rarity = "Rare", id = "color_sunset"},
        {name = "Aurora", cost = 400, rarity = "Legendary", id = "color_aurora"}
    }
}

CustomizationSystem.Homes = {
    {name = "Island Paradise", cost = 200, features = {"Beach", "Palm Trees", "Ocean View"}, id = "home_island"},
    {name = "Forest Den", cost = 150, features = {"Trees", "Wildlife", "Stream"}, id = "home_forest"},
    {name = "Crystal Cave", cost = 500, features = {"Crystals", "Magical Light", "Echo Chamber"}, id = "home_crystal"},
    {name = "Sky Castle", cost = 1000, features = {"Clouds", "Flying Platform", "Star View"}, id = "home_sky"}
}

CustomizationSystem.Codex = {}

function CustomizationSystem:AddMutationToCodex(mutation, player)
    if not mutation then return false end
    
    -- Create codex entry
    local entry = {
        name = mutation.name or "Unknown Mutation",
        description = mutation.description or "A mysterious mutation",
        discoveredBy = player and player.Name or "Unknown",
        discoveredAt = os.time(),
        rarity = mutation.rarity or "Common",
        traits = mutation.traits or {}
    }
    
    -- Check if already in codex
    for _, existing in ipairs(self.Codex) do
        if existing.name == entry.name then
            return false -- Already discovered
        end
    end
    
    table.insert(self.Codex, entry)
    print("New mutation added to codex:", entry.name, "by", entry.discoveredBy)
    return true
end

function CustomizationSystem:PurchaseCosmetic(player, category, itemId)
    if not player or not category or not itemId then
        return false, "Invalid parameters"
    end
    
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    
    if not playerData then
        return false, "Player data not found"
    end
    
    -- Find the cosmetic
    local cosmetic = nil
    if self.Cosmetics[category] then
        for _, item in ipairs(self.Cosmetics[category]) do
            if item.id == itemId then
                cosmetic = item
                break
            end
        end
    end
    
    if not cosmetic then
        return false, "Cosmetic not found"
    end
    
    -- Check if already owned
    if not playerData.cosmetics then
        playerData.cosmetics = {}
    end
    
    if playerData.cosmetics[itemId] then
        return false, "Already owned"
    end
    
    -- Check if player has enough coins
    if playerData.coins < cosmetic.cost then
        return false, "Not enough coins"
    end
    
    -- Purchase cosmetic
    playerData.coins = playerData.coins - cosmetic.cost
    playerData.cosmetics[itemId] = cosmetic
    
    print("Cosmetic purchased:", cosmetic.name, "by", player.Name)
    return true, "Cosmetic purchased successfully"
end

function CustomizationSystem:PurchaseHome(player, homeId)
    if not player or not homeId then
        return false, "Invalid parameters"
    end
    
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    
    if not playerData then
        return false, "Player data not found"
    end
    
    -- Find the home
    local home = nil
    for _, h in ipairs(self.Homes) do
        if h.id == homeId then
            home = h
            break
        end
    end
    
    if not home then
        return false, "Home not found"
    end
    
    -- Check if already owned
    if not playerData.homes then
        playerData.homes = {}
    end
    
    if playerData.homes[homeId] then
        return false, "Home already owned"
    end
    
    -- Check if player has enough coins
    if playerData.coins < home.cost then
        return false, "Not enough coins"
    end
    
    -- Purchase home
    playerData.coins = playerData.coins - home.cost
    playerData.homes[homeId] = home
    
    print("Home purchased:", home.name, "by", player.Name)
    return true, "Home purchased successfully"
end

function CustomizationSystem:ApplyCosmetic(player, pet, cosmeticId)
    if not player or not pet or not cosmeticId then
        return false, "Invalid parameters"
    end
    
    local GameController = require(script.Parent.GameController)
    local playerData = GameController:GetPlayerData(player)
    
    if not playerData or not playerData.cosmetics or not playerData.cosmetics[cosmeticId] then
        return false, "Cosmetic not owned"
    end
    
    -- Apply cosmetic to pet
    if not pet.cosmetics then
        pet.cosmetics = {}
    end
    
    local cosmetic = playerData.cosmetics[cosmeticId]
    pet.cosmetics[cosmetic.id] = cosmetic
    
    print("Applied cosmetic:", cosmetic.name, "to pet:", pet.id)
    return true, "Cosmetic applied successfully"
end

function CustomizationSystem:GetCodexStats()
    local stats = {
        totalMutations = #self.Codex,
        rarityBreakdown = {},
        recentDiscoveries = {}
    }
    
    -- Calculate rarity breakdown
    for _, entry in ipairs(self.Codex) do
        local rarity = entry.rarity or "Common"
        stats.rarityBreakdown[rarity] = (stats.rarityBreakdown[rarity] or 0) + 1
    end
    
    -- Get recent discoveries (last 10)
    local sorted = {}
    for _, entry in ipairs(self.Codex) do
        table.insert(sorted, entry)
    end
    
    table.sort(sorted, function(a, b) return a.discoveredAt > b.discoveredAt end)
    
    for i = 1, math.min(10, #sorted) do
        table.insert(stats.recentDiscoveries, sorted[i])
    end
    
    return stats
end

return CustomizationSystem
