BufEvents = {}
local handler = {}

function BufEvents:OnEvent(event, ...)
    local func = handler[event]
    if func then return func(...) end
end

function handler.ADDON_LOADED(name)
    if name == AddOnData["addonName"] then
        OptionsMenu:BuildOptionsMenu()
    end
end

function handler.PLAYER_ENTERING_WORLD()
    local context = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
    local icons = {
        [0] = context.AttackIcon,
        [1] = context.GroupIndicator,
        [2] = context.GuideIcon,
        [3] = context.LeaderIcon,
        [4] = context.PVPIcon,
        [5] = context.PlayerPlayTime,
        [6] = context.PlayerPortraitCornerIcon,
        [7] = context.PlayerRestLoop,
        [8] = context.PrestigePortrait,
        [9] = context.PvpTimerText,
        [10] = context.ReadyCheck,
        [11] = context.RoleIcon
    }

    local iconX = 0
    for _, icon in ipairs(icons) do
        if icon then
            icon:ClearAllPoints()
            icon:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", iconX, 50)

            iconX = iconX + icon:GetWidth() + 2
            icon:Show()
        end
    end

    local healthContainer = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer
    local healthContents = {
        [1] = healthContainer.HealthBar,
        [2] = healthContainer.HealthBarMask,
        [3] = healthContainer.HealthBarText,
        [4] = healthContainer.LeftText,
        [5] = healthContainer.PlayerFrameHealthBarAnimatedLoss,
        [6] = healthContainer.PlayerFrameTempMaxHealthLoss,
        [7] = healthContainer.RightText,
        [8] = healthContainer.TempMaxHealthLossDivider
    }

    local manaContainer = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea
    local manaContents = {
        [1] = manaContainer.ManaBar
    }

    local _, class = UnitClass("player")
    local color = RAID_CLASS_COLORS[class]
    healthContainer.HealthBar:SetColorFill(color.r, color.g, color.b)
end