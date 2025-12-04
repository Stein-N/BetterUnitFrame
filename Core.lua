-- ===================================== --
-- ==         Saved Variables         == --
-- ===================================== --
BetterUnitFrameSettings = {}

-- ===================================== --
-- ==        Global Variables         == --
-- ===================================== --
LangCode = GetLocale()

-- ===================================== --
-- ==         Addon Variables         == --
-- ===================================== --
local frame = CreateFrame("Frame")

frame:RegisterEvent("ADDON_LOADED")

frame:SetScript("OnEvent", function(self, event, ...)
    BufEvents:OnEvent(event, ...)
end)

function PrintInfo(element)
    element:Show()
    print("point: ", element:GetPoint())
    print("Size: ", element:GetSize())
    print("Scale: ", element:GetScale())
end