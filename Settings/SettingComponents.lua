SettingsComponents = {}

function SettingsComponents:CreateSlider(parent, label, min, max, formatter, updateFunc)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(40)

    holder.Label = holder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
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

    table.insert(parent.settings, holder)
end

function SettingsComponents:CreateCheckbox(parent, label, updateFunc)
    local holder = CreateFrame("Frame", nil, parent)
    holder:SetHeight(40)

    holder.Label = holder:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    holder.Label:SetJustifyH("LEFT")
    holder.Label:SetPoint("LEFT", 20, 0)
    holder.Label:SetPoint("RIGHT", holder, "CENTER", -50, 0)
    holder.Label:SetText(label)

    holder.Checkbox = CreateFrame("CheckButton", nil, holder, "SettingsCheckboxTemplate")
    holder.Checkbox:SetPoint("LEFT", holder, "CENTER", -15, 0)


    function holder:SetValue(value)
        holder.Checkbox:SetChecked(value)
    end

    holder:SetScript("OnEnter", function()
        holder.Checkbox:OnEnter()
    end)

    holder:SetScript("OnLeave", function()
        holder.Checkbox:OnLeave()
    end)

    holder:SetScript("OnMouseUp", function()
        holder.Checkbox:Click()
    end)

    holder.Checkbox:SetScript("OnClick", function()
        updateFunc(holder.Checkbox:GetChecked())
    end)

    table.insert(parent.settings, holder)
end

--TODO: needs changes
function SettingsComponents:CreateDropdown(parent, labelText, isSelectedCallback, onSelectionCallback)
    local frame = CreateFrame("Frame", nil, parent)
    local dropdown = CreateFrame("DropdownButton", nil, frame, "WowStyle1DropdownTemplate")
    dropdown:SetWidth(250)
    dropdown:SetPoint("LEFT", frame, "CENTER", -32, 0)

    local label = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    label:SetPoint("LEFT", 20, 0)
    label:SetPoint("RIGHT", frame, "CENTER", -50, 0)
    label:SetJustifyH("RIGHT")
    label:SetText(labelText)
    frame:SetPoint("LEFT", 30, 0)
    frame:SetPoint("RIGHT", -30, 0)

    frame.Init = function(_, entryLabels, values)
        local entries = {}
        for index = 1, #entryLabels do
            table.insert(entries, {entryLabels[index], values[index]})
        end
        
        MenuUtil.CreateRadioMenu(dropdown, isSelectedCallback, onSelectionCallback, unpack(entries))
    end

    frame.SetValue = function(_, _)
        dropdown:GenerateMenu()
    end

    frame.Label = label
    frame.DropDown = dropdown
    frame:SetHeight(40)

    return frame
end