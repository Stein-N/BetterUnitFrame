FrameTextureComponentMixin = CreateFromMixins(BaseComponentMixin)

function FrameTextureComponentMixin:BuildSettings(category)
    if not self.isBuilt then
        local init = Settings.CreatePanelInitializer("FrameTextureComponentSettings", { component = self })
        init:AddShownPredicate(function() return self.isFocused end)
        SettingsPanel:GetLayout(category):AddInitializer(init)

        self.isBuilt = true
    end
end