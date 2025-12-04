SettingsMenu = {}
SM = SettingsMenu

BufSettingsMenu = Settings.RegisterVerticalLayoutCategory(BufData.addon_name)

function SM.InitSettings()
    for _, value in ipairs(BufSettings) do
        if value and value.key then
            local key = value.key

            if BetterUnitFrameSettings and not BetterUnitFrameSettings[key] then
                BetterUnitFrameSettings[key] = value.default
            end
        end
    end
end

function SM.CreateSetting(category, key, updateFunction)
    local data = BufSettings[key]
    local lang = data[LangCode] or data.enEN

    if data and lang then
        local set = Settings.RegisterAddOnSetting(category, data.key,
            data.key, BetterUnitFrameSettings, type(data.default), lang.name, data.default)
        set:SetValueChangedCallback(updateFunction)

        return set, lang
    end
end

function SM.CreateCheckbox(category, key, func)
    local s, l = SM.CreateSetting(category, key, func)
    if s and l then
        return Settings.CreateCheckbox(category, s, l.tooltip)
    end
end

function SM.CreateSlider(category, key, min, max, step, suffix, updateFunction)
    local s, l = SM.CreateSetting(category, key, updateFunction)
    local val = Settings.CreateSliderOptions(min, max, step)
    val:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(v)
        return v .. (suffix or "")
    end)
    return Settings.CreateSliderInitializer(s, val, l.tooltip)
end

function SM.CreateCheckboxWithButton(category, key, updateFunc, btnFunc, req)
    local s, l = SM.CreateSetting(category, key, updateFunc)
    if s and l then
        local init = CreateSettingsCheckboxWithButtonInitializer(s, l.button or "missing", btnFunc, req, l.tooltip)
        SettingsPanel:GetLayout(category):AddInitializer(init)
        return init
    end
end

DisabledSetting = true
function SM.InitMenu()
    SM.InitSettings()

    PlayerMenuMixin:CreateMenu(Settings.RegisterVerticalLayoutSubcategory(BufSettingsMenu, "Player Frame"))

    -- local cat, lay = Settings.RegisterVerticalLayoutSubcategory(BufSettingsMenu, "Test Menu")

    -- local disabled = false

    -- local t = SM.CreateCheckbox(cat, "testBoolean", function(s, v)
    --     BetterUnitFrameSettings[s:GetVariable()] = v
    --     if DisabledSetting then DisabledSetting = false else DisabledSetting = true end
    --     SettingsInbound.RepairDisplay()
    -- end)

    -- local slider = SM.CreateSlider(cat, "testSlider", 0, 100, 5, "%", function(s, v) BetterUnitFrameSettings[s:GetVariable()] = v end)
    -- slider:SetParentInitializer(t)
    -- slider:AddModifyPredicate(function()
    --     local val = BetterUnitFrameSettings["TestBoolean"]
    --     return val
    --  end)
    -- lay:AddInitializer(slider)

    Settings.RegisterAddOnCategory(BufSettingsMenu)
end