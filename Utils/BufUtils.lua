BufUtils = {}

local measureFrame = CreateFrame("Frame")
local measureString = measureFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")

function BufUtils.GetStringSize(text,fontObj)
    measureString:SetFontObject(fontObj or "GameFontNormal")
    measureString:SetText(text)

    return measureString:GetStringWidth(), measureString:GetHeight()
end

function BufUtils.Start(frame)
    if not frame then return end
    if not frame:IsMovable() then return end

    local cursorX, cursorY = GetCursorPosition()
    local scale = frame:GetEffectiveScale()

    local frameLeft = frame:GetLeft() * scale
    local frameTop = frame:GetTop() * scale

    frame.dragOffsetX = cursorX - frameLeft
    frame.dragOffsetY = cursorY - frameTop

    frame:SetScript("OnUpdate", BufUtils.OnUpdate)
end

function BufUtils.Stop(frame)
    if not frame then return end

    frame:SetScript("OnUpdate", nil)

    frame:SetUserPlaced(true)
end

function BufUtils.OnUpdate(frame)
    local parent = frame:GetParent()
    if not parent then return end

    local scale = frame:GetEffectiveScale()
    local cursorX, cursorY = GetCursorPosition()

    local newX = (cursorX - frame.dragOffsetX) / scale
    local newY = (cursorY - frame.dragOffsetY) / scale

    local parentLeft = parent:GetLeft()
    local parentTop = parent:GetTop()
    local parentWidth = parent:GetWidth()
    local parentHeight = parent:GetHeight()
    local frameWidth = frame:GetWidth()
    local frameHeight = frame:GetHeight()

    local relX = newX - parentLeft
    local relY = newY - parentTop

    relX = math.max(0, math.min(relX, parentWidth - frameWidth))
    relY = math.min(0, math.max(relY, -(parentHeight - frameHeight)))

    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", relX, relY)
end