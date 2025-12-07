BaseComponentMixin = {}

function BaseComponentMixin:UpdateComponent()end

function BaseComponentMixin:SetFocus()
    if not self.isFocused then
        self.isFocused = true
        self:SetBackdropBorderColor(1, 1, 1, 0.4)

        SettingsMenu:SetComponentFocus(self)

        SettingsInbound.RepairDisplay()
    end
end

function BaseComponentMixin:Unfocus()
    self.isFocused = false
    self:SetBackdropBorderColor(1, 1, 1, 0)

    SettingsInbound.RepairDisplay()
end


--- ============================== ---
--- ===      Frame Texture     === ---
--- ============================== ---
FrameTextureComponentMixin = CreateFromMixins(BaseComponentMixin)

function FrameTextureComponentMixin:BuildSettings(category)
    if not self.isBuilt then
        local init = Settings.CreatePanelInitializer("FrameTextureComponentSettings", { component = self })
        init:AddShownPredicate(function() return self.isFocused end)
        SettingsPanel:GetLayout(category):AddInitializer(init)

        self:UpdateComponent()
        self.isBuilt = true
    end
end

function FrameTextureComponentMixin:UpdateComponent()
    if self.Texture then
        self.Texture:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Atlas")
        local coord = BufMedia.GetTexCoords(BufComponents.Player.Frame.texture)
        self.Texture:SetTexCoord(coord.left, coord.right, coord.top, coord.bottom)
    end
end