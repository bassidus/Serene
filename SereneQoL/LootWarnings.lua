-------------------------------------------------------------------------------
--  Skip Bind-on-Pickup Warnings -- confirms the "will bind to you" questions when
--  looting or rolling on a bind-on-pickup item.
-------------------------------------------------------------------------------
local _, ns = ...

local EVENTS = { "LOOT_BIND_CONFIRM", "CONFIRM_LOOT_ROLL", "CONFIRM_DISENCHANT_ROLL" }

-- Closed a frame later, after Blizzard has shown it.
local function HideBind() StaticPopup_Hide("LOOT_BIND") end
local function HideRoll() StaticPopup_Hide("CONFIRM_LOOT_ROLL") end

local f = CreateFrame("Frame")
f:SetScript("OnEvent", function(_, event, id, rollType)
    if event == "LOOT_BIND_CONFIRM" then
        ConfirmLootSlot(id)
        C_Timer.After(0, HideBind)
    else
        ConfirmLootRoll(id, rollType)
        C_Timer.After(0, HideRoll)
    end
end)

ns.RegisterFeature({
    key = "skipLootWarnings", label = "Skip bind-on-pickup warnings",
    section = "Quality of life", category = "Loot & items",
    apply = function()
        for _, event in ipairs(EVENTS) do
            if ns.Enabled("skipLootWarnings") then
                pcall(f.RegisterEvent, f, event)
            else
                pcall(f.UnregisterEvent, f, event)
            end
        end
    end,
    tooltip = "Answers yes for you when the game asks whether an item may bind to you, on loot and on rolls.",
})
