FrameTextureComponentSettingsMixin = CreateFromMixins(BaseComponentSettingsMixin)

function FrameTextureComponentSettingsMixin:BuildSettings()
    SettingsComponents:CreateSlider(self, "Test Slider", 0, 100, 5, "%", function(v) print(v) end)
    SettingsComponents:CreateCheckbox(self, "Test Checkbox", function(v) print(v) end)


    local test = Settings.CreateControlTextContainer()
    test:Add("option_a", "Option A")
    test:Add("option_b", "Option B")

    SettingsComponents:CreateDropdown(self, "Test Dropdown", test:GetData(), function(v) print(v) end)
    SettingsComponents:CreateDropdown(self, "Test Dropdown 2", test:GetData(), function(v) print(v) end)

    self:UpdateLayout()
    self.isBuilt = true
end