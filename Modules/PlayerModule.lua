PlayerModule = {}

local _atlas = BufMedia.atlas
local _, _class
local _, _specName
local _specData
local _healthColor
local _powerColor

--- Update the player's frame texture based on specialization
local function UpdateFrameTexture()
    if _specData then
        -- TODO: Switch between shadow and non shadow based on settings
        BaseModule.SetElementTexture(PlayerContainer.frame_texture, _atlas, BufMedia[_specData.frame_texture_shadow])
        BaseModule.SetElementTexture(PlayerContainer.status_texture, _atlas, BufMedia[_specData.status_texture_shadow])
        BaseModule.SetElementTexture(PlayerContainer.frame_flash, "")
    end

    PlayerContainer.portrait:Hide()
    PlayerContainer.portrait_mask:Hide()
    PlayerContext.portrait_corner_icon:SetTexture(nil)
end

local function UpdateStatusBars()
    local healthBar = PlayerBars.health_bar
    local healthText = PlayerBars.health_bar_text

    local manaBar = PlayerBars.mana_bar
    local manaText = PlayerBars.mana_bar_text

    if _specData then
        -- Hide Masks
        PlayerBars.health_bar_mask:Hide()
        PlayerBars.mana_bar_mask:Hide()

        -- Health Bar
        BaseModule.SetStatusBarTexture(healthBar, "Health-Normal")
        BaseModule.ClearAndSetPoint(healthBar, "TOPLEFT", PlayerFrame, "TOPLEFT", 20, -30)
        -- BaseModule.SetStatusBarColor(healthBar, _healthColor)
        BaseModule.SetStatusBarSize(healthBar, 192, 23)

        -- Mana Bar
        BaseModule.SetStatusBarTexture(manaBar, "Mana")
        BaseModule.ClearAndSetPoint(manaBar, "TOPLEFT", PlayerFrame, "TOPLEFT", 20, -55)
        BaseModule.SetStatusBarColor(manaBar, _powerColor)
        BaseModule.SetStatusBarSize(manaBar, 192, 11)

        -- Adjust Texts
        BaseModule.ClearAndSetPoint(healthText, "RIGHT", healthBar, "RIGHT", -2, 0)
        BaseModule.ClearAndSetPoint(manaText, "RIGHT", manaBar, "RIGHT", -2, 0)
    end
end

local function UpdateFrameIcons()

end

local function UpdateFrameText()
    
end

--- Update the text size of health and power bars
local function UpdateTextSize()
    local healthText = PlayerBars.health_bar_text
    local powerText = PlayerBars.mana_bar_text

    if _specData then
        -- TODO: Adjust text size based on settings
        healthText:SetScale(1.5)
        powerText:SetScale(1.2)
    end
end

--- Update the player's name display
local function UpdatePlayerName()
    local element = PlayerContainer.player_name

    -- TODO: Add ability to show/hide, set health_bar as relative frame and position
    BaseModule.ClearAndSetPoint(element, "TOPLEFT", PlayerFrame, "TOPLEFT", 20, -16)
end

--- Update the player's level display
local function UpdatePlayerLevel()
    local element = PlayerContainer.player_level

    -- TODO: Add ability to show/hide, set health_bar as relative frame and position
    BaseModule.ClearAndSetPoint(element, "TOPRIGHT", PlayerFrame, "TOPRIGHT", -20, -17)
end

--- Update the resource frame
local function UpdateResourceFrame()
    local frame = _specData.resource_frame
    if frame then
        frame:HookScript("OnUpdate", function(self)
            BaseModule.ClearAndSetPoint(self, "TOPRIGHT", PlayerFrame, "RIGHT", -18, -15)
        end)
    end
end

--- Update the totem frames position
local function UpdateTotemFrame()
    local frame = TotemFrame

    if frame then
        frame:HookScript("OnUpdate", function(self)
            -- TODO: Adjust position and anchor based on settings
            -- TODO: Modify TotemFrame to change start new line if a threshhold is reached
            BaseModule.ClearAndSetPoint(self, "TOPLEFT", PlayerFrame, "LEFT", 0, -18)
        end)
    end
end

--- ############################################################## ---
--- ###               Module External Functions                ### ---
--- ############################################################## ---

function PlayerModule.Initialize()
    _ , _class = UnitClass("player")
    _, _specName = GetSpecializationInfo(GetSpecialization())
    _specData = ClassData[_specName]
    _healthColor = RAID_CLASS_COLORS[_class]
    _powerColor = PowerBarColor[_specData.power_type]
end

function PlayerModule.UpdateFrame()
    UpdateFrameTexture()
    UpdateStatusBars()
    UpdatePlayerName()
    UpdatePlayerLevel()
    UpdateTextSize()
    UpdateResourceFrame()
    UpdateTotemFrame()
end

--- ############################################################## ---
--- ###                 Module Function Hooks                  ### ---
--- ############################################################## ---

function PlayerModule.InitializeHooks()

end

hooksecurefunc("UnitFrameHealthBar_OnUpdate", function(self)
    local health = UnitHealth("player")
    local perc = UnitHealthPercent("player", false, true)

    PlayerBars.health_bar_text:SetText(tostring(health) .. " - " .. string.format("%.0f", perc) .. "%")
end)

hooksecurefunc("UnitFrameManaBar_OnUpdate", function(self)
    local power = UnitPower("player")
    PlayerBars.mana_bar_text:SetText(tostring(power))
end)