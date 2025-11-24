DesignerBase = {}

function DesignerBase.CreateBackdropFrame(name, parent, width, height, x, y)
    local f = CreateFrame("Frame", "BetterUnitFrame" .. name, nil, "InsetFrameTemplate")
    DesignerBase.SetElementPosition(f, "TOPLEFT", parent, "TOPLEFT", x, y)
    DesignerBase.SetElementSize(f, width, height)

    return f
end

function DesignerBase.CreateButton(title, parent, x, y, anchor, pAnchor)
    local b = CreateFrame("Button", "BetterUnitFrame"..title, parent, "GameMenuButtonTemplate")
    local w, h = BufUtils.GetStringSize(title)
    b:SetText(title)
    b:SetScale(1.15)
    DesignerBase.SetElementPosition(b, anchor, parent, pAnchor, x, y)
    DesignerBase.SetElementSize(b, w + 20, h + 15)

    return b
end

function DesignerBase.SetElementSize(element, width, height)
    if element then
        element:SetWidth(width or 500, height or 500)
    end
end

function DesignerBase.SetElementStrata(element, strata, level)
    if element then
        element:SetFrameStrata(strata)
        element:SetFrameLevel(level)
    end
end

function DesignerBase.SetElementScale(element, scale)
    if element then
        element:SetScale(scale or 1)
    end
end

function DesignerBase.SetElementPosition(element, eAnchor, parent, pAnchor, x, y)
    if element then
        element:ClearAllPoints()
        element:SetPoint(eAnchor, parent, pAnchor, x or 0, y or 0)
    end
end

function DesignerBase.SetElementScript(element, script, func)
    if element then
        element:SetScript(script, func)
    end
end

function DesignerBase.SetElementMovable(element, clamped, button)
    if element then
        element:SetMovable(true)
        element:SetClampedToScreen(clamped)
        element:EnableMouse(true)
        element:RegisterForDrag(button or "LeftButton")
    end
end

function DesignerBase.SetElementMoveArea(element, x, y, width, height)
    if element then
        element:HookScript("OnDragStart", function(self)
            local cX, cY = GetCursorPosition()
            local scale = self:GetEffectiveScale()

            cX = (cX / scale) - self:GetLeft()
            cY = (cY / scale) - self:GetTop()

            if cX >= x - 5 and cX <= width + 5 and cY <= y + 5 and cY >= height - 5 then
                self:StartMoving()
            end
        end)

        element:HookScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
        end)
    end
end

function DesignerBase.SetElementMoveTrigger(element, button, triggerElement)
    local trigger
    if triggerElement then trigger = triggerElement
    else trigger = element end

    if trigger then
        if not trigger:IsMouseEnabled() then
            trigger:EnableMouse(true)
        end

        trigger:RegisterForDrag(button or "LeftButton")

        trigger:HookScript("OnDragStart", function(self) element:StartMoving() end)
        trigger:HookScript("OnDragStop", function(self) element:StopMovingOrSizing() end)
    end
end