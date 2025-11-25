BufMenu = {}
local langCode = GetLocale()

-- ====================== --
-- ==  Helper Methods  == --
-- ====================== --

-- Set the default value for an Option inside the SavedVariables
local function SetDefault(option)
    local key = option["key"]
    if Buf_Settings[key] then return end

    Buf_Settings[key] = option["default"]
end

-- Basic function to update the Option Value
local function UpdateSetting(setting, value)
    Buf_Settings[setting:GetVariable()] = value
end

-- Register the given Option inside the Category
local function RegisterSetting(category, option, lang)
    return Settings.RegisterAddOnSetting(
        category, option.key, option.key,
        Buf_Settings, type(option.default),
        lang.name, option.default)
end

-- Loads the Option and Lang Object from the Database
local function GetOption(optionKey)
    local option = BufSettings[optionKey]
    local lang
    if option[langCode] then
        lang = option[langCode]
    else
        lang = option["enEn"]
    end
    return option, lang
end

local function CreateSetting(category, optionKey)
    local option, lang = GetOption(optionKey)
    local setting = RegisterSetting(category, option, lang)
    setting:SetValueChangedCallback(UpdateSetting)

    return setting, lang
end

-- =========================== --
-- ==  UI Element Creation  == --
-- =========================== --

-- Create a new Checkbox inside the given Category
local function RegisterCheckbox(category, optionKey)
    local setting, lang = CreateSetting(category, optionKey)

    return Settings.CreateCheckbox(category, setting, lang["tooltip"])
end

---comment
---@param category any
---@param optionKey any
---@param btnFunc any Function that gets called when button is clicked
---@param cbRequired any Is the Checkbox required to click the Button
---@param layout any 
local function RegisterCheckBoxWithButton(category, optionKey, btnFunc, cbRequired, layout)
    local setting, lang = CreateSetting(category, optionKey)
    local entry = CreateSettingsCheckboxWithButtonInitializer(setting,
                    lang["button"] or "missing_translation", btnFunc, cbRequired, lang["tooltip"])

    layout:AddInitializer(entry)
end

-- Create a new Dropdown Menu inside the given Category
local function RegisterDropdown(category, optionKey, func)
    local setting, lang = CreateSetting(category, optionKey)

    Settings.CreateDropdown(category, setting, func, lang["tooltip"])
end

-- Create a new SLider inside the given Category
local function RegisterSlider(category, optionKey, min, max, steps, suffix)
    local setting, lang = CreateSetting(category, optionKey)

    local sliderValues = Settings.CreateSliderOptions(min, max, steps)
    sliderValues:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value .. (suffix or "")
    end)
    Settings.CreateSlider(category, setting, sliderValues, lang["tooltip"])
end

-- =========================== --
-- ==  Option Menu Builder  == --
-- =========================== --
local test, tLayout
function BufMenu:BuildOptionsMenu()
    local general = Settings.RegisterVerticalLayoutCategory(BufData.addon_name)
    test, tLayout = Settings.RegisterVerticalLayoutSubcategory(general, "Test")

    -- Register all Default Values
    for _, key in ipairs(BufSettings) do
        local option = BufSettings[key]
        SetDefault(option)
    end

    -- == General Tab == --
    local tInit = Settings.CreatePanelInitializer("PlayerUnitFramePreviewTemplate", {})
    tLayout:AddInitializer(tInit)

    Settings.RegisterAddOnCategory(general)
end

SLASH_BETTERUNITFRAME1 = "/buf"
SlashCmdList["BETTERUNITFRAME"] = function(msg)
    Settings.OpenToCategory(test:GetID())
end