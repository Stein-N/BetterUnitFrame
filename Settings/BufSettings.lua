BufSettings = {}
local langCode = GetLocale()

BUFMenu = Settings.RegisterVerticalLayoutCategory(BufData.addon_name)
BUFSubMenu = {}

function BufSettings.InitializeSettings()
    for _, value in ipairs(Options) do
        local option = Options[value]

        if option and option.key then
            local key = option.key

            if BUFS and not BUFS[key] then
                BUFS[key] = option.default
            end
        end
    end
end

function BufSettings.CreateSubMenu(name, template)
    local category, layout = Settings.RegisterVerticalLayoutSubcategory(BUFMenu, name)
    local initializer = Settings.CreatePanelInitializer(template, {})

    BUFSubMenu[name] = {
        category = category,
        layout = layout
    }

    -- TODO: Remove 
    SLASH_BETTERUNITFRAME1 = "/buf"
    SlashCmdList["BETTERUNITFRAME"] = function(msg)
        Settings.OpenToCategory(category:GetID())
    end

    layout:AddInitializer(initializer)
end

function BufSettings.UpdateSetting(setting, value)
    if BUFS then
        BUFS[setting:GetVariable()] = value
    end
end

function BufSettings.CreateSetting(category, key)
    local option = Options[key]
    local lang = option[langCode] or option.enEN

    if option and lang then
        local setting = Settings.RegisterAddOnSetting(category, option.key,
        option.key, BUFS, type(option.default), lang.name, option.default)

        setting:SetValueChangedCallback(BufSettings.UpdateSetting)

        return setting, lang
    end
end

function BufSettings.CreateCheckbox(category, key)
    local s, l = BufSettings.CreateSetting(category, key)

    if s and l then
        Settings.CreateCheckbox(category, s, l.tooltip)
    end
end

function BufSettings.CreateCheckboxWithButton(category, key, func, req, layout)
    local s, l = BufSettings.CreateSetting(category, key)
    if s and l then
        local entry = CreateSettingsCheckboxWithButtonInitializer(s, l.button or "missing_translation",func, req, l.toolip)

        layout:AddInitializer(entry)
    end
end

function BufSettings.CreateDropdown(category, key, func)
    local s, l = BufSettings.CreateSetting(category, key)
    if s and l then
        Settings.CreateDropdown(category, s, func, l.tooltip)
    end
end

function BufSettings.CreateSlider(category, key, min, max, steps, suffix)
    local s, l = BufSettings.CreateSetting(category, key)
    local values = Settings.CreateSliderOptions(min, max, steps)
    values:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(v)
        return v .. (suffix or "")
    end)

    Settings.CreateSlider(category, s, values, l.tooltip)
end

function BufSettings.InitializeMenu()
    BufSettings.InitializeSettings()

    BuildPlayerFrameMenu(Settings.RegisterVerticalLayoutSubcategory(BUFMenu, "PlayerFrame"))

    Settings.RegisterAddOnCategory(BUFMenu)
end