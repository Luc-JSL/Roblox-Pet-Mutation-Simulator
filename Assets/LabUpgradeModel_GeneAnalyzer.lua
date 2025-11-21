-- LabUpgradeModel_GeneAnalyzer.lua
-- Unique 3D model definition for the Gene Analyzer lab upgrade

local LabUpgradeModel = {}

LabUpgradeModel.Name = "Gene Analyzer"
LabUpgradeModel.Mesh = {
    Shape = "Console",
    Material = "HoloGlass",
    Color = {R = 0.7, G = 0.9, B = 0.7},
    Glow = true,
    UniqueFeatures = {"Animated Display", "Trait Scanner", "Gene Mapping Lights"}
}

LabUpgradeModel.Animations = {
    Idle = "AnalyzerIdle",
    Scan = "TraitScan"
}

LabUpgradeModel.Functionality = {
    "Reveal hidden gene traits"
}

return LabUpgradeModel
