-- HomeModel_ForestDen.lua
-- Unique pet home asset: Forest Den

local HomeModel = {}

HomeModel.Name = "Forest Den"
HomeModel.Mesh = {
    Shape = "Tree Hollow",
    Material = "Wood Moss",
    Color = {R = 0.2, G = 0.6, B = 0.2},
    Glow = false,
    UniqueFeatures = {"Animated Fireflies", "Mushroom Patch", "Hidden Tunnel"}
}

return HomeModel
