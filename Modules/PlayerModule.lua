PlayerModule = {}

local _atlas = BufMedia.atlas
local _, _class
local _, _specName
local _specData
local _healthColor
local _powerColor


function PlayerModule.Initialize()
    _ , _class = UnitClass("player")
    _, _specName = GetSpecializationInfo(GetSpecialization())
    _specData = ClassData[_specName]
    _healthColor = RAID_CLASS_COLORS[_class]
    _powerColor = PowerBarColor[_specData.power_type]
end

--- Update the player's frame texture based on specialization
function PlayerModule.UpdateFrameTexture()
    local element = PlayerContainer.frame_texture

    if _specData then
        -- TODO: Switch between shadow and non shadow based on settings
        BaseModule.SetElementTexture(element, _atlas, BufMedia[_specData.frame_texture_shadow])
    end
end

--- Update the player's health bar based
function PlayerModule.UpdateHealthBar()
    local element = PlayerBars.health_bar
    local elementText = PlayerBars.health_bar_text

    if _healthColor and _specData then
        BaseModule.SetStatusBarTexture(element, "Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Health")
        BaseModule.ClearAndSetPoint(element, "TOPLEFT", PlayerFrame, "TOPLEFT", 20, -30)
        BaseModule.SetStatusBarColor(element, _healthColor)
        BaseModule.SetStatusBarSize(element, 192, 23)

        -- TODO: Adjust text position and anchor point based on settings
        BaseModule.ClearAndSetPoint(elementText, "RIGHT", element, "RIGHT", -2, 0)
    end
end

--- Update the player's power bar based
function PlayerModule.UpdatePowerBar()
    local element = PlayerBars.mana_bar
    local elementText = PlayerBars.mana_bar_text

    if _powerColor and _specData then
        BaseModule.SetStatusBarTexture(element, "Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Mana")
        BaseModule.ClearAndSetPoint(element, "TOPLEFT", PlayerFrame, "TOPLEFT", 21, -55)
        BaseModule.SetStatusBarColor(element, _powerColor)
        BaseModule.SetStatusBarSize(element, 192, 11)

        -- TODO: Adjust text position and anchor point based on settings
        BaseModule.ClearAndSetPoint(elementText, "RIGHT", element, "RIGHT", -2, 0)
    end
end

--- Update the text size of health and power bars
function PlayerModule.UpdateTextSize()
    local healthText = PlayerBars.health_bar_text
    local powerText = PlayerBars.mana_bar_text

    if _specData then
        -- TODO: Adjust text size based on settings
        healthText:SetScale(1.5)
        powerText:SetScale(1.2)
    end
end

--- Update the player's name display
function PlayerModule.UpdatePlayerName()
    local element = PlayerContainer.player_name

    -- TODO: Add ability to show/hide, set health_bar as relative frame and position
    BaseModule.ClearAndSetPoint(element, "TOPLEFT", PlayerFrame, "TOPLEFT", 20, -16)
end

--- Update the player's level display
function PlayerModule.UpdatePlayerLevel()
    local element = PlayerContainer.player_level

    -- TODO: Add ability to show/hide, set health_bar as relative frame and position
    BaseModule.ClearAndSetPoint(element, "TOPRIGHT", PlayerFrame, "TOPRIGHT", -20, -17)
end

--- Update the resource frame
function PlayerModule.UpdateResourceFrame()
    if _specData then
        local frame = _specData.resource_frame

        -- TODO: Add ability to show/hide, set health_bar as relative frame and position
        BaseModule.ClearAndSetPoint(frame, "TOPRIGHT", PlayerFrame, "RIGHT", -18, -15)
    end
end

--- Update the totem frames position
function PlayerModule.UpdateTotemFrame()
    local frame = TotemFrame

    if frame then

        -- TODO: ADjust position and anchor based on settings
        -- TODO: Modify TotemFrame to change start new line if a threshhold is reached
        BaseModule.ClearAndSetPoint(frame, "TOPLEFT", PlayerFrame, "BOTTOMLEFT", 0, 0)
    end
end