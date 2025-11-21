BaseModule = {}

--- Set the texture of a StatusBar frame
---@param element StatusBar
---@param texture string
function BaseModule.SetStatusBarTexture(element, texture)
    if element and texture then
        element:SetStatusBarTexture("Interface\\AddOns\\BetterUnitFrame\\Media\\No-Portrait-" .. texture)
    end
end

--- Set the text of a StatusBarText frame
---@param frame TextStatusBarText
---@param text string
function BaseModule.SetStatusBarText(frame, text)
    if frame and text then
        frame:SetText(text)
    end
end

--- Set the color of a StatusBar frame
---@param frame StatusBar
---@param colors {r: number, g: number, b: number}
function BaseModule.SetStatusBarColor(frame, colors)
    if frame and colors then
        frame:SetStatusBarColor(colors.r, colors.g, colors.b)
    end
end

--- 
---@param element StatusBar
---@param width number
---@param height number
function BaseModule.SetStatusBarSize(element, width, height)
    if element then
        element:SetWidth(width)
        element:SetHeight(height)
    end
end

--- Set the texture of a frame with optional texture coordinates
---@param element Texture
---@param texture string
---@param coords {left: number, right: number, top: number, bottom: number}?
function BaseModule.SetElementTexture(element, texture, coords)
    if not element then return end

    element:SetTexture(texture)
    if coords then
        element:SetTexCoord(coords.left, coords.right, coords.top, coords.bottom)
    end
end

function BaseModule.HideElement(element)
    if element then element:Hide() end
end

--- Clear all points of a frame and set a new point
---@param element any
---@param anchorPoint FramePoint
---@param relativeTo ScriptRegion
---@param relativePoint FramePoint
---@param xOffset number
---@param yOffset number
function BaseModule.ClearAndSetPoint(element, anchorPoint, relativeTo, relativePoint, xOffset, yOffset)
    if element then
        element:ClearAllPoints()
        element:SetPoint(anchorPoint, relativeTo, relativePoint, xOffset, yOffset)
    end
end