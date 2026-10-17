-------------------------------------------------------------------------------
--  Skip BoP Warnings -- confirms the "will bind to you" questions when
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
    key = "skipLootWarnings", label = "Skip BoP warnings",
    section = "Quality of Life", category = "General",
    beside = true,
    tooltip = "No \"will bind to you\" popup when looting or rolling.",
    default = false,
    apply = function()
        for _, event in ipairs(EVENTS) do
            if ns.Get("skipLootWarnings") then f:RegisterEvent(event) else f:UnregisterEvent(event) end
        end
    end,
})
