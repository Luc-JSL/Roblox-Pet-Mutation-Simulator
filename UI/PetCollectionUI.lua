-- PetCollectionUI.lua
-- UI for viewing and managing pet collection

local PetCollectionUI = {}

PetCollectionUI.Elements = {
    PetList = {
        label = "Pet List",
        animation = "GridFade",
        icon = "rbxassetid://20000001"
    },
    PetDetailsPanel = {
        label = "Pet Details",
        animation = "PanelSlide",
        icon = "rbxassetid://20000002"
    },
    SortFilterOptions = {
        label = "Sort & Filter",
        animation = "DropdownFade",
        icon = "rbxassetid://20000003"
    }
}

function PetCollectionUI:ShowCollection(pets)
    print("[UI] Pet Collection Displayed with grid animation and icons.")
    for _, pet in ipairs(pets) do
        print("[UI] Pet:", pet.Name, "Icon:", self.Elements.PetList.icon)
    end
end

return PetCollectionUI
