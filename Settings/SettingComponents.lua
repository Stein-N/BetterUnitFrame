SettingsComponents = {}

function SettingsComponents:CreateSlider(parent, label, min, max, formatter, updateFunc)
  local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(40)
    holder:SetPoint("TOPLEFT", parent, "TOPLEFT", 30, 0)
    holder:SetPoint("RIGHT", parent, "RIGHT", -30, 0)

    holder.Label = holder:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    holder.Label:SetJustifyH("LEFT")
    holder.Label:SetPoint("LEFT", 20, 0)
    holder.Label:SetPoint("RIGHT", holder, "CENTER", -50, 0)
    holder.Label:SetText(label)

    holder.Slider = CreateFrame("Slider", nil, holder, "MinimalSliderWithSteppersTemplate")
    holder.Slider:SetPoint("LEFT", holder, "CENTER", -32, 0)
    holder.Slider:SetPoint("RIGHT", -45, 0)
    holder.Slider:SetHeight(20)
    holder.Slider:Init(max, min, max, max - min, {
        [MinimalSliderWithSteppersMixin.Label.Right]  = CreateMinimalSliderFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return WHITE_FONT_COLOR:WrapTextInColorCode(formatter(value))
        end)
    })

    holder.Slider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(_, value)
        updateFunc(value)
    end)

    function holder:GetValue()
        return holder.Slider.Slider:GetValue()
    end

    function holder:SetValue(value)
        return holder.Slider:SetValue(value)
    end

    holder:SetScript("OnMouseWheel", function(_, delta)
        if holder.Slider.Slider:IsEnabled() then
        holder.Slider:SetValue(holder.Slider.Slider:GetValue() + delta)
        end
    end)

  return holder
end