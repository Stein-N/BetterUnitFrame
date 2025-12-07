BaseComponentSettingsMixin = {}

function BaseComponentSettingsMixin:OnLoad()
    self.layout = {}
end

function BaseComponentSettingsMixin:OnShow()
    if self.GetElementData then
        self.component = self:GetElementData().data.component
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
function BaseComponentSettingsMixin:UpdateComponent()end

--- ============================== ---
--- ===      Frame Texture     === ---
--- ============================== ---
FrameTextureComponentSettingsMixin = CreateFromMixins(BaseComponentSettingsMixin)

function FrameTextureComponentSettingsMixin:BuildSettings()
    if self.isBuilt then return end

    local textures = Settings.CreateControlTextContainer()
    textures:Add("no_portrait_2_row_shadow", "No Portrait")
    textures:Add("no_portrait_2_row", "No Portrait - No Shadow")

    SettingsComponents:CreateDropdown(self, "Texture", textures:GetData(), BufComponents.Player.Frame, "texture")

    self:UpdateLayout()
    self.isBuilt = true
end

function FrameTextureComponentSettingsMixin:UpdateComponent()
    if self.component then self.component:UpdateComponent() end
end