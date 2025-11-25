PreviewModuleMixin = {}
PM = PreviewModuleMixin

local build = false

local f

function PM:Init(parent, name)
    if not build then
        f = CreateFrame("Frame", "BetterUnitFramePreviewModule"..name, parent, "PreviewModuleTemplate")
        local tex = f:CreateTexture(nil, "BACKGROUND")
        tex:SetTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-Atlas")
        tex:SetTexCoord(BufMedia.GetTexCoords("no_portrait_2_row"))
        tex:SetAllPoints(self)
    end
end

function PM:UpdateModule()

end

function PM:BuildSettings(category)

end

function PM:ShowSettings()

end

function PM:HideSettings()

end