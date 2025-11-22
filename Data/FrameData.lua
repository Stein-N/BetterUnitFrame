local context = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
local content = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain
local container = PlayerFrame.PlayerFrameContainer
local health = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer
local mana = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea

PlayerFrameText = {
    health_bar_text = health.HealthBarText,
    mana_bar_text = mana.ManaBar.ManaBarText,
    player_name = PlayerName,
    player_level = PlayerLevelText
}

PlayerFrameIcons = {
    attack_icon = context.AttackIcon,
    group_indicator = context.GroupIndicator,
    guide_icon = context.GuideIcon,
    leader_icon = context.LeaderIcon,
    pvp_icon = context.PVPIcon,
    pvp_timer = context.PvpTimerText,
    play_time = context.PlayerPlayTime,
    portrait_corner_icon = context.PlayerPortraitCornerIcon,
    rest_loop = context.PlayerRestLoop,
    prestige_portrait = context.PrestigePortrait,
    ready_check = context.ReadyCheck,
    role_icon = context.RoleIcon
}

PlayerFrameTextures = {
    frame_texture = container.FrameTexture,
    frame_flash = container.FrameFlash,
    status_texture = content.StatusTexture,
    vehicle_texture = container.VehicleFrameTexture,
    portrait_texture = container.PlayerPortrait,
    portrait_mask = container.PlayerPortraitMask
}

PlayerFrameBars = {
    health_bar = health.HealthBar,
    health_bar_mask = health.HealthBarMask,
    mana_bar = mana.ManaBar,
    mana_bar_mask = mana.ManaBar.ManaBarMask
}