BaseComponentSettingsMixin = {}

function BaseComponentSettingsMixin:OnLoad()
    self.layout = {}
    self.settings = {}

    if not self.isBuilt then
        self:LoadComponentSettings()
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
function BaseComponentSettingsMixin:LoadComponentSettings()end
function BaseComponentSettingsMixin:UpdateComponent()end