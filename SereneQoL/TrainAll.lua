-------------------------------------------------------------------------------
--  Train All -- a button next to the trainer's Train button that learns
--  everything you can afford. Blizzard_TrainerUI loads on demand, so the
--  button is made when it loads.
-------------------------------------------------------------------------------
local _, ns = ...

local button

local function FreeProfessionSlots()
    local a, b = GetProfessions()
    return 2 - (a and 1 or 0) - (b and 1 or 0)
end

-- Can service i be bought with this much money and these free slots?
-- Returns ok, cost, takesProfessionSlot.
local function Affordable(i, money, slots)
    local _, kind = GetTrainerServiceInfo(i)
    if kind ~= "available" then return false end
    local cost, takesSlot = GetTrainerServiceCost(i)
    takesSlot = takesSlot == true  -- not every client returns a boolean there
    if cost > money or (takesSlot and slots <= 0) then return false end
    return true, cost, takesSlot
end

local function Summary()
    local n, total = 0, 0
    local money, slots = GetMoney(), FreeProfessionSlots()
    for i = 1, GetNumTrainerServices() do
        local ok, cost = Affordable(i, money, slots)
        if ok then n, total = n + 1, total + cost end
    end
    return n, total
end

local function Refresh()
    if not button then return end
    if not ns.Get("trainAllButton") then
        button:Hide()
        return
    end
    button:SetEnabled(Summary() > 0)
    button:Show()
end

local function TrainAll()
    local money, slots = GetMoney(), FreeProfessionSlots()
    -- From the bottom: a purchase reindexes the list, but only the entries
    -- already passed move, so none is skipped.
    for i = GetNumTrainerServices(), 1, -1 do
        local ok, cost, takesSlot = Affordable(i, money, slots)
        if ok then
            BuyTrainerService(i)
            money = money - cost
            if takesSlot then slots = slots - 1 end
        end
    end
end

local function Create()
    if button then return end
    button = CreateFrame("Button", nil, ClassTrainerFrame, "MagicButtonTemplate")
    button:SetText("Train All")
    button:SetSize(80, ClassTrainerTrainButton:GetHeight())
    button:SetPoint("RIGHT", ClassTrainerTrainButton, "LEFT", -2, 0)
    button:SetScript("OnClick", TrainAll)
    button:SetScript("OnEnter", function(self)
        local n, total = Summary()
        if n <= 0 then return end
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(format("Learn %d skill%s for %s", n, n == 1 and "" or "s", C_CurrencyInfo.GetCoinTextureString(total)), 1, 1, 1)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", GameTooltip_Hide)

    hooksecurefunc("ClassTrainerFrame_Update", Refresh)
    Refresh()
end

local function Apply()
    if ns.Get("trainAllButton") and C_AddOns.IsAddOnLoaded("Blizzard_TrainerUI") then Create() end
    Refresh()
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, _, addon)
    if addon ~= "Blizzard_TrainerUI" then return end
    self:UnregisterEvent("ADDON_LOADED")
    if ns.Get("trainAllButton") then Create() end
end)

ns.RegisterFeature({
    key = "trainAllButton", label = "Train All button", section = "General", category = "Vendors & trainers",
    apply = Apply,
})
