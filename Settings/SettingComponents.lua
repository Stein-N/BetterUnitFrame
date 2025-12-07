SettingsComponents = {}

local function CreateBaseFrame(parent)
    local f = CreateFrame("Frame", nil, parent)
    f:SetHeight(36)

    f.Label = f:CreateFontString("Label", "OVERLAY", "GameFontNormal")
    f.Label:SetJustifyH("LEFT")
    f.Label:SetPoint("LEFT", 20, 0)
    f.Label:SetPoint("RIGHT", f, "CENTER", -50, 0)

    f.HoverBackground = f:CreateTexture("HoverBackground", "BACKGROUND")
    f.HoverBackground:SetPoint("TOPLEFT", f, "TOPLEFT", -10, 0)
    f.HoverBackground:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -5, 0)
    f.HoverBackground:SetColorTexture(1, 1, 1, 0.1)
    f.HoverBackground:Hide()

    function f:SetLabel(label)
        self.Label:SetText(label)
    end

    function f:OnEnter()
        self.HoverBackground:Show()
    end

    function f:OnLeave()
        self.HoverBackground:Hide()
    end

    f:SetScript("OnEnter", f.OnEnter)
    f:SetScript("OnLeave", f.OnLeave)

    return f
end

function SettingsComponents:CreateSlider(parent, label, min, max, step, suffix, updateFunc)
    local f = CreateBaseFrame(parent)
    f:SetLabel(label)

    f.Slider = CreateFrame("Slider", nil, f, "MinimalSliderWithSteppersTemplate")
    f.Slider:SetPoint("LEFT", f, "CENTER", -53, 0)
    f.Slider:SetWidth(260)

    f.Slider.Slider:SetScript("OnEnter", function() f:OnEnter() end)
    f.Slider.Slider:SetScript("OnLeave", function() f:OnLeave() end)

    f.Slider:Init(max, min, max, (max - min) / step, {
        [MinimalSliderWithSteppersMixin.Label.Right] = CreateMinimalSliderFormatter(MinimalSliderWithSteppersMixin.Label.Right,
            function(v) return v .. (suffix or "") end)
    })

    f.Slider:RegisterCallback(MinimalSliderWithSteppersMixin.Event.OnValueChanged, function(_, v) updateFunc(v) end)

    table.insert(parent.layout, f)
end

function SettingsComponents:CreateCheckbox(parent, label, updateFunc)
    local f = CreateBaseFrame(parent)
    f:SetLabel(label)

    f.Checkbox = CreateFrame("CheckButton", nil, f, "SettingsCheckboxTemplate")
    f.Checkbox:SetPoint("LEFT", f, "CENTER", -53, 0)

    f.Checkbox:SetScript("OnClick", function() updateFunc(f.Checkbox:GetChecked()) end)


    table.insert(parent.layout, f)
end

function SettingsComponents:CreateDropdown(parent, label, items, onSelect)
    local f = CreateBaseFrame(parent)
    f:SetLabel(label)

    f.Dropdown = CreateFrame("DropdownButton", nil, f, "WowStyle1DropdownTemplate")
    f.Dropdown:SetPoint("LEFT", f, "CENTER", -50, 0)
    f.Dropdown:SetWidth(250)

    f.Dropdown:SetScript("OnEnter", function() f:OnEnter() end)
    f.Dropdown:SetScript("OnLeave", function() f:OnLeave() end)

    local value = nil
    f.Dropdown:SetupMenu(function(owner, root)
        for _, item in ipairs(items) do
            local function IsSelected()
                return value == item.value
            end

            local function SetSelected()
                value = item.value
                if onSelect then
                    onSelect(value)
                    parent:UpdateComponent()
                end
            end

            root:CreateRadio(item.label, IsSelected, SetSelected)
        end
    end)

    table.insert(parent.layout, f)
end