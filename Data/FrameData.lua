local playerContext = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual
local playerContainer = PlayerFrame.PlayerFrameContainer
local playerHealth = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer
local playerMana = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea

PlayerContext = {
    attack_icon = playerContext.AttackIcon,
    group_indicator = playerContext.GroupIndicator,
    guide_icon = playerContext.GuideIcon,
    leader_icon = playerContext.LeaderIcon,
    pvp_icon = playerContext.PVPIcon,
    play_time = playerContext.PlayerPlayTime,
    portrait_corner_icon = playerContext.PlayerPortraitCornerIcon,
    rest_loop = playerContext.PlayerRestLoop,
    prestige_portrait = playerContext.PrestigePortrait,
    pvp_timer_text = playerContext.PvpTimerText,
    ready_check = playerContext.ReadyCheck,
    role_icon = playerContext.RoleIcon
}

PlayerBars = {
    health_bar = playerHealth.HealthBar,
    health_bar_mask = playerHealth.HealthBarMask,
    health_bar_text = playerHealth.HealthBarText,
    health_left_text = playerHealth.LeftText,
    health_animated_loss = playerHealth.PlayerFrameHealthBarAnimatedLoss,
    health_temp_max_loss = playerHealth.PlayerFrameTempMaxHealthLoss,
    health_right_text = playerHealth.RightText,
    health_temp_max_loss_divider = playerHealth.TempMaxHealthLossDivider,

    mana_bar = playerMana.ManaBar,
    mana_bar_mask = playerMana.ManaBar.ManaBarMask,
    mana_bar_text = playerMana.ManaBar.ManaBarText,
    mana_left_text = playerMana.ManaBar.LeftText,
    mana_right_text = playerMana.ManaBar.RightText
}

PlayerContainer = {
    portrait = playerContainer.PlayerPortrait,
    portrait_mask = playerContainer.PlayerPortraitMask,
    frame_flash = playerContainer.FrameFlash,
    frame_texture = playerContainer.FrameTexture, -- Border Texture for Health/Mana bar
    vehicle = playerContainer.VehicleFrameTexture,
    alternative_power_bar = playerContainer.AlternatePowerFrameTexture,
    status_texture = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.StatusTexture,
    player_name = PlayerName,
    player_level = PlayerLevelText
}

ResourceFrames = {
    WARLOCK = WarlockPowerFrame,
    ROGUE = RogueComboPointBarFrame,
    DRUID = DruidComboPointBarFrame,
    PALADIN = PaladinPowerBarFrame,
    DEATHKNIGHT = RuneFrame,
    EVOKER = EssencePlayerFrame,
    MAGE = MageArcaneChargesFrame,
    MONK = MonkHarmonyBarFrame,
    DEMONHUNTER = DemonHunterSoulFragmentsBar
}