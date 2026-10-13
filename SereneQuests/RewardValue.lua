-------------------------------------------------------------------------------
--  Best Reward -- when a quest lets you pick a reward, a gold coin sits on
--  the one that sells for the most at a vendor (price times count).
--
--  QuestInfoRewardsFrame also shows quests from the log (the popup detail),
--  where GetQuestItemLink does not apply, so only the quest NPC's panels are
--  marked.
-------------------------------------------------------------------------------
local _, ns = ...

local COIN, GLOW = 22, 38

local coins = {}  -- [reward button] = frame holding the coin and its glow
local active      -- the reward buttons show the quest NPC's quest
local waiting     -- a reward's price is not loaded yet

-- The glow is drawn as light (ADD), as its atlas has a black background.
-- It is the mage's arcane glow, made gray and then tinted gold.
local function Coin(button)
    local coin = coins[button]
    if not coin then
        coin = CreateFrame("Frame", nil, button)
        coin:SetSize(COIN, COIN)
        coin:SetPoint("CENTER", _G[button:GetName() .. "IconTexture"], "TOPLEFT", 6, -6)

        local icon = coin:CreateTexture(nil, "OVERLAY")
        icon:SetTexture("Interface\\MoneyFrame\\UI-GoldIcon")
        icon:SetAllPoints()

        local glow = coin:CreateTexture(nil, "BACKGROUND")
        glow:SetAtlas("Mage-ArcaneCharge-CircleGlow")
        glow:SetBlendMode("ADD")
        glow:SetDesaturated(true)
        glow:SetVertexColor(1, 0.8, 0.2)
        glow:SetSize(GLOW, GLOW)
        glow:SetPoint("CENTER")

        local flicker = coin:CreateAnimationGroup()
        flicker:SetLooping("BOUNCE")
        local alpha = flicker:CreateAnimation("Alpha")
        alpha:SetTarget(glow)
        alpha:SetFromAlpha(0.5)
        alpha:SetToAlpha(1)
        alpha:SetDuration(0.4)
        flicker:Play()

        coins[button] = coin
    end
    return coin
end

local function Value(i)
    local link = GetQuestItemLink("choice", i)
    if not link then return end
    local price = select(11, C_Item.GetItemInfo(link))
    if not price then return end
    local _, _, count = GetQuestItemInfo("choice", i)
    return price * math.max(count, 1)
end

local function Mark()
    for _, coin in pairs(coins) do coin:Hide() end
    waiting = false
    local n = GetNumQuestChoices()
    if not active or n < 2 or not ns.Get("bestQuestReward") then return end

    local values, best = {}, 0
    for i = 1, n do
        local v = Value(i)
        if not v then
            waiting = true
            return
        end
        values[i] = v
        best = math.max(best, v)
    end
    if best == 0 then return end

    local i, button = 1, QuestInfoRewardsFrameQuestInfoItem1
    while button do
        if button:IsShown() and button.type == "choice" and values[button:GetID()] == best then
            Coin(button):Show()
        end
        i = i + 1
        button = _G["QuestInfoRewardsFrameQuestInfoItem" .. i]
    end
end

hooksecurefunc("QuestInfo_Display", function(_, parentFrame)
    active = parentFrame == QuestRewardScrollChildFrame or parentFrame == QuestDetailScrollChildFrame
    Mark()
end)

local f = CreateFrame("Frame")
f:RegisterEvent("GET_ITEM_INFO_RECEIVED")
f:SetScript("OnEvent", function()
    if waiting and QuestFrame:IsShown() then Mark() end
end)

ns.RegisterFeature({
    key = "bestQuestReward", label = "Mark the most valuable reward", section = "Quests", category = "Rewards",
    tooltip = "A gold coin on the reward that sells for the most.",
    apply = function()
        if QuestFrame:IsShown() then Mark() end
    end,
})
