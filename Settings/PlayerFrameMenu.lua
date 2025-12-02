local test = {
    frame_texture_1 = 25,
    frame_texture_2 = 10,
    frame_texture_3 = 52,
    frame_texture_4 = 99,
}

local dropdown
local slider

function BuildPlayerFrameMenu(category, layout)

    -- Preview Window
    local initializer = Settings.CreatePanelInitializer("PlayerUnitFramePreviewTemplate", {})
    layout:AddInitializer(initializer)

    -- Module Settings
    -- Selection
    dropdown = BufSettings.CreateDropdown(category, "testBoolean1", UpdatePlayerFrameOptions, BuildPlayerFrameModuleoptions)
    slider = BufSettings.CreateSlider(category, "testSlider", 0, 100, 1, "", function(s, v)
        local dValue = dropdown:GetSetting():GetValue()
        test[dValue] = v
    end)

    SLASH_BETTERUNITFRAME1 = "/buf"
    SlashCmdList["BETTERUNITFRAME"] = function(msg)
        Settings.OpenToCategory(category:GetID())
    end
end

function UpdatePlayerFrameOptions(setting, value)
    if slider then
        slider:GetSetting():SetValue(test[value])
    else print("Slider nicht vorhanden") end
end

function BuildPlayerFrameModuleoptions()
    local c = Settings.CreateControlTextContainer()
    
    c:Add("frame_texture_1", "Frame Texture")
    c:Add("frame_texture_2", "Frame Texture 2")
    c:Add("frame_texture_3", "Frame Texture 3")
    c:Add("frame_texture_4", "Frame Texture 4")

    return c:GetData()
end