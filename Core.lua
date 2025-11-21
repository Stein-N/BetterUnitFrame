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

local dirtyCheck = false
hooksecurefunc(PlayerBars.health_bar_text, "SetText", function(self)
    local health = UnitHealth("player")
    if dirtyCheck then
        dirtyCheck = false
    else
        dirtyCheck = true
        if health then
            self:SetText(tostring(health))
        end
    end
end)

-- local dirtyCheck2 = false
-- hooksecurefunc(ResourceFrames.DEATHKNIGHT, "SetPoint", function(self)
--     if dirtyCheck2 then
--         dirtyCheck2 = false
--     else
--         dirtyCheck2 = true
--         self:ClearAllPoints()
--         self:SetPoint("RIGHT", PlayerFrame, "RIGHT", -20, -35)
--     end
-- end)

local dirtyCheck3 = false
hooksecurefunc(TotemFrame, "SetPoint", function(self)
    if dirtyCheck3 then
        dirtyCheck3 = false
    else
        dirtyCheck3 = true
        self:ClearAllPoints()
        self:SetPoint("LEFT", PlayerFrame, "LEFT", 0, -38)
    end
end)

local dirtyCheck4 = false
hooksecurefunc(PlayerBars.mana_bar_text, "SetText", function(self)
    local health = UnitPower("player")
    if dirtyCheck4 then
        dirtyCheck4 = false
    else
        dirtyCheck4 = true
        if health then
            self:SetText(tostring(health))
        end
    end
end)