BufMedia = {
    atlas = "Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Atlas",
    no_portrait_3_row_shadow = {
        left = 0,
        right = 0.390625,
        top = 0,
        bottom = 0.138671875
    },
    no_portrait_3_row_vehicle = {
        left = 0,
        right = 0.390625,
        top = 0.140625,
        bottom = 0.27734375,
    },
    no_portrait_3_row = {
        left = 0.392578125,
        right = 0.78125,
        top = 0,
        bottom = 0.1328125
    },
    no_portrait_2_row_shadow = {
        left = 0.392578125,
        right = 0.78125,
        top = 0.140625,
        bottom = 0.27734375
    },
    no_portrait_2_row_vehicle = {
        left = 0.392578125,
        right = 0.78125,
        top = 0.279296875,
        bottom = 0.416015625
    },
    no_portrait_2_row = {
        left = 0,
        right = 0.390625,
        top = 0.279296875,
        bottom = 0.416015625
    },
    no_portrait_status = {
        left = 0.392578125,
        right = 0.78125,
        top = 0.41796875,
        bottom = 0.5546875
    },
    no_portrait_status_shadow = {
        left = 0,
        right = 0.390625,
        top = 0.41796875,
        bottom = 0.5546875
    }
}

function BufMedia.GetTexCoords(name)
    return BufMedia[name]
end