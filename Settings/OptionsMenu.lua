OptionsMenu = {}
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
    local variable = option["key"]
    return Settings.RegisterAddOnSetting(
        category, -- Given Category, can also be a Subcategory
        variable, -- Option Variable
        variable, -- Option Variable
        Buf_Settings, -- AddOn Options Database
        type(option["default"]), -- Gets the Option Datatype from the default Value
        lang["name"], -- Option Name visible in the UI
        option["default"] -- Default value
    )
end

-- Loads the Option and Lang Object from the Database
local function GetOption(optionKey)
    local option = AddOnSettings[optionKey]
    local lang = option[langCode] or option["enEN"]
    return option, lang
end

-- =========================== --
-- ==  UI Element Creation  == --
-- =========================== --

-- Create a new Checkbox inside the given Category
local function RegisterCheckbox(category, optionKey)
    local option, lang = GetOption(optionKey)
    local setting = RegisterSetting(category, option, lang)
    setting:SetValueChangedCallback(UpdateSetting)

    Settings.CreateCheckbox(category, setting, lang["tooltip"])
end

-- Create a new Dropdown Menu inside the given Category
local function RegisterDropdown(category, optionKey, func)
    local option, lang = GetOption(optionKey)
    local setting = RegisterSetting(category, option, lang)
    setting:SetValueChangedCallback(UpdateSetting)

    Settings.CreateDropdown(category, setting, func, lang["tooltip"])
end

-- Create a new SLider inside the given Category
local function RegisterSlider(category, optionKey, min, max, steps, suffix)
    local option, lang = GetOption(optionKey)
    local setting = RegisterSetting(category, option, lang)
    setting:SetValueChangedCallback(UpdateSetting)

    local sliderValues = Settings.CreateSliderOptions(min, max, steps)
    sliderValues:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value .. (suffix or "")
    end)
    Settings.CreateSlider(category, setting, sliderValues, lang["tooltip"])
end

-- =========================== --
-- ==  Option Menu Builder  == --
-- =========================== --

function OptionsMenu:BuildOptionsMenu()
    local general = Settings.RegisterVerticalLayoutCategory(AddOnData["addonName"])

    -- Register all Default Values
    for _, key in ipairs(OptionsMenu) do
        local option = OptionsMenu[key]
        SetDefault(option)
    end

    -- == General Tab == --
    RegisterCheckbox(general, "toggleBetterFrames")

    Settings.RegisterAddOnCategory(general)
end