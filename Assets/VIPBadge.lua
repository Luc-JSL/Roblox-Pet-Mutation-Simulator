-- VIPBadge.lua
-- Unique asset for VIP membership badge

local VIPBadge = {}

VIPBadge.Name = "VIP Badge"
VIPBadge.Mesh = {
    Shape = "Medal",
    Material = "Platinum",
    Color = {R = 0.9, G = 0.9, B = 0.9},
    Glow = true,
    UniqueFeatures = {"Animated Shine", "Gem Center"}
}

return VIPBadge
