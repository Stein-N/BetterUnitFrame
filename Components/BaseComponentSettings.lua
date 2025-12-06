BaseComponentSettingsMixin = {}

function BaseComponentSettingsMixin:OnLoad()
    self.layout = {}
    self.settings = {}

    if not self.isBuilt then self:BuildSettings() end
end

function BaseComponentSettingsMixin:UpdateLayout()
    local yPos = 0
    for _, entry in ipairs(self.layout) do
        entry:SetPoint("TOPLEFT", self, "TOPLEFT", 30, yPos)
        entry:SetPoint("RIGHT", self, "RIGHT", -30, yPos)
        yPos = yPos - entry:GetHeight()
    end
end

function BaseComponentSettingsMixin:BuildSettings()end