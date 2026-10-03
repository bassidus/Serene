-------------------------------------------------------------------------------
--  Skip Loot Warnings -- answers "yes" to the "this item will bind to you"
--  questions when looting a bind-on-pickup item or rolling Need/Greed on
--  one, and closes Blizzard's popup. Equipping a bind-on-equip item still
--  asks. Events are only registered while the setting is on.
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
    key = "skipLootWarnings", label = "Skip Loot Warnings", section = "General",
    apply = function()
        for _, event in ipairs(EVENTS) do
            if ns.Enabled("skipLootWarnings") then
                pcall(f.RegisterEvent, f, event)
            else
                pcall(f.UnregisterEvent, f, event)
            end
        end
    end,
    tooltip = "No \"will bind to you\" question when you loot a bind-on-pickup item or roll Need/Greed on one. "
        .. "Equipping a bind-on-equip item still asks.",
})
