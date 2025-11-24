GeneralTab = {}

local frame = CreateFrame("Frame")
local title

function GeneralTab.Add(text, parent, x, y)
    title = text or "General"
    if parent then
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
        frame:SetSize(400, 400)
    end
end

function GeneralTab.Show()
    frame:Show()
end

function GeneralTab.Hide()
    frame:Hide()
end

function GeneralTab.Build()
    local titleObj = frame:CreateFontString("GeneralTabTitle", "OVERLAY", "GameFont72Normal")
    titleObj:SetText(title)
    titleObj:SetPoint("TOPLEFT", frame, "TOPLEFT", 5, -5)
end