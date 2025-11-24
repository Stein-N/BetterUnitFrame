GeneralTab = {}

local title = "General"
local frame = CreateFrame("Frame", "BetterUnitFrame"..title, nil, "InsetFrameTemplate3")

function GeneralTab.BuildTab(parent)
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 8, -40)
    frame:SetSize(305, 255)
    frame:Show()
end

function GeneralTab.GetTitle()
    return title;
end

function GeneralTab.IsVisible()
    return frame:IsVisible()
end

function GeneralTab.Show()
    frame:Show()
end

function GeneralTab.Hide()
    frame:Hide()
end
