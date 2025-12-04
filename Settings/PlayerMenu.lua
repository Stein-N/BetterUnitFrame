PlayerMenuMixin = {}

function PlayerMenuMixin:OnLoad()
    print(self.isBuilt)
    print(self.focused)
end

function PlayerMenuMixin:CreateMenu(category, layout)
    local f = Settings.CreatePanelInitializer("FramePreviewTemplate", {})
    layout:AddInitializer(f)
end