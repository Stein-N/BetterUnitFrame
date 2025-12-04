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