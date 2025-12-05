PlayerFrameComponentSettingsMixin = {}

function PlayerFrameComponentSettingsMixin:OnLoad()
    self.settings = {}

    if not self.isBuilt then
        SettingsComponents:CreateSlider(self, "Test", 0, 100,
        function(v) return v .. "%" end, function(v) print(v) end)
        SettingsComponents:CreateCheckbox(self, "Test Checkbox", function(v) print(v) end)


        local yPos = 0
        for _, setting in ipairs(self.settings) do
            if setting then
                setting:SetPoint("TOPLEFT", self, "TOPLEFT", 30, yPos)
                setting:SetPoint("RIGHT", self, "RIGHT", -30, yPos)
                yPos = yPos - setting:GetHeight()
            end
        end
    end
end