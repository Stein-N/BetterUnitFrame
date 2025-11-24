local frame = CreateFrame("Frame", "BetterUnitFrameDesigner", UIParent, "DefaultPanelTemplate")

frame:SetTitle("Better Unit Frame")
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
frame:SetSize(500, 500)
frame:SetFrameStrata("HIGH")
frame:SetFrameLevel(999)

frame:SetMovable(true)
frame:SetClampedToScreen(true)
frame:RegisterForDrag("LeftButton")
frame:EnableMouse(true)

DesignerBase.SetElementMoveArea(frame, 0, 0, frame:GetWidth(), -30)

local btn = CreateFrame("Button", "DesignerCloseButton", frame, "GameMenuButtonTemplate")
btn:SetText("Close")
local width, height = BufUtils.GetStringSize(btn:GetText())
btn:SetSize(width + 20, height + 10)
btn:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -3, 5)
btn:SetScale(1.15)

local generalTab = CreateFrame("Frame", "TestTab", frame, "BackdropTemplate")
local titleObj = generalTab:CreateFontString("GeneralTabTitle", "OVERLAY", "GameFontNormalLarge2")
titleObj:SetText("General")
titleObj:SetPoint("TOPLEFT", generalTab, "TOPLEFT", 5, -5)
generalTab:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -60)
generalTab:SetSize(frame:GetWidth() - 25, frame:GetHeight() - 95)

local tabs = {"General", "Player", "Target", "Focus", "Boss"}
local x = 0
for index, key in ipairs(tabs) do
    local b = CreateFrame("Button", "BetterUnitFrameDesignerTab"..key, frame, "GameMenuButtonTemplate")
    local width, height = BufUtils.GetStringSize(key)
    b:SetText(key)
    b:SetSize(width + 20, height + 10)
    b:SetPoint("TOPLEFT", frame, "TOPLEFT", 15 + x, -28)
    b:SetScale(1.15)



    x = x + b:GetWidth() + 4
end


frame:Show()