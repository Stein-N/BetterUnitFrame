BaseComponentMixin = {}

function BaseComponentMixin:UpdateComponent()end

function BaseComponentMixin:SetFocus()
    if not self.isFocused then
        self.isFocused = true
        self:SetBackdropBorderColor(1, 1, 1, 1)

        SettingsMenu:SetComponentFocus(self)

        SettingsInbound.RepairDisplay()
    end
end

function BaseComponentMixin:Unfocus()
    self.isFocused = false
    self:SetBackdropBorderColor(1, 1, 1, 0)

    SettingsInbound.RepairDisplay()
end