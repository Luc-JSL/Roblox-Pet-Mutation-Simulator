-- MainMenuUI.lua
-- Main menu interface for game navigation

local MainMenuUI = {}

MainMenuUI.Elements = {
    StartButton = {
        label = "Start Game",
        icon = "rbxassetid://10000001",
        animation = "FadeIn",
        onClick = function()
            print("Game Started!")
        end
    },
    PetCollectionButton = {
        label = "Pets",
        icon = "rbxassetid://10000002",
        animation = "SlideIn",
        onClick = function()
            print("Show Pet Collection")
        end
    },
    ShopButton = {
        label = "Shop",
        icon = "rbxassetid://10000003",
        animation = "Bounce",
        onClick = function()
            print("Open Shop")
        end
    },
    LeaderboardButton = {
        label = "Leaderboard",
        icon = "rbxassetid://10000004",
        animation = "FadeIn",
        onClick = function()
            print("Show Leaderboard")
        end
    },
    SettingsButton = {
        label = "Settings",
        icon = "rbxassetid://10000005",
        animation = "SlideIn",
        onClick = function()
            print("Open Settings")
        end
    }
}

function MainMenuUI:Show()
    print("[UI] Main Menu Displayed with animated buttons and icons.")
    for name, element in pairs(self.Elements) do
        print("[UI]", element.label, "Icon:", element.icon, "Animation:", element.animation)
    end
end

return MainMenuUI
