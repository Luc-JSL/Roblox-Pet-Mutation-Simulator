-- MutationChains.lua
-- Handles hybrid and chain mutations for rare forms

local MutationChains = {}

MutationChains.RareChains = {
    {Combo = {"Fire", "Shadow"}, Result = "Smoke Phantom"},
    {Combo = {"Ice", "Crystal"}, Result = "Frost Prism"},
    {Combo = {"Nature", "Electric"}, Result = "Storm Sprout"}
}

function MutationChains:GetChainResult(traits)
    for _, chain in ipairs(self.RareChains) do
        local match = true
        for _, trait in ipairs(chain.Combo) do
            if not table.find(traits, trait) then
                match = false
                break
            end
        end
        if match then return chain.Result end
    end
    return nil
end

return MutationChains
