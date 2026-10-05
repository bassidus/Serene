-------------------------------------------------------------------------------
--  Hide Issue Hint -- removes the "Press F6 to submit an issue for this ..."
--  line (and the spacer above it) that Blizzard's beta feedback addon adds
--  to tooltips, then re-shows the tooltip to shrink it. Hooked on Show (a
--  visible tooltip refreshed) and OnShow (SetShown(true) bypasses Show).
-------------------------------------------------------------------------------
local _, ns = ...

local TOOLTIPS = {
    "GameTooltip", "ShoppingTooltip1", "ShoppingTooltip2",
    "ItemRefTooltip", "ItemRefShoppingTooltip1", "ItemRefShoppingTooltip2",
    "EmbeddedItemTooltip",
}
local PATTERN = "^Press .+ to submit an issue"

local function Plain(txt)
    return (txt:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""))
end

local function Blank(fs)
    fs:SetText("")
    fs:Hide()
end

local function Strip(tt, name)
    if tt:IsForbidden() then return end
    -- The hint sits at the end, so search backwards.
    for i = tt:NumLines(), 2, -1 do
        local left = _G[name .. "TextLeft" .. i]
        local txt = ns.Clean(left:GetText())
        if txt and Plain(txt):find(PATTERN) then
            Blank(left)
            Blank(_G[name .. "TextRight" .. i])
            local prev = _G[name .. "TextLeft" .. (i - 1)]
            local prevText = ns.Clean(prev:GetText())
            if prevText and strtrim(Plain(prevText)) == "" then Blank(prev) end
            -- Re-layout without the blanked lines; the hint is gone now, so the
            -- Show hook this triggers finds nothing and stops.
            pcall(tt.Show, tt)
            return
        end
    end
end

for _, tipName in ipairs(TOOLTIPS) do
    local function OnShow(self) Strip(self, tipName) end
    hooksecurefunc(_G[tipName], "Show", OnShow)
    _G[tipName]:HookScript("OnShow", OnShow)
end
