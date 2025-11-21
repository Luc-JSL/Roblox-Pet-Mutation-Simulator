-- MapUI.lua
-- Interactive map interface for zone selection and navigation

local MapUI = {}

MapUI.Elements = {
    ZoneIcons = {
        animation = "PolyPulse",
        responsive = true,
        style = "LowPoly"
    },
    ZonePanel = {
        animation = "PolySlide",
        info = true,
        style = "LowPoly"
    },
    EventIndicator = {
        animation = "PolyGlow",
        seasonal = true,
        style = "LowPoly"
    },
    NavigateButton = {
        label = "Go",
        animation = "PolyBounce",
        style = "LowPoly"
    }
}

function MapUI:ShowMap(zones)
    print("[UI] Poly-Themed Map Displayed with low-poly animated zone icons and panels.")
    for _, zone in ipairs(zones) do
        print("[UI] Zone:", zone.Name, "Icon:", zone.Icon, "Theme:", zone.PolyTheme, "Desc:", zone.Description)
    end
end

function MapUI:OnZoneSelect(zoneName, mapSystem)
    local zone = mapSystem:NavigateTo(zoneName)
    if zone then
        print("[UI] Navigated to:", zone.Name)
    end
end

return MapUI
