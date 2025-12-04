PlayerFrameComponentMixin = CreateFromMixins(BaseComponentMixin)

function PlayerFrameComponentMixin:BuildSettings(category)
    if not self.isBuilt then
        local init = Settings.CreatePanelInitializer("PlayerFrameComponentSettings", { component = self })
        init:AddShownPredicate(function() return self.isFocused end)
        SettingsPanel:GetLayout(category):AddInitializer(init)

        self.isBuilt = true
    end
end