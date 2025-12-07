FrameTextureComponentMixin = CreateFromMixins(BaseComponentMixin)

function FrameTextureComponentMixin:BuildSettings(category)
    if not self.isBuilt then
        local init = Settings.CreatePanelInitializer("FrameTextureComponentSettingsContent", { component = self })
        init:AddShownPredicate(function() return self.isFocused end)
        SettingsPanel:GetLayout(category):AddInitializer(init)

        self.isBuilt = true
    end
end