local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
LUI.FlowManager.RegisterFenceGroup( "MainMenu", {
	"bootCheck",
	"signIn",
	"gamerProfile",
	"shaderUpload"
} )
LUI.FlowManager.RequestSetStack( "MainMenu", {
	{
		name = "MainLockoutMenu"
	}
} )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsConsoleGame() then
		f1_arg0.bindButton:addEventHandler( "button_start", function ( f2_arg0, f2_arg1 )
			ACTIONS.OpenMenu( "OptionsMenu", true, f2_arg1.controller or controllerIndex )
		end )
		f1_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ),
			button_ref = "button_start",
			side = "left",
			priority = 4,
			clickable = true
		} )
		f1_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
	else
		assert( f1_arg0.HelperBar )
		f1_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_EXIT" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 1,
			clickable = true
		} )
		f1_arg0.HelperBar:processEvent( {
			name = "ignore_game_mode_layout",
			controller = controllerIndex
		} )
	end
	Engine.SetDvarBool( "ui_skipMainLockout", false )
	Engine.SetDvarInt( "lui_matchSummaryAvailable", 0 )
	if not Engine.IsConsoleGame() and Engine.GetDvarBool( "ui_autodetectGamepad" ) and not Engine.GetDvarBool( "ui_autodetectGamepadDone" ) then
		Engine.SetDvarBool( "ui_autodetectGamepadDone", true )
		local f1_local0 = Engine.IsGamepadEnabled() == 1
		local f1_local1 = Engine.IsGamepadConnected()
		if f1_local0 and not f1_local1 then
			LUI.FlowManager.RequestPopupMenu( nil, "no_controller_initial_popup" )
		elseif f1_local1 and not f1_local0 then
			LUI.FlowManager.RequestPopupMenu( nil, "controller_initial_popup" )
		end
	end
end

f0_local1 = function ( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:registerEventHandler( "not_below_blocking_fence", function ( element, event )
		Engine.StopGameMode()
		Engine.PlayMusic( CoD.Music.MainSPMusic )
		Engine.DisableSplitscreenControls( "MainMenu menu opened" )
		Engine.SetDvarBool( "systemlink", false )
	end )
	assert( f3_arg0.bindButton )
	f3_arg0.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		if Engine.IsConsoleGame() then
			LUI.FlowManager.RequestLeaveMenu( f5_arg0, true, true )
		else
			LUI.FlowManager.RequestPopupMenu( f3_arg0, "quit_popmenu", false, f5_arg1.controller )
		end
		return true
	end )
	f3_arg0:addEventHandler( "menu_create", f0_local0 )
	Engine.CRMClearLocallyCachedData()
	Engine.PlayMenuVideo( "campaignmenu", VideoPlaybackFlags.LOOP )
end

function MainMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MainMenu"
	self._animationSets = {}
	self._sequences = {}
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	self:playSound( "menu_open" )
	local f6_local2 = self
	local f6_local3 = nil
	if CONDITIONS.IsSingleplayer( self ) then
		f6_local3 = LUI.UIImage.new()
		f6_local3.id = "Background"
		f6_local3:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
		self:addElement( f6_local3 )
		self.Background = f6_local3
	end
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
		controllerIndex = f6_local1
	} )
	HelperBar.id = "HelperBar"
	HelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( HelperBar )
	self.HelperBar = HelperBar
	
	local MainMenuButtons = nil
	
	MainMenuButtons = MenuBuilder.BuildRegisteredType( "MainMenuButtons", {
		controllerIndex = f6_local1
	} )
	MainMenuButtons.id = "MainMenuButtons"
	MainMenuButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 630, _1080p * 360, _1080p * 688 )
	self:addElement( MainMenuButtons )
	self.MainMenuButtons = MainMenuButtons
	
	local CODLogo = nil
	
	CODLogo = LUI.UIImage.new()
	CODLogo.id = "CODLogo"
	CODLogo:setImage( RegisterMaterial( "cod_logo" ), 0 )
	CODLogo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 108, _1080p * 648, _1080p * 120, _1080p * 255 )
	self:addElement( CODLogo )
	self.CODLogo = CODLogo
	
	local f6_local9 = nil
	if CONDITIONS.IsXboxLive( self ) then
		f6_local9 = MenuBuilder.BuildRegisteredType( "PlayerLogIn", {
			controllerIndex = f6_local1
		} )
		f6_local9.id = "Gamertag"
		f6_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 960, _1080p * 964.5, _1080p * 993.5 )
		self:addElement( f6_local9 )
		self.Gamertag = f6_local9
	end
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
	self.addButtonHelperFunction = function ( f11_arg0, f11_arg1 )
		f11_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "menu_create", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f6_local1
		if not CONDITIONS.IsConsoleGame( self ) then
			ACTIONS.AnimateSequence( self, "ShowCopyright" )
		end
	end )
	f0_local1( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "MainMenu", MainMenu )
LockTable( _M )
