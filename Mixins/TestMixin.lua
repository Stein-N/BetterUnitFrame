TestMixin = {}

local test = CreateFrame("Frame", "TestButtonInsideFrame", nil, "BackdropTemplate")
test:SetSize(200, 71)
local background = test:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(test)


function TestMixin:OnShow()
    background:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Atlas")
    background:SetTexCoord(TestMixin.GetCoords(BufMedia.no_portrait_3_row_shadow))
    test.Background = background

    test:SetParent(self)
    test:SetPoint("CENTER", self, "CENTER", 0, 0)
    
    test:EnableMouse(true)
    test:SetScript("OnMouseDown", function(s) self:Hide() end)
end

function TestMixin:OnHide()
    
end

function TestMixin.GetCoords(t)
    return t.left, t.right, t.top, t.bottom
end