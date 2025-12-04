PlayerMenuMixin = {}

local components = {}
local menuCategory = nil
local currentFocus = nil

function PlayerMenuMixin:SetNewFocus(element)
    if currentFocus then currentFocus:Unfocus() end
    currentFocus = element
end

function PlayerMenuMixin:CreateMenu(category, layout)
    menuCategory = category

    local f = Settings.CreatePanelInitializer("PlayerFramePreviewTemplate", {})
    layout:AddInitializer(f)

    SLASH_BETTERUNITFRAME1 = "/buf"
    SlashCmdList["BETTERUNITFRAME"] = function(msg)
        Settings.OpenToCategory(category:GetID())
    end
end

local function CreateComponent(parent, type, value)
    local f = CreateFrame("Frame", nil, parent, "PlayerFrameComponent")
    f:SetSize(100, 28)
    if value == "testSlider" then f:SetPoint("BOTTOMRIGHT", parent, "CENTER", 0, 0)
    else f:SetPoint("TOPLEFT", parent, "CENTER", 0, 0) end

    f:BuildSettings(menuCategory, value)

    table.insert(components, { frame = f, type = type})
end

-- TODO: Need better implementation
local function CreateContextMenu(owner, root)
    root:CreateTitle("Components")
    local newBtn = root:CreateButton("New")
    newBtn:CreateButton("Health Bar", function() CreateComponent(owner, "HealthBar", "testSlider") end)
    newBtn:CreateButton("Power Bar", function() CreateComponent(owner, "PowerBar", "testSlider1") end)

    local delete = root:CreateButton("Delete")

    for index, value in ipairs(components) do
        if value.frame and value.type then
            delete:CreateButton(value.type, function()
                value.frame:Unfocus()
                value.frame:Hide()
                table.remove(components, index)
                SettingsInbound.RepairDisplay()
            end)
        end
    end
end

function PlayerMenuMixin:OnMouseDown(button)
    if button == "RightButton" then
        MenuUtil.CreateContextMenu(self, CreateContextMenu)
    end
end