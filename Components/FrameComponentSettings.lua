PlayerFrameComponentSettingsMixin = {}

function PlayerFrameComponentSettingsMixin:OnLoad()
    local slider = SettingsComponents:CreateSlider(self, "Test", -100, 100,
    function(v) return v .. "%" end, function(v) print(v) end)
end