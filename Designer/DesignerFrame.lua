DesignerFrame = {}

local tabs = { [1] = GeneralTab}
local frame = CreateFrame("Frame", "BetterUnitFrameDesigner", UIParent, "DefaultPanelTemplate")
local cBtn = DesignerBase.CreateButton("Close", frame, -3, 4, "BOTTOMRIGHT", "BOTTOMRIGHT")
DesignerBase.SetElementScript(cBtn, "OnClick", function(self) frame:Hide() end)

frame:SetTitle("Better Unit Frame")
frame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
frame:SetSize(500, 500)
frame:SetFrameStrata("LOW")
frame:SetFrameLevel(100)

DesignerBase.SetElementMovable(frame, true, "LeftButton")
DesignerBase.SetElementMoveArea(frame, 0, 0, frame:GetWidth(), -30)

function DesignerFrame.AddTab(tab)
    if tab then
        for _, obj in ipairs(tabs) do
            if obj == tab then return end
        end

        table.insert(tabs, tab)
    end
end

function DesignerFrame.BuildTabs()
    local x = 10
    for _, tab in ipairs(tabs) do
        local btn = DesignerBase.CreateButton(tab.GetTitle(), frame, x, -25, "TOPLEFT", "TOPLEFT")
        DesignerBase.SetElementScript(btn, "OnClick",
        function(self)
            print(tab.GetTitle() .. " clicked")
            if tab.IsVisible() then
                tab.Hide()
            else tab.Show() end
        end)

        tab.BuildTab(frame)

        x = x + btn:GetWidth() + 4
    end
end

function DesignerFrame.HideAllTabs()
    for _, value in ipairs(tabs) do
        value.Hide()
    end
end

function DesignerFrame.Show()
    DesignerFrame.BuildTabs()

    frame:Show()
end

DesignerFrame.Show()