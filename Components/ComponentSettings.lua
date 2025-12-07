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
    end
end

function BaseComponentSettingsMixin:UpdateComponent()
    if self.component then self.component:UpdateComponent() end
end

function BaseComponentSettingsMixin:BuildSettings()end

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

--- ============================== ---
--- ===        HealthBar       === ---
--- ============================== ---
HealthbarComponentSettingsMixin = CreateFromMixins(BaseComponentSettingsMixin)

function HealthbarComponentSettingsMixin:BuildSettings()
    if self.isBuilt then return end

    local options = BufComponents.Player.HealthBar
    local anchors = SettingsComponents:CreateAnchorDropdown()
    local textures = Settings.CreateControlTextContainer()
    textures:Add("health_bar_normal", "Healthbar")
    textures:Add("health_bar_white", "Healthbar White")

    SettingsComponents:CreateDropdown(self, "Texture", textures:GetData(), options, "texture")
    SettingsComponents:CreateDropdown(self, "Anchor", anchors:GetData(), options, "anchor")
    -- SettingsComponents:CreateDropdown(self, "Relative to", anchors:GetData(), "parent")
    SettingsComponents:CreateDropdown(self, "Realative Anchor", anchors:GetData(), options, "parentAnchor")
    SettingsComponents:CreateSlider(self, "X Position", -50, 50, 1, "px", options, "xPos")
    SettingsComponents:CreateSlider(self, "Y Position", -50, 50, 1, "px", options, "yPos")

    self:UpdateLayout()
    self.isBuilt = true
end