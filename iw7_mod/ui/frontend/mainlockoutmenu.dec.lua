local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if DCache.IsStartupDisabled() then
		LUI.FlowManager.RequestPopupMenu( nil, "PopupYesNo", false, false, false, {
			title = Engine.Localize( "MENU_NOTICE" ),
			message = Engine.Localize( "LUA_MENU_DCACHE_CLEAR_REQUEST" ),
			yesAction = function ()
				DCache.ClearDCache( 1 )
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end,
			noAction = function ()
				DCache.ClearStartupCount()
				Engine.SystemRestart( Engine.Localize( "@LUA_MENU_DCACHE_RESTART" ) )
			end
		}, nil, false, true )
	else
		local f1_local0 = f1_arg1.controller
		Engine.DisableSplitscreenControls( "MainLockout ButtonHandler", f1_local0 )
		Engine.ExecNow( "resetViewport" )
		if Engine.GetDvarBool( "sp_lockout_start_override" ) then
			if not Engine.IsSingleplayer() then
				Engine.StartGameModeSP()
			end
			LUI.FlowManager.RequestAddMenu( "CampaignMenu", true, f1_local0, false, false, false )
		else
			LUI.FlowManager.RequestAddMenu( "MainMenu", false, f1_local0 )
		end
	end
end

function PostLoadFunc( f4_arg0, f4_arg1, f4_arg2 )
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f4_arg0:addElement( bindButton )
	f4_arg0.bindButton = bindButton
	
	f4_arg0.bindButton:addEventHandler( "button_start", f0_local0 )
	f4_arg0.bindButton:addEventHandler( "button_primary", f0_local0 )
	if Engine.IsPC() then
		f4_arg0:registerEventHandler( "mousedown", function ( element, event )
			f0_local0( f4_arg0, event )
		end )
	end
	f4_arg0:registerEventHandler( "not_below_blocking_fence", function ( element, event )
		if element._openedForInteraction == nil then
			Engine.StopGameMode()
			Engine.PlayMusic( CoD.Music.MainSPMusic )
			Engine.EnableSplitscreenControls( "MainLockout menu opened" )
			Engine.SetDvarBool( "splitscreen", false )
			element._openedForInteraction = true
		end
	end )
	f4_arg0:addEventHandler( "menu_create", function ( f7_arg0, f7_arg1 )
		if Engine.IsXB3() or Engine.IsPCApp() then
			f4_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_SWITCH_USER" ),
				button_ref = "button_select",
				side = "left",
				clickable = true
			} )
		end
	end )
	if Engine.IsXB3() or Engine.IsPCApp() then
		f4_arg0.bindButton:addEventHandler( "button_select", function ( f8_arg0, f8_arg1 )
			Engine.ShowAccountPicker( f8_arg1.controller, true )
			return true
		end )
	end
	Engine.PlayMenuVideo( "campaignmenu", VideoPlaybackFlags.LOOP )
	local f4_local1 = f4_arg0.ActionText:Wait( 2400 )
	f4_local1.onComplete = function ()
		ACTIONS.AnimateSequence( f4_arg0, "ActionLoop" )
	end
	
end

function MainLockoutMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "MainLockoutMenu"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
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
	
	local ActionText = nil
	
	ActionText = LUI.UIStyledText.new()
	ActionText.id = "ActionText"
	ActionText:SetAlpha( 0.8, 0 )
	ActionText:setText( LocalizeString( "@PLATFORM_PRESS_START_BUTTON" ), 0 )
	ActionText:SetFontSize( 38 * _1080p )
	ActionText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	ActionText:SetAlignment( LUI.Alignment.Center )
	ActionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 710, _1080p * 1210, _1080p * 698.91, _1080p * 736.91 )
	self:addElement( ActionText )
	self.ActionText = ActionText
	
	local LogoBlur = nil
	
	LogoBlur = LUI.UIImage.new()
	LogoBlur.id = "LogoBlur"
	LogoBlur:setImage( RegisterMaterial( "cod_splash_logo_blur_1" ), 0 )
	LogoBlur:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 389.43, _1080p * 1530.57, _1080p * 398.5, _1080p * 683.5 )
	self:addElement( LogoBlur )
	self.LogoBlur = LogoBlur
	
	local Logo = nil
	
	Logo = LUI.UIImage.new()
	Logo.id = "Logo"
	Logo:setImage( RegisterMaterial( "cod_splash_logo_1" ), 0 )
	Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 389.43, _1080p * 1530.57, _1080p * 398.5, _1080p * 683.5 )
	self:addElement( Logo )
	self.Logo = Logo
	
	local Copyright = nil
	
	Copyright = LUI.UIStyledText.new()
	Copyright.id = "Copyright"
	Copyright:SetAlpha( 0, 0 )
	Copyright:setText( Engine.Localize( "LUA_MENU_LEGAL_COPYRIGHT" ), 0 )
	Copyright:SetFontSize( 32 * _1080p )
	Copyright:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Copyright:SetAlignment( LUI.Alignment.Center )
	Copyright:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 447.5, _1080p * 1471.5, _1080p * 936.5, _1080p * 968.5 )
	self:addElement( Copyright )
	self.Copyright = Copyright
	
	local f10_local9 = nil
	if CONDITIONS.IsXboxLive( self ) then
		f10_local9 = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
			controllerIndex = f10_local1
		} )
		f10_local9.id = "HelperBar"
		f10_local9:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
		self:addElement( f10_local9 )
		self.HelperBar = f10_local9
	end
	local f10_local10 = nil
	if CONDITIONS.IsXboxLive( self ) then
		f10_local10 = MenuBuilder.BuildRegisteredType( "PlayerLogIn", {
			controllerIndex = f10_local1
		} )
		f10_local10.id = "Gamertag"
		f10_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 584, _1080p * 964.5, _1080p * 993.5 )
		self:addElement( f10_local10 )
		self.Gamertag = f10_local10
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ActionText:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.ActionText:SetAlpha( 0, 0 )
				end,
				function ()
					return self.ActionText:SetAlpha( 0, 900 )
				end,
				function ()
					return self.ActionText:SetAlpha( 0.6, 1500 )
				end
			}
		} )
		LogoBlur:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.LogoBlur:SetAlpha( 0, 0 )
				end,
				function ()
					return self.LogoBlur:SetAlpha( 0, 580 )
				end,
				function ()
					return self.LogoBlur:SetAlpha( 1, 220, LUI.EASING.inCubic )
				end,
				function ()
					return self.LogoBlur:SetAlpha( 0, 50 )
				end
			},
			{
				function ()
					return self.LogoBlur:SetScale( 2, 0 )
				end,
				function ()
					return self.LogoBlur:SetScale( 2, 500 )
				end,
				function ()
					return self.LogoBlur:SetScale( 0, 300, LUI.EASING.inCubic )
				end
			}
		} )
		Logo:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Logo:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 580 )
				end,
				function ()
					return self.Logo:SetAlpha( 0, 210, LUI.EASING.inCubic )
				end,
				function ()
					return self.Logo:SetAlpha( 1, 10 )
				end
			},
			{
				function ()
					return self.Logo:SetScale( 2, 0 )
				end,
				function ()
					return self.Logo:SetScale( 2, 500 )
				end,
				function ()
					return self.Logo:SetScale( 0, 300 )
				end
			}
		} )
		Copyright:RegisterAnimationSequence( "Intro", {
			{
				function ()
					return self.Copyright:SetAlpha( 0, 1000 )
				end,
				function ()
					return self.Copyright:SetAlpha( 0.4, 3000, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Intro = function ()
			ActionText:AnimateSequence( "Intro" )
			LogoBlur:AnimateSequence( "Intro" )
			Logo:AnimateSequence( "Intro" )
			Copyright:AnimateSequence( "Intro" )
		end
		
		ActionText:RegisterAnimationSequence( "ActionLoop", {
			{
				function ()
					return self.ActionText:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ActionText:SetAlpha( 0.2, 1500 )
				end,
				function ()
					return self.ActionText:SetAlpha( 0.6, 1500 )
				end
			}
		} )
		self._sequences.ActionLoop = function ()
			ActionText:AnimateLoop( "ActionLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f10_local1, controller )
	ACTIONS.AnimateSequence( self, "Intro" )
	return self
end

MenuBuilder.registerType( "MainLockoutMenu", MainLockoutMenu )
LockTable( _M )
