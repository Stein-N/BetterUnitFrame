BufEvents = {}
local handler = {}

function BufEvents:OnEvent(event, ...)
    local func = handler[event]
    if func then return func(...) end
end

function handler.ADDON_LOADED(name)
    if name == BufData["addonName"] then
        BufMenu:BuildOptionsMenu()
    end
end

function handler.PLAYER_ENTERING_WORLD()
    if PlayerContainer.portrait then PlayerContainer.portrait:Hide() end

    for _, element in pairs(PlayerContext) do element:Hide() end
    for _, element in pairs(PlayerBars) do element:Hide() end
    for _, element in pairs(PlayerContainer) do element:Hide() end

    local _, class = UnitClass("player")
    local classColor = RAID_CLASS_COLORS[class]

    local test = UnitHealth("player")

    PlayerContainer.frame_texture:Show()
    PlayerContainer.frame_texture:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-2-Row-Shadow")
    PlayerContainer.status_texture:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-3-Row-Status")
    PlayerContainer.frame_flash:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Frame-Flash")

    PlayerBars.health_bar:Show()
    PlayerBars.health_bar:SetStatusBarTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Health-Bar")
    
    if test then PlayerBars.health_bar_text:SetText(tostring(test)) end

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

    PlayerBars.health_bar_text:Show()

    PlayerBars.mana_bar:Show()

    PlayerContainer.player_name:Show()

    PlayerContainer.player_level:Show()

    PlayerContext.rest_loop:Show()
    PlayerContext.rest_loop:ClearAllPoints()
    PlayerContext.rest_loop:SetPoint("TOPRIGHT", PlayerFrame, "TOPRIGHT", 0, -20)

    -- PlayerContext.attack_icon:Show()
    PlayerContext.attack_icon:ClearAllPoints()
    PlayerContext.attack_icon:SetPoint("TOPRIGHT", PlayerFrame, "TOPRIGHT", -15, -35)

end