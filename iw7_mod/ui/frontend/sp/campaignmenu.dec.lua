local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "CampaignMenu", {
	"sp",
	"spInstall"
} )
LUI.FlowManager.RequestSetStack( "CampaignMenu", {
	{
		name = "MainLockoutMenu"
	},
	{
		name = "MainMenu"
	}
} )
f0_local0 = function ()
	Engine.PlayMusic( CoD.Music.MainSPMusic )
	Engine.Exec( "Updatedvarsfromprofile" )
	Engine.Exec( "profile_difficultyLoad" )
	Engine.Exec( "profile_specialistModeLoad" )
	Engine.Exec( "profile_yoloModeLoad" )
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	f2_arg0:AddButtonHelperText( {
		helper_text = Engine.Localize( "LUA_MENU_BACK" ),
		button_ref = "button_secondary",
		side = "left",
		priority = 1,
		clickable = true
	} )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	assert( f3_arg0.bindButton )
	assert( f3_arg0.Screenshot )
	assert( f3_arg0.CampaignMenuButtons )
	assert( f3_arg0.CampaignMenuButtons.ResumeButton )
	Engine.Exec( "updatesavegameavailable" )
	Engine.SetDvarBool( "splitscreen", false )
	Engine.SetDvarString( "ui_prev_map", "" )
	Engine.SetDvarBool( "credits_active", false )
	Engine.SetDvarInt( "ui_play_credits", 0 )
	if Engine.GetDvarBool( "sp_lockout_start_override" ) then
		Engine.SetDvarString( "start", "" )
		LUI.FlowManager.RequestAddMenu( "LevelSelectMenu", true, f3_arg1, false )
	end
	f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f4_arg0, f4_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
	end )
	f3_arg0.Screenshot:setImage( RegisterMaterial( "textured_simple_screenshot" ), 0 )
	f3_arg0.CampaignMenuButtons.ResumeButton:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
		if Engine.IsSaveGameScreenShotAvailable() then
			f3_arg0.Screenshot:SetAlpha( 1, 0 )
		end
	end )
	f3_arg0.CampaignMenuButtons.ResumeButton:addEventHandler( "button_up", function ( f6_arg0, f6_arg1 )
		if Engine.IsSaveGameScreenShotAvailable() then
			f3_arg0.Screenshot:SetAlpha( 0, 0 )
		end
	end )
	ShowSPUnlockPopupsFunc( f3_arg0, f3_arg1 )
	f3_arg0:addEventHandler( "menu_create", f0_local1 )
	Engine.PlayMenuVideo( "campaignmenu", VideoPlaybackFlags.LOOP )
end

function ShowSPUnlockPopupsFunc( f7_arg0, f7_arg1 )
	if Engine.IsUserSignedIn( f7_arg1 ) then
		local f7_local0 = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.Gold, CoD.PlayMode.SP )
		local f7_local1 = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.TU1, CoD.PlayMode.SP )
		local f7_local2 = f7_local0.spData
		local f7_local3 = f7_local1.spDataTU1
		local f7_local4
		if f7_local2.unlockedRealism:GetValue( f7_arg1 ) ~= 1 then
			f7_local4 = Engine.GetDvarBool( "mis_cheat" )
		else
			f7_local4 = true
		end
		local f7_local5
		if f7_local2.beatRealism:GetValue( f7_arg1 ) ~= 1 then
			f7_local5 = Engine.GetDvarBool( "mis_cheat" )
		else
			f7_local5 = true
		end
		local f7_local6
		if f7_local3.taughtRealism:GetValue( f7_arg1 ) ~= 1 then
			f7_local6 = Engine.GetDvarBool( "mis_cheat" )
		else
			f7_local6 = true
		end
		local f7_local7
		if f7_local3.taughtYolo:GetValue( f7_arg1 ) ~= 1 then
			f7_local7 = Engine.GetDvarBool( "mis_cheat" )
		else
			f7_local7 = true
		end
		if f7_local4 then
			if not f7_local6 then
				f7_local3.taughtRealism:SetValue( f7_arg1, 1 )
				LUI.FlowManager.RequestPopupMenu( f7_arg0, "PopupSpecialistUnlock", true, f7_arg1, false )
			elseif f7_local5 and not f7_local7 then
				f7_local3.taughtYolo:SetValue( f7_arg1, 1 )
				LUI.FlowManager.RequestPopupMenu( nil, "PopupYoloUnlock", true, f7_arg1, false )
			end
		end
	end
end

function CampaignMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "CampaignMenu"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	self:playSound( "menu_open" )
	local f8_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Bink = nil
	
	Bink = LUI.UIImage.new()
	Bink.id = "Bink"
	Bink:setImage( RegisterMaterial( "cinematic" ), 0 )
	self:addElement( Bink )
	self.Bink = Bink
	
	local Copyright = nil
	
	Copyright = LUI.UIText.new()
	Copyright.id = "Copyright"
	Copyright:SetRGBFromInt( 14277081, 0 )
	Copyright:SetAlpha( 0, 0 )
	Copyright:setText( Engine.Localize( "LUA_MENU_LEGAL_COPYRIGHT" ), 0 )
	Copyright:SetFontSize( 45 * _1080p )
	Copyright:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Copyright:SetAlignment( LUI.Alignment.Center )
	Copyright:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 880, _1080p * 925 )
	self:addElement( Copyright )
	self.Copyright = Copyright
	
	local HelperBar = nil
	
	HelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f8_local1
	} )
	HelperBar.id = "HelperBar"
	HelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( HelperBar )
	self.HelperBar = HelperBar
	
	local f8_local7 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f8_local7 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f8_local1
		} )
		f8_local7.id = "MenuTitle"
		f8_local7.MenuTitle:setText( ToUpperCase( Engine.Localize( "MENU_CAMPAIGN" ) ), 0 )
		f8_local7.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f8_local7.Icon:SetTop( _1080p * -10, 0 )
		f8_local7.Icon:SetBottom( _1080p * 80, 0 )
		f8_local7.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f8_local7:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f8_local7 )
		self.MenuTitle = f8_local7
	end
	local CampaignMenuButtons = nil
	
	CampaignMenuButtons = MenuBuilder.BuildRegisteredType( "CampaignMenuButtons", {
		controllerIndex = f8_local1
	} )
	CampaignMenuButtons.id = "CampaignMenuButtons"
	CampaignMenuButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 216, _1080p * 656 )
	self:addElement( CampaignMenuButtons )
	self.CampaignMenuButtons = CampaignMenuButtons
	
	local Screenshot = nil
	
	Screenshot = LUI.UIImage.new()
	Screenshot.id = "Screenshot"
	Screenshot:SetAlpha( 0, 0 )
	Screenshot:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1269, _1080p * 1589, _1080p * 216, _1080p * 456 )
	self:addElement( Screenshot )
	self.Screenshot = Screenshot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Copyright:RegisterAnimationSequence( "ShowCopyright", {
			{
				function ()
					return self.Copyright:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.ShowCopyright = function ()
			Copyright:AnimateSequence( "ShowCopyright" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f13_arg0, f13_arg1 )
		f13_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
		f13_arg0:AddButtonHelperText( {
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
	
	self:addEventHandler( "menu_create", function ( f14_arg0, f14_arg1 )
		local f14_local0 = f14_arg1.controller or f8_local1
		if not CONDITIONS.IsConsoleGame( self ) then
			ACTIONS.AnimateSequence( self, "ShowCopyright" )
		end
	end )
	self.bindButton:addEventHandler( "button_start", function ( f15_arg0, f15_arg1 )
		ACTIONS.OpenMenu( "OptionsMenu", true, f15_arg1.controller or f8_local1 )
	end )
	f0_local2( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "CampaignMenu", CampaignMenu )
LUI.FlowManager.RegisterStackPushBehaviour( "CampaignMenu", f0_local0 )
LockTable( _M )
