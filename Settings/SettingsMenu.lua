SettingsMenu = {}
SM = SettingsMenu

BufSettingsMenu = Settings.RegisterVerticalLayoutCategory(BufData.addon_name)

function SM.InitMenu()
    PlayerMenuMixin:CreateMenu(Settings.RegisterVerticalLayoutSubcategory(BufSettingsMenu, "Player Frame"))

    Settings.RegisterAddOnCategory(BufSettingsMenu)
end