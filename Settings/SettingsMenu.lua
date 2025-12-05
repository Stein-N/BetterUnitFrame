SettingsMenu = {}

BufSettingsMenu = Settings.RegisterVerticalLayoutCategory(BufData.addon_name)
FocusedComponent = nil

function SettingsMenu:SetComponentFocus(element)
    if FocusedComponent then
        FocusedComponent:Unfocus()
    end
    FocusedComponent = element
end

function SettingsMenu.InitMenu()
    PlayerMenu:Build(Settings.RegisterVerticalLayoutSubcategory(BufSettingsMenu, "Player Frame"))

    Settings.RegisterAddOnCategory(BufSettingsMenu)
end