-- CodexUI.lua
-- UI for mutation book and collection progress

local CodexUI = {}

CodexUI.Elements = {
    MutationList = {
        label = "Mutations",
        animation = "ListFade",
        icon = "rbxassetid://30000001"
    },
    DiscoveredPanel = {
        label = "Discovered",
        animation = "PanelSlide",
        icon = "rbxassetid://30000002"
    },
    UndiscoveredPanel = {
        label = "Undiscovered",
        animation = "PanelFade",
        icon = "rbxassetid://30000003"
    },
    ProgressBar = {
        label = "Progress",
        animation = "BarGrow",
        icon = "rbxassetid://30000004"
    }
}

function CodexUI:ShowCodex(codex)
    print("[UI] Codex Displayed with animated panels and icons.")
    for _, mutation in ipairs(codex) do
        print("[UI] Mutation:", mutation, "Icon:", self.Elements.MutationList.icon)
    end
end

return CodexUI
