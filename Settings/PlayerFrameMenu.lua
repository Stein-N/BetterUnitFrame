function BuildPlayerFrameMenu(category, layout)

    -- Preview Window
    local initializer = Settings.CreatePanelInitializer("PlayerUnitFramePreviewTemplate", {})
    layout:AddInitializer(initializer)

    -- Module Settings
    -- Selection
    BufSettings.CreateDropdown(category, "testBoolean1", BuildPlayerFrameModuleoptions)

end

function BuildPlayerFrameModuleoptions()
    local c = Settings.CreateControlTextContainer()
    
    c:Add("Frame Texture", "Frame Texture")

    return c:GetData()
end