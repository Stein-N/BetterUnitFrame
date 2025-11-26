PlayerUnitFramePreviewMixin = {}
PUM = PlayerUnitFramePreviewMixin

function PUM:OnShow()
    -- _G["PlayerUnitFramePreview"] = self
    -- print(self:GetChildren(1):GetNumChildren())
end

function PUM:OnHide()

end

function PUM:OnMouseWheel(delta)
    local preview = self:GetChildren(1)
    if preview then
        local scale = preview:GetScale()
        if scale < 2.1 and scale > 0.99 then
            scale = scale + (delta / 10)
        end

        if scale < 1 then preview:SetScale(1) return end
        if scale > 2 then preview:SetScale(2) return end

        preview:SetScale(scale)
    end
end