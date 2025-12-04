PlayerFrameComponentMixin = CreateFromMixins(BaseComponentMixin)

function PlayerFrameComponentMixin:BuildSettings(category, value)
    if not self.isBuilt then
        local slider = SM.CreateSlider(category, value, 0, 100, 5, "%", function(s, v) BetterUnitFrameSettings[s:GetVariable()] = v end)
        slider:AddShownPredicate(function() return self.isFocused end)
        SettingsPanel:GetLayout(category):AddInitializer(slider)

        self.isBuilt = true
    end
end