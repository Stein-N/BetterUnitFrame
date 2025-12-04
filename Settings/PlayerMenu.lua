PlayerMenuMixin = {}

local availableComponents = {}

function PlayerMenuMixin:CreateMenu(category, layout)
    local f = Settings.CreatePanelInitializer("PlayerFramePreviewTemplate", {})
    layout:AddInitializer(f)
end

local function CreateComponent(parent, type)
    local f = CreateFrame("Button", nil, parent, "GameMenuButtonTemplate")
    f:SetSize(100, 28)
    f:SetPoint("CENTER")

    table.insert(availableComponents, { frame = f, type = type})
end

local function CreateContextMenu(owner, root)
    root:CreateTitle("Components")
    local newBtn = root:CreateButton("New")
    newBtn:CreateButton("Health Bar", function() CreateComponent(owner, "HealthBar") end)
    newBtn:CreateButton("Power Bar", function() CreateComponent(owner, "PowerBar") end)

    local available = root:CreateButton("Available")
    for index, value in ipairs(availableComponents) do
        if value.frame and value.type then
            available:CreateButton(value.type, function()
                value.frame:Hide()
                table.remove(availableComponents, index)
            end)
        end
    end

    local delete = root:CreateButton("Delete")

    for index, value in ipairs(availableComponents) do
        if value.frame and value.type then
            delete:CreateButton(value.type, function()
                value.frame:Hide()
                table.remove(availableComponents, index)
            end)
        end
    end
end

function PlayerMenuMixin:OnMouseDown(button)
    if button == "RightButton" then
        MenuUtil.CreateContextMenu(self, CreateContextMenu)
    end
end