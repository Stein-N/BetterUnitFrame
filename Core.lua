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

frame:SetScript("OnEvent", function(self, event, ...)
    BufEvents:OnEvent(event, ...)
end)