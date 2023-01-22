local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local1 = {
	File = "cp/cp_wall_buy_models.csv",
	indexColumn = 0,
	sharedLoadoutWeaponColumn = 2,
	zombieWeaponModel = 3,
	overrideWeapon = 4,
	overrideMPWeapon = 5,
	MaxEntries = 40,
	numAttachmentSlot = 6,
	variantFile = 6,
	variantModelColumn = 20
}
LUI.FlowManager.RegisterFenceGroup( "CPMainMenu", {
	"cp",
	"onlineServices",
	"onlineData",
	"patch",
	"exchange",
	"playlists",
	"dailyReward",
	"contracts"
} )
LUI.FlowManager.RequestSetStack( "CPMainMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
} )
f0_local2 = function ()
	local f1_local0 = Engine.SplitscreenPlayerCount()
	Engine.StopMusic()
	if f1_local0 > 0 then
		local f1_local1 = Engine.GetFirstActiveController()
		if f1_local1 and Engine.IsUserSignedIn( f1_local1 ) then
			Engine.PLMRefreshData()
		end
	end
end

local f0_local3 = function ( f2_arg0 )
	for f2_local0 = 0, f0_local1.MaxEntries - 1, 1 do
		local f2_local3 = Engine.TableLookup( f0_local1.File, f0_local1.indexColumn, "" .. f2_local0, f0_local1.sharedLoadoutWeaponColumn )
		local f2_local4 = Engine.TableLookup( f0_local1.File, f0_local1.indexColumn, "" .. f2_local0, f0_local1.variantFile )
		local f2_local5 = -1
		if f2_local4 ~= "" and f2_local4 ~= "none" and f2_local4 ~= nil then
			f2_local5 = Engine.GetPlayerDataEx( f2_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f2_local3, "variantID" )
			if f2_local5 > -1 then
				local f2_local6 = CSV.ReadRow( {
					file = f2_local4,
					cols = CSV.weaponLoot.cols
				}, f2_local5 )
				if not Cac.IsLootWeaponOwned( f2_local6.ref, f2_arg0 ) then
					Engine.SetPlayerDataEx( f2_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "zombiePlayerWeaponModels", f2_local3, "variantID", -1 )
				end
			end
		end
	end
end

local f0_local4 = function ()
	clearMatchData()
end

local f0_local5 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = Engine.HasActiveLocalClient( f4_arg1.controller )
	if f4_local0 then
		f4_local0 = not Engine.IsActiveLocalClientPrimary( f4_arg1.controller )
	end
	if f4_local0 then
		return 
	elseif Lobby.IsNotAloneInPrivateParty() then
		if Engine.IsXB3() then
			LUI.FlowManager.RequestPopupMenu( f4_arg0, "RateLimitedLeaveCommonMPMainMenuPopup", true, f4_arg1.controller, false, {
				menu = f4_arg0,
				rateLimitIntervalMS = 5000,
				rateLimitAttempts = 3
			} )
		else
			LUI.FlowManager.RequestPopupMenu( f4_arg0, "LeaveCommonMPMainMenuPopup", true, f4_arg1.controller, false, {
				menu = f4_arg0
			} )
		end
	else
		Lobby.LeaveCommonMPMainMenu( f4_arg0, f4_arg1.controller )
	end
	return true
end

local f0_local6 = function ( f5_arg0, f5_arg1, f5_arg2 )
	Engine.SetFrontEndSceneSection( "zm_main", 1 )
	f5_arg0.isSignInMenu = true
	ClientCharacter.SetCharacterModels( 0, "zombie_urban_male", "zom_civ_urban_male_torso_slice", "zombies_head_cau_dlc_a", "zom_civ_urban_male_l_arm_slice", "zom_civ_urban_male_r_arm_slice" )
	ClientCharacter.SetCharacterWeapons( 0, "" )
	ClientCharacter.PlayCharacterAnim( 0, "zom_core_idle_1" )
	ClientWeapon.SetWeaponVisible( 0, false )
	ClientCharacter.SetCharacterVisible( 0, true )
	Engine.SetDvarBool( "onlinegame", true )
	Engine.SetDvarInt( "lui_matchSummaryAvailable", 0 )
	if Engine.GetDvarBool( "xblive_competitionmatch" ) then
		Engine.SetDvarBool( "xblive_competitionmatch", false )
		Engine.Exec( "set remove_mlg_rules 1" )
	end
	Engine.ExecNow( CPConfig.default_xboxlive, f5_arg1 )
	if not Lobby.IsInPrivateParty() then
		Engine.ExecNow( "xstartprivateparty", f5_arg1 )
	end
	Lobby.WakePrivateParty( f5_arg1 )
	Engine.SetDvarInt( "party_maxplayers", 4 )
	utils.cp.AliensUtils.SetEnableChaosMode( false )
	Loot.ClearConsumable( f5_arg1 )
	Engine.ExecNow( "uploadstats", f5_arg1 )
	if Engine.GetDvarBool( "enable_unlock_sync" ) then
		local f5_local0 = {}
		for f5_local4, f5_local5 in pairs( AAR.UnlockTypes ) do
			table.insert( f5_local0, f5_local5 )
		end
		Rewards.SyncUnlocks( f5_arg1, f5_local0, #f5_local0 )
	end
	if Lobby.GetNATType then
		local f5_local0 = Lobby.GetNATType()
		if f5_local0 then
			if f5_local0 == "NETWORK_STRICT" and Engine.GetDvarBool( "strict_nat_warning_viewed" ) == false then
				LUI.FlowManager.RequestPopupMenu( f5_arg0, "strict_nat_warning", true, f5_arg1, false, data )
				Engine.SetDvarBool( "strict_nat_warning_viewed", true )
			end
			f5_arg0:processEvent( {
				name = "add_button_helper_text",
				button_ref = "nat",
				helper_text = Engine.Localize( "NETWORK_YOURNATTYPE", f5_local0 ),
				side = "right",
				clickable = false
			} )
		end
	end
	f5_arg0.bindButton:addEventHandler( "button_secondary", f0_local5 )
	f5_arg0.nextLocation = CRM.locations.CP_MOTD
	CRM.OpenNextCRMWindow( f5_arg0 )
	f5_arg0:addEventHandler( "gain_focus", CRM.OpenNextCRMWindow )
	f5_arg0:addEventHandler( "restore_focus", CRM.OpenNextCRMWindow )
	Lobby.SetPartyUIRoot( PartyUIRoot.MAIN_MENU )
	Engine.StopMenuVideo()
	local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
	if CONDITIONS.IsTrialLicense() and not f5_local0.trialPopupShown then
		f5_local0.trialPopupShown = true
		LUI.FlowManager.RequestPopupMenu( f5_arg0, "TrialFullWindow", true, f5_arg1, false )
	end
	SURVEY.OpenPostGameSurveyIfRequired( f5_arg1, true )
	f0_local3( f5_arg1 )
	local f5_local1 = f5_arg0:Wait( 6000 )
	f5_local1.onComplete = function ()
		ZombiesUtils.SetFrontendMusic()
	end
	
end

function CPMainMenu( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "CPMainMenu"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	self.soundSet = "cpMainMenuDefault"
	self:playSound( "menu_open" )
	local f7_local2 = self
	self:setUseStencil( true )
	local OuterMaskBottom = nil
	
	OuterMaskBottom = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f7_local1
	} )
	OuterMaskBottom.id = "OuterMaskBottom"
	OuterMaskBottom:SetAlpha( 0.6, 0 )
	OuterMaskBottom:SetZRotation( -168, 0 )
	OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -205, _1080p * 215 )
	self:addElement( OuterMaskBottom )
	self.OuterMaskBottom = OuterMaskBottom
	
	local OuterMaskTop = nil
	
	OuterMaskTop = MenuBuilder.BuildRegisteredType( "CPMenuOuterMask", {
		controllerIndex = f7_local1
	} )
	OuterMaskTop.id = "OuterMaskTop"
	OuterMaskTop:SetAlpha( 0.6, 0 )
	OuterMaskTop:SetZRotation( -168, 0 )
	OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -320, _1080p * 100 )
	self:addElement( OuterMaskTop )
	self.OuterMaskTop = OuterMaskTop
	
	local BloodSplat = nil
	
	BloodSplat = LUI.UIImage.new()
	BloodSplat.id = "BloodSplat"
	BloodSplat:SetAlpha( 0.5, 0 )
	BloodSplat:setImage( RegisterMaterial( "cp_menu_zombies_blood_splats_large" ), 0 )
	BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 718, _1080p * -71, _1080p * 441 )
	self:addElement( BloodSplat )
	self.BloodSplat = BloodSplat
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f7_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f7_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local CPMainMenuButtons = nil
	
	CPMainMenuButtons = MenuBuilder.BuildRegisteredType( "CPMainMenuButtons", {
		controllerIndex = f7_local1
	} )
	CPMainMenuButtons.id = "CPMainMenuButtons"
	CPMainMenuButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 345, _1080p * 745 )
	self:addElement( CPMainMenuButtons )
	self.CPMainMenuButtons = CPMainMenuButtons
	
	local FriendsElement = nil
	
	FriendsElement = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
		controllerIndex = f7_local1
	} )
	FriendsElement.id = "FriendsElement"
	FriendsElement:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	FriendsElement:SetAlignment( LUI.Alignment.Left )
	FriendsElement:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -500, 0, _1080p * -45, 0 )
	self:addElement( FriendsElement )
	self.FriendsElement = FriendsElement
	
	local LobbyMembers = nil
	
	LobbyMembers = MenuBuilder.BuildRegisteredType( "LobbyMembers", {
		controllerIndex = f7_local1
	} )
	LobbyMembers.id = "LobbyMembers"
	LobbyMembers:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -676, _1080p * -96, _1080p * 175, _1080p * 850 )
	self:addElement( LobbyMembers )
	self.LobbyMembers = LobbyMembers
	
	local ZombiesLogo = nil
	
	ZombiesLogo = LUI.UIImage.new()
	ZombiesLogo.id = "ZombiesLogo"
	ZombiesLogo:SetScale( -0.1, 0 )
	ZombiesLogo:setImage( RegisterMaterial( "cp_menu_zombies_logo" ), 0 )
	ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58, _1080p * 738, _1080p * 7, _1080p * 407 )
	self:addElement( ZombiesLogo )
	self.ZombiesLogo = ZombiesLogo
	
	local DoubleXPNotifications = nil
	
	DoubleXPNotifications = MenuBuilder.BuildRegisteredType( "DoubleXPNotifications", {
		controllerIndex = f7_local1
	} )
	DoubleXPNotifications.id = "DoubleXPNotifications"
	DoubleXPNotifications:SetScale( -0.5, 0 )
	DoubleXPNotifications:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1276, _1080p * 1791, _1080p * 58, _1080p * 186 )
	self:addElement( DoubleXPNotifications )
	self.DoubleXPNotifications = DoubleXPNotifications
	
	local f7_local13 = nil
	if not CONDITIONS.IsSystemLink( self ) then
		f7_local13 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f7_local1
		} )
		f7_local13.id = "CRMMain"
		f7_local13:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 136, _1080p * 447, _1080p * 745, _1080p * 939 )
		self:addElement( f7_local13 )
		self.CRMMain = f7_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		OuterMaskBottom:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end
			}
		} )
		BloodSplat:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BloodSplat:SetAlpha( 0, 0 )
				end
			}
		} )
		CPMainMenuButtons:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.CPMainMenuButtons:SetAlpha( 0, 0 )
				end
			}
		} )
		ZombiesLogo:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.ZombiesLogo:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			OuterMaskBottom:AnimateSequence( "DefaultSequence" )
			OuterMaskTop:AnimateSequence( "DefaultSequence" )
			BloodSplat:AnimateSequence( "DefaultSequence" )
			CPMainMenuButtons:AnimateSequence( "DefaultSequence" )
			ZombiesLogo:AnimateSequence( "DefaultSequence" )
		end
		
		OuterMaskBottom:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.OuterMaskBottom:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterMaskBottom:SetAlpha( 0.6, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * 225, _1080p * 645, 0 )
				end,
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * 225, _1080p * 645, 500, LUI.EASING.outBack )
				end,
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -205, _1080p * 215, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -205, _1080p * 215, 139 )
				end,
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -245, _1080p * 175, 9 )
				end,
				function ()
					return self.OuterMaskBottom:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * -83, _1080p * 183, _1080p * -205, _1080p * 215, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		OuterMaskTop:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.OuterMaskTop:SetAlpha( 0, 0 )
				end,
				function ()
					return self.OuterMaskTop:SetAlpha( 0.6, 500, LUI.EASING.outBack )
				end
			},
			{
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -635, _1080p * -215, 0 )
				end,
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -635, _1080p * -215, 500, LUI.EASING.outBack )
				end,
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -320, _1080p * 100, 500, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -320, _1080p * 100, 139 )
				end,
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -280, _1080p * 140, 9 )
				end,
				function ()
					return self.OuterMaskTop:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * -190, _1080p * 76, _1080p * -320, _1080p * 100, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		BloodSplat:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.BloodSplat:SetAlpha( 0, 0 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0, 140 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0.5, 10 )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0.5, 200, LUI.EASING.outQuadratic )
				end,
				function ()
					return self.BloodSplat:SetAlpha( 0.4, 650, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BloodSplat:SetZRotation( -5, 1000 )
				end,
				function ()
					return self.BloodSplat:SetZRotation( -5, 150 )
				end,
				function ()
					return self.BloodSplat:SetZRotation( 0, 850, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.BloodSplat:playSound( "splat", false, 1150 )
				end
			},
			{
				function ()
					return self.BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 238.92, _1080p * 567.08, _1080p * 51.65, _1080p * 318.35, 1149 )
				end,
				function ()
					return self.BloodSplat:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 718, _1080p * -71, _1080p * 441, 70 )
				end
			}
		} )
		CPMainMenuButtons:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.CPMainMenuButtons:SetAlpha( 0, 0 )
				end,
				function ()
					return self.CPMainMenuButtons:SetAlpha( 0, 1150 )
				end,
				function ()
					return self.CPMainMenuButtons:SetAlpha( 1, 850 )
				end
			}
		} )
		ZombiesLogo:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ZombiesLogo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ZombiesLogo:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.ZombiesLogo:SetAlpha( 1, 150 )
				end
			},
			{
				function ()
					return self.ZombiesLogo:SetZRotation( 5, 1000 )
				end,
				function ()
					return self.ZombiesLogo:SetZRotation( 5, 150 )
				end,
				function ()
					return self.ZombiesLogo:SetZRotation( 0, 850, LUI.EASING.outQuadratic )
				end
			},
			{
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -399.8, _1080p * 1279.8, _1080p * -260, _1080p * 728, 1000 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 88, _1080p * 708, _1080p * 24.65, _1080p * 389.35, 149 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58, _1080p * 738, _1080p * 7, _1080p * 407, 200 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58, _1080p * 738, _1080p * 9, _1080p * 409, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56, _1080p * 736, _1080p * 8.68, _1080p * 408.68, 50 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58.35, _1080p * 738.35, _1080p * 6.39, _1080p * 406.39, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58.28, _1080p * 738.28, _1080p * 4.51, _1080p * 404.51, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.22, _1080p * 736.22, _1080p * 7.03, _1080p * 407.03, 50 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58.64, _1080p * 738.64, _1080p * 7.02, _1080p * 407.02, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58.47, _1080p * 738.47, _1080p * 9.01, _1080p * 409.01, 50 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.33, _1080p * 736.33, _1080p * 8.4, _1080p * 408.4, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 56.93, _1080p * 736.93, _1080p * 5.9, _1080p * 405.9, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 57.4, _1080p * 737.4, _1080p * 8.38, _1080p * 408.38, 50 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 57.73, _1080p * 737.73, _1080p * 9.61, _1080p * 409.61, 49 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 59.93, _1080p * 739.93, _1080p * 7.65, _1080p * 407.65, 50 )
				end,
				function ()
					return self.ZombiesLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 58, _1080p * 738, _1080p * 7, _1080p * 407, 49, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Intro = function ()
			OuterMaskBottom:AnimateSequence( "Intro" )
			OuterMaskTop:AnimateSequence( "Intro" )
			BloodSplat:AnimateSequence( "Intro" )
			CPMainMenuButtons:AnimateSequence( "Intro" )
			ZombiesLogo:AnimateSequence( "Intro" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f69_arg0, f69_arg1 )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f69_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_start", function ( f70_arg0, f70_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f70_arg1.controller or f7_local1 )
	end )
	f0_local6( self, f7_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	ACTIONS.AnimateSequence( self, "Intro" )
	return self
end

MenuBuilder.registerType( "CPMainMenu", CPMainMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "CPMainMenu", f0_local2 )
LUI.FlowManager.RegisterStackPopBehaviour( "CPMainMenu", f0_local4 )
LockTable( _M )
