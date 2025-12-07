BufData = {
    addon_name = "BetterUnitFrame"
}

function CreateComponentSettings()
    return {
        Player = {
            Frame = {
                texture = "no_portrait_2_row"
            },
            HealthBar = {
                texture  = "",
                anchor = "TOPLEFT",
                parent = {},
                parentAnchor = "TOPLEFT",
                xPos = 0,
                yPos = 0
            },
            PowerBar = {
                texture  = "",
                anchor = "TOPLEFT",
                parent = {},
                parentAnchor = "TOPLEFT",
                xPos = 0,
                yPos = 0
            }
        }
    }
end