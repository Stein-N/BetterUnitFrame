PlayerUnitFramePreviewMixin = {}
PUM = PlayerUnitFramePreviewMixin

function PUM:OnShow()
    
end

function PUM:OnHide()

end

function PUM:OnMouseWheel(delta)
    local children = { self:GetChildren() }
    for _, child in ipairs(children) do
        if child then
            local scale = child:GetScale()
            if scale < 2.1 and scale > 0.99 then
                scale = scale + (delta / 10)
            end

            if scale < 1 then child:SetScale(1) return end
            if scale > 2 then child:SetScale(2) return end

            child:SetScale(scale)
        end
    end
end