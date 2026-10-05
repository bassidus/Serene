-------------------------------------------------------------------------------
--  Hide Issue Hint -- removes the "Press F6 to submit an issue for this ..."
--  line (and the spacer above it) that Blizzard's beta feedback addon adds
--  to tooltips. That addon re-shows the tooltip after adding its lines, so a
--  Show hook sees them; the lines are blanked and the tooltip re-shown to
--  shrink to the remaining content. OnShow alone is not enough: it only fires
--  when a hidden tooltip appears, so a refresh of a visible tooltip (moving
--  between bag slots, a unit or item update) let the line flash through.
-------------------------------------------------------------------------------
local _, ns = ...

local TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "EmbeddedItemTooltip",
}
local PATTERN = "^Press .+ to submit an issue"

local MARKER = "submit an issue"  -- cheap plain find before the full pattern

local issecret = issecretvalue
local function ReadText(fs)
    local txt = fs and fs:GetText()
    if not txt or (issecret and issecret(txt)) then return nil end
    return txt
end

-- Compare without color codes (only for the rare line that has the marker).
local function Plain(txt)
    return (txt:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
end

local function Blank(fs)
    if fs then
        fs:SetText("")
        fs:Hide()
    end
end

local function Strip(tt, name)
    if not ns.Enabled("tooltipHideIssueHint") or tt:IsForbidden() then return end
    -- The hint sits at the end, so search backwards.
    for i = tt:NumLines(), 2, -1 do
        local left = _G[name .. "TextLeft" .. i]
        local txt = ReadText(left)
        if txt and txt:find(MARKER, 1, true) and Plain(txt):find(PATTERN) then
            Blank(left)
            Blank(_G[name .. "TextRight" .. i])
            local prev = _G[name .. "TextLeft" .. (i - 1)]
            local prevText = ReadText(prev)
            if prevText and strtrim(Plain(prevText)) == "" then Blank(prev) end
            -- Re-layout without the blanked lines; the hint is gone now, so the
            -- Show hook this triggers finds nothing and stops.
            pcall(tt.Show, tt)
            return
        end
    end
end

for _, tipName in ipairs(TOOLTIPS) do
    local tt = _G[tipName]
    if tt and tt.HookScript then
        local function OnShow(self) Strip(self, tipName) end
        hooksecurefunc(tt, "Show", OnShow)
        tt:HookScript("OnShow", OnShow)  -- SetShown(true) bypasses Show
    end
end

ns.RegisterFeature({
    key = "tooltipHideIssueHint", label = "Hide Issue Hint", section = "Tooltip", category = "Hints",
    tooltip = "Removes the \"Press F6 to submit an issue\" line that the beta adds to tooltips.",
})
