BaseComponentMixin = {}

function BaseComponentMixin:BuildSettings(category)end
function BaseComponentMixin:UpdateComponent()end

function BaseComponentMixin:OnLoad()
    self.isBuilt = false
    self.isFocused = false
    self.componentType = nil
end

function BaseComponentMixin:SetFocus()
    self.IsFocused = true
end

function BaseComponentMixin:Unfocus()
    self.IsFocused = false
end