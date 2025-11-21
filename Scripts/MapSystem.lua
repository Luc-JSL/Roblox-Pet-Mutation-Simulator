-- MapSystem.lua
-- Manages zones, navigation, and map events

local MapSystem = {}

MapSystem.Zones = {
    {Name = "Volcano", Icon = "rbxassetid://51000001", PolyTheme = "LowPolyMountain", ExclusiveMutation = "Magma Drake", Description = "Jagged low-poly volcano with lava flows and angular rocks."},
    {Name = "Ice Cave", Icon = "rbxassetid://51000002", PolyTheme = "LowPolyCave", ExclusiveMutation = "Frost Prism", Description = "Crystal blue low-poly ice cave with faceted icicles and snow."},
    {Name = "Enchanted Forest", Icon = "rbxassetid://51000003", PolyTheme = "LowPolyForest", ExclusiveMutation = "Storm Sprout", Description = "Vibrant low-poly forest with geometric trees and polygonal flowers."},
    {Name = "Star Valley", Icon = "rbxassetid://51000004", PolyTheme = "LowPolyValley", ExclusiveMutation = "Solar Lion", Description = "Open low-poly valley with star-shaped rocks and angular grass."},
    {Name = "Moon Sanctum", Icon = "rbxassetid://51000005", PolyTheme = "LowPolySanctum", ExclusiveMutation = "Aether Wolf", Description = "Mystical low-poly moon temple with polygonal pillars and glowing crystals."}
}

MapSystem.SeasonalEvents = {
    Winter = {Zone = "Ice Cave", Event = "Frost Mutation"},
    Halloween = {Zone = "Enchanted Forest", Event = "Shadow Mutation"}
}

function MapSystem:GetZone(name)
    for _, zone in ipairs(self.Zones) do
        if zone.Name == name then return zone end
    end
    return nil
end

function MapSystem:NavigateTo(zoneName)
    local zone = self:GetZone(zoneName)
    if zone then
        print("Navigating to zone:", zone.Name)
        -- Trigger zone event, play SFX, update UI
        return zone
    else
        print("Zone not found:", zoneName)
    end
end

return MapSystem
