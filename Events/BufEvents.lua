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
    ChangeUnitFrame()
end

function handler.PLAYER_SPECIALIZATION_CHANGED()
    ChangeUnitFrame()
end

function ChangeUnitFrame()
    if PlayerContainer.portrait then PlayerContainer.portrait:Hide() end

    for _, element in pairs(PlayerContext) do element:Hide() end
    for _, element in pairs(PlayerBars) do element:Hide() end
    for _, element in pairs(PlayerContainer) do element:Hide() end

    local _, class = UnitClass("player")
    local specIndex = GetSpecialization()
    local _, specName = GetSpecializationInfo(specIndex)

    print("Class:", class, "Spec:", specName)
    local color = RAID_CLASS_COLORS[class]

    local atlas = BufMedia.atlas
    local frame = BufMedia.no_portrait_2_row_shadow
    local bar = BufMedia.no_portrait_health_bar

    PlayerContainer.frame_texture:Show()
    PlayerContainer.frame_texture:SetTexture(atlas)
    PlayerContainer.frame_texture:SetTexCoord(frame.left, frame.right, frame.top, frame.bottom)

    PlayerBars.health_bar:Show()
    PlayerBars.health_bar:SetStatusBarTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Health")
    PlayerBars.health_bar:SetStatusBarColor(color.r, color.g, color.b)
    PlayerBars.health_bar:SetWidth(192)
    PlayerBars.health_bar:SetHeight(23)
    PlayerBars.health_bar:ClearAllPoints()
    PlayerBars.health_bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 20, -30)

    PlayerBars.health_bar_text:Show()
    PlayerBars.health_bar_text:ClearAllPoints()
    PlayerBars.health_bar_text:SetPoint("RIGHT", PlayerBars.health_bar, "RIGHT", -5, 0)
    PlayerBars.health_bar_text:SetScale(1.4)

    PlayerBars.mana_bar:Show()
    PlayerBars.mana_bar:ClearAllPoints()
    PlayerBars.mana_bar:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 20, -56)
    PlayerBars.mana_bar:SetWidth(192)
    PlayerBars.mana_bar:SetHeight(12)

    PlayerBars.mana_bar_text:Show()
    PlayerBars.mana_bar_text:ClearAllPoints()
    PlayerBars.mana_bar_text:SetPoint("RIGHT", PlayerBars.mana_bar, "RIGHT", -5, 0)
    PlayerBars.mana_bar_text:SetScale(1.2)

    PlayerContainer.player_name:Show()
    PlayerContainer.player_name:ClearAllPoints()
    PlayerContainer.player_name:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 20, -16)

    PlayerContainer.player_level:Show()
    PlayerContainer.player_level:ClearAllPoints()
    PlayerContainer.player_level:SetPoint("TOPRIGHT", PlayerFrame, "TOPRIGHT", -20, -17)

    -- if not ResourceFrames.DEMONHUNTER then return end

    -- ResourceFrames.DEMONHUNTER:Show()
    -- ResourceFrames.DEMONHUNTER:ClearAllPoints()
    -- ResourceFrames.DEMONHUNTER:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 20, -70)
    -- UpdateDemonHunterResourceFrame()
end

-- function UpdateDemonHunterResourceFrame()
--     local test = {ResourceFrames.DEMONHUNTER.PowerBarMask,  ResourceFrames.DEMONHUNTER.Deplete, ResourceFrames.DEMONHUNTER.Ready,
--                     ResourceFrames.DEMONHUNTER.CollapsingStarDepleteFin, ResourceFrames.DEMONHUNTER.CollapsingStarBackground,
--                     ResourceFrames.DEMONHUNTER.Glow}

--     for _, element in pairs(test) do
--         element:ClearAllPoints()
--         element:SetPoint("TOPLEFT", ResourceFrames.DEMONHUNTER, "TOPLEFT", 0, 0)
--         element:SetPoint("BOTTOMRIGHT", ResourceFrames.DEMONHUNTER, "BOTTOMRIGHT", 0, 0)
--     end
-- end