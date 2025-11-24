BufUtils = {}

local measureFrame = CreateFrame("Frame")
local measureString = measureFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")

function BufUtils.GetStringSize(text,fontObj)
    measureString:SetFontObject(fontObj or "GameFontNormal")
    measureString:SetText(text)

    return measureString:GetStringWidth(), measureString:GetHeight()
end