FrameTextureComponentSettingsMixin = CreateFromMixins(BaseComponentSettingsMixin)

function FrameTextureComponentSettingsMixin:LoadComponentSettings()
    self.settings = {
        texture = "Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Atlas",
        textureCoords = BufMedia.GetTexCoords("no_portrait_2_row_shadow"),
        xPos = 0,
        yPos = 0
    }
end

function FrameTextureComponentSettingsMixin:BuildSettings()
    local textures = Settings.CreateControlTextContainer()
    textures:Add("no_portrait_2_row_shadow", "No Portrait")
    textures:Add("no_portrait_2_row", "No Portrait - No Shadow")

    SettingsComponents:CreateDropdown(self, "Texture", textures:GetData(), function(v) self.settings.textureCoords = BufMedia.GetTexCoords(v) end)
    SettingsComponents:CreateSlider(self, "X Position", -50, 50, 1, "", function(v) print(v) end)
    SettingsComponents:CreateSlider(self, "Y Position", -50, 50, 1, "", function(v) print(v) end)

    self:UpdateLayout()
    self.isBuilt = true
end

function FrameTextureComponentSettingsMixin:UpdateComponent()
    local c = self:GetElementData().data.component
    if c then
        c.Texture:SetTexture(self.settings.texture)
        local t = self.settings.textureCoords
        c.Texture:SetTexCoord(t.left, t.right, t.top, t.bottom)
    end
end