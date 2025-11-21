BufEvents = {}
local handler = {}

function BufEvents:OnEvent(event, ...)
    local func = handler[event]
    if func then return func(...) end
end

function handler.ADDON_LOADED(name)
    if name == BufData["addonName"] then
        BufMenu:BuildOptionsMenu()
    end
end

function handler.PLAYER_ENTERING_WORLD()
    PlayerModule.Initialize()
    PlayerModule.UpdateFrame()
end

function handler.PLAYER_SPECIALIZATION_CHANGED()
    PlayerModule.Initialize()
    PlayerModule.UpdateFrame()
end