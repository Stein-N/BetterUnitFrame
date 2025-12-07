BaseComponentSettingsMixin = {}

function BaseComponentSettingsMixin:OnLoad()
    self.layout = {}
    self.settings = {}

    if not self.isBuilt then
        self:BuildSettings()
    end
end

function BaseComponentSettingsMixin:UpdateLayout()
    local yPos = 0
    for _, entry in ipairs(self.layout) do
        entry:SetPoint("TOPLEFT", self, "TOPLEFT", 30, yPos)
        entry:SetPoint("RIGHT", self, "RIGHT", -30, yPos)
        yPos = yPos - entry:GetHeight()

        if self:GetHeight() <= yPos then
            self:SetHeight(yPos)
        end
    end
end

function BaseComponentSettingsMixin:BuildSettings()end

--- ============================== ---
--- ===      Frame Texture     === ---
--- ============================== ---
FrameTextureComponentSettingsMixin = CreateFromMixins(BaseComponentSettingsMixin)

function FrameTextureComponentSettingsMixin:BuildSettings()
    local textures = Settings.CreateControlTextContainer()
    textures:Add("no_portrait_2_row_shadow", "No Portrait")
    textures:Add("no_portrait_2_row", "No Portrait - No Shadow")

    SettingsComponents:CreateDropdown(self, "Texture", textures:GetData(), function(v) self.settings.frameTextureCoords = BufMedia.GetTexCoords(v) end)

    self:UpdateLayout()
    self:UpdateComponent()
    self.isBuilt = true
end

--TODO: Move to Component itself, after settings get added properly
function FrameTextureComponentSettingsMixin:UpdateComponent()
    if self.GetElementData then
        local c = self:GetElementData().data.component
        if c then
            c.Texture:SetTexture(self.settings.frameTexture)
            local t = self.settings.frameTextureCoords
            c.Texture:SetTexCoord(t.left, t.right, t.top, t.bottom)
        end
    end
end