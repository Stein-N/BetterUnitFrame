BufEvents = {}
local handler = {}

function BufEvents:OnEvent(event, ...)
    local func = handler[event]
    if func then return func(...) end
end

function handler.ADDON_LOADED(name)
    if name == BufData.addon_name then
        print(BufData.addon_name .. " loaded")
        SettingsMenu.InitMenu()
    end
end

function handler.PLAYER_ENTERING_WORLD()
    print("Player entered world")
end

function handler.PLAYER_SPECIALIZATION_CHANGED()
    print("Player changed Spec")
end