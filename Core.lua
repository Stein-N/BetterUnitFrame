-- ===================================== --
-- ==         Saved Variables         == --
-- ===================================== --
Buf_Settings = {}


-- ===================================== --
-- ==         Addon Variables         == --
-- ===================================== --
local frame = CreateFrame("Frame")

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")


frame:SetScript("OnEvent", function(self, event, ...)
    BufEvents:OnEvent(event, ...)
end)