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

    PlayerContainer.frame_texture:Show()
    PlayerContainer.frame_texture:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-2-Rows-Shadow")

    PlayerBars.health_bar:Show()
    PlayerBars.health_bar:SetStatusBarTexture("UI-HUD-UnitFrame-Player-PortraitOff-Bar-Health")
    PlayerBars.health_bar:ClearAllPoints()
    PlayerBars.health_bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 21, -25)
    PlayerBars.health_bar:SetWidth(190)
    PlayerBars.health_bar:SetHeight(28)

    PlayerBars.health_bar_text:ClearAllPoints()
    PlayerBars.health_bar_text:SetPoint("CENTER", PlayerBars.health_bar, "CENTER")
    PlayerBars.health_bar_text:SetScale(1.5)
    PlayerBars.health_bar_text:Show()

    PlayerBars.mana_bar:Show()
    PlayerBars.mana_bar:SetStatusBarTexture("UI-HUD-UnitFrame-Player-PortraitOff-Bar-RunicPower")
    PlayerBars.mana_bar:ClearAllPoints()
    PlayerBars.mana_bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 22, -54)
    PlayerBars.mana_bar:SetWidth(188)
    PlayerBars.mana_bar:SetHeight(13)

    if ResourceFrames.DEATHKNIGHT then
        ResourceFrames.DEATHKNIGHT:ClearAllPoints()
        ResourceFrames.DEATHKNIGHT:SetPoint("CENTER", PlayerFrame, "BOTTOM", 0, 0)
    end

    PlayerContainer.player_name:Show()
    PlayerContainer.player_name:ClearAllPoints()
    PlayerContainer.player_name:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 35, -14)


    PlayerContainer.player_level:Show()
    PlayerContainer.player_level:ClearAllPoints()
    PlayerContainer.player_level:SetPoint("TOPRIGHT", PlayerFrame, "TOPRIGHT", -30, -14)
end