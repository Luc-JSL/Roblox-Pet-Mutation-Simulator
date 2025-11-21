-- HomeModel_Island.lua
-- Unique pet home asset: Island

local HomeModel = {}

HomeModel.Name = "Island"
HomeModel.Mesh = {
    Shape = "Floating Island",
    Material = "Grass Rock",
    Color = {R = 0.3, G = 0.8, B = 0.4},
    Glow = false,
    UniqueFeatures = {"Palm Trees", "Waterfall", "Animated Birds"}
}

return HomeModel
