local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	Engine.MenuDvarsSetup( f1_arg1 )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.bindButton )
	if not Engine.InFrontend() then
		f2_arg0:addEventHandler( "menu_create", function ()
			f2_arg0:AddButtonHelperText( {
				helper_text = Engine.Localize( "LUA_MENU_DISMISS_MENU" ),
				button_ref = "button_start",
				side = "left",
				priority = 20,
				clickable = true
			} )
		end )
		f2_arg0.bindButton:addEventHandler( "button_start", function ( f4_arg0, f4_arg1 )
			if Engine.IsSingleplayer() then
				ACTIONS.ResumeGame( f4_arg0 )
			end
			Engine.Exec( "updategamerprofile" )
			LUI.FlowManager.RequestCloseAllMenus()
			return true
		end )
	end
	if Engine.IsSingleplayer() then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_CAMPAIGN" ) ), 0 )
	elseif Engine.IsCoreMode() then
		f2_arg0.MenuTitle.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "MENU_MULTIPLAYER" ) ), 0 )
	end
	if CONDITIONS.IsConsoleGame( f2_arg0 ) and (not (not Engine.InFrontend() or not Engine.IsActiveLocalClientPrimary( f2_arg1 )) or Engine.IsActiveLocalClientPrimary( f2_arg1 )) then
		assert( f2_arg0.OptionsButtons.Brightness )
		local self = nil
		if CONDITIONS.IsSplitscreen( f2_arg0 ) then
			self = MenuBuilder.BuildAddChild( f2_arg0, {
				type = "brightness_guide",
				properties = {
					band_height = 80
				}
			} )
		else
			self = MenuBuilder.BuildAddChild( f2_arg0, {
				type = "brightness_guide"
			} )
		end
		local f2_local1 = f2_arg0.OptionsButtons.Brightness
		f2_local1:addEventHandler( "button_over", function ( f5_arg0, f5_arg1 )
			self:processEvent( {
				name = "brightness_over"
			} )
			if CONDITIONS.IsSplitscreen( f2_arg0 ) then
				self:SetTop( 80 )
				self:SetBottom( 320 )
			end
		end )
		f2_local1:addEventHandler( "button_up", function ( f6_arg0, f6_arg1 )
			self:processEvent( {
				name = "brightness_up"
			} )
		end )
	end
	if CONDITIONS.IsPC( f2_arg0 ) then
		assert( f2_arg0.PCOptionsButtonsElement )
		assert( f2_arg0.PCOptionWindow )
		assert( f2_arg0.PCOptionWindowSubmenu )
		f2_arg0.PCOptionsButtonsElement:registerEventHandler( "category_button_over", function ( element, event )
			f2_arg0.ButtonDescriptionText:SetAlpha( 1, 0 )
			f2_arg0.PCOptionWindow:processEvent( {
				name = "hide_description_text"
			} )
		end )
		f2_arg0.PCOptionWindow:registerEventHandler( "optionwindow_button_over", function ( element, event )
			f2_arg0.ButtonDescriptionText:SetAlpha( 0, 0 )
			f2_arg0.PCOptionWindow:processEvent( {
				name = "show_description_text"
			} )
		end )
		local f2_local1 = MenuBuilder.BuildAddChild( f2_arg0, {
			type = "brightness_guide",
			id = "brightness_guide_id",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					top = 520 * _1080p,
					left = 1300 * _1080p,
					width = 255,
					height = 210,
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			},
			properties = {
				band_height = 70
			}
		} )
		f2_arg0:addEventHandler( "gain_focus", function ( f9_arg0, f9_arg1 )
			local f9_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
			if f9_local0.showingSubCategory then
				ACTIONS.GainFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
				return true
			else
				
			end
		end )
		f2_arg0.PCOptionsButtonsElement:registerEventHandler( "category_changed", function ( element, event )
			f2_arg0.PCOptionWindow:UpdateOptions( f2_arg1, event.title, event.createOptions )
			if not event.noFocus then
				ACTIONS.LoseFocus( f2_arg0, "PCOptionsButtonsElement", f2_arg1 )
				ACTIONS.LoseFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
				ACTIONS.GainFocus( f2_arg0, "PCOptionWindow", f2_arg1 )
			end
		end )
		f2_arg0.PCOptionWindow:registerEventHandler( "subcategory_changed", function ( element, event )
			f2_arg0.PCOptionWindowSubmenu:UpdateOptions( f2_arg1, event.title, event.createOptions )
			ACTIONS.AnimateSequence( f2_arg0, "ShowSubmenu" )
			local f11_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
			f11_local0.showingSubCategory = true
			if not event.noFocus then
				ACTIONS.LoseFocus( f2_arg0, "PCOptionsButtonsElement", f2_arg1 )
				ACTIONS.LoseFocus( f2_arg0, "PCOptionWindow", f2_arg1 )
				ACTIONS.GainFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
			end
		end )
		f2_arg0.PCOptionWindowSubmenu:processEvent( {
			name = "hide_description_text"
		} )
		f2_arg0.PCOptionWindow:registerEventHandler( "brightness_over", function ()
			f2_local1:processEvent( {
				name = "brightness_over"
			} )
		end )
		f2_arg0.PCOptionWindow:registerEventHandler( "brightness_up", function ()
			f2_local1:processEvent( {
				name = "brightness_up"
			} )
		end )
		local f2_local2 = function ( f14_arg0 )
			local f14_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
			f14_local0.showingSubCategory = false
			ACTIONS.AnimateSequence( f2_arg0, "HideSubmenu" )
			f2_arg0.PCOptionWindowSubmenu:ClearCurrentOptions()
			if f14_arg0 and not f14_arg0.noFocus then
				ACTIONS.LoseFocus( f2_arg0, "PCOptionsButtonsElement", f2_arg1 )
				ACTIONS.LoseFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
				ACTIONS.GainFocus( f2_arg0, "PCOptionWindow", f2_arg1 )
			end
		end
		
		f2_arg0:addEventHandler( "subcategory_option_selected", function ( f15_arg0, f15_arg1 )
			f2_arg0.PCOptionWindow:RefreshCurrentOptions()
		end )
		f2_arg0.bindButton:registerEventHandler( "button_secondary", function ( element, event )
			local f16_local0 = event.controller or f2_arg1
			local f16_local1 = LUI.FlowManager.GetScopedData( f2_arg0 )
			if f16_local1.showingSubCategory then
				f2_local2( event )
				Engine.PlaySound( CoD.SFX.SelectBack )
			elseif f2_arg0.PCOptionWindow:getFirstInFocus() ~= nil then
				ACTIONS.LoseFocus( f2_arg0, "PCOptionWindow", f16_local0 )
				ACTIONS.LoseFocus( f2_arg0, "PCOptionWindowSubmenu", f16_local0 )
				ACTIONS.GainFocus( f2_arg0, "PCOptionsButtonsElement", f16_local0 )
			else
				ACTIONS.LeaveMenu( f2_arg0 )
				Engine.ExecNow( "profile_menuDvarsFinish" )
				if Engine.GetDvarFloat( "r_lodScale" ) == 2 then
					Engine.SetDvarFloat( "r_lodBias", -100 )
				end
				if Engine.GetDvarFloat( "r_lodScale" ) == 1 then
					Engine.SetDvarFloat( "r_lodBias", 0 )
				end
				Engine.Exec( "updategamerprofile" )
			end
			return true
		end )
	end
	local self = LUI.UIElement.new( {
		worldBlur = 5
	} )
	self:setupWorldBlur()
	self.id = "blur"
	f2_arg0:addElement( self )
	f2_arg0:addEventHandler( "menu_close", function ( f17_arg0, f17_arg1 )
		Engine.Exec( "updategamerprofile" )
	end )
	ACTIONS.PlaySoundSetSound( f2_arg0, "selectAlt", false )
end

function OptionsMenu( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "OptionsMenu"
	self._animationSets = {}
	self._sequences = {}
	local f18_local1 = controller and controller.controllerIndex
	if not f18_local1 and not Engine.InFrontend() then
		f18_local1 = self:getRootController()
	end
	assert( f18_local1 )
	f0_local0( self, f18_local1, controller )
	self:playSound( "menu_open" )
	local f18_local2 = self
	local f18_local3 = nil
	if Engine.InFrontend() and CONDITIONS.IsSingleplayer( self ) then
		f18_local3 = LUI.UIImage.new()
		f18_local3.id = "Background"
		f18_local3:SetAlpha( 0.5, 0 )
		f18_local3:setImage( RegisterMaterial( "sp_frontend_bink_background" ), 0 )
		self:addElement( f18_local3 )
		self.Background = f18_local3
	end
	local f18_local4 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f18_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local4.id = "MenuTitle"
		f18_local4.MenuTitle:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
		f18_local4.MenuBreadcrumbs:setText( ToUpperCase( "" ), 0 )
		f18_local4.Icon:SetTop( _1080p * -10, 0 )
		f18_local4.Icon:SetBottom( _1080p * 80, 0 )
		f18_local4.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f18_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f18_local4 )
		self.MenuTitle = f18_local4
	end
	local f18_local5 = nil
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		f18_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f18_local1
		} )
		f18_local5.id = "CPMenuTitle"
		f18_local5.MenuTitle:setText( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ), 0 )
		f18_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f18_local5 )
		self.CPMenuTitle = f18_local5
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f18_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 415, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 897, _1080p * 929 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f18_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -85, 0 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f18_local8 = nil
	if CONDITIONS.IsFriendsButtonAccessible( self, f18_local1 ) then
		f18_local8 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f18_local1
		} )
		f18_local8.id = "FriendsElement"
		f18_local8:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f18_local8:SetAlignment( LUI.Alignment.Left )
		f18_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.97, _1080p * 1901.97, _1080p * 1022.5, _1080p * 1067.5 )
		self:addElement( f18_local8 )
		self.FriendsElement = f18_local8
	end
	local f18_local9 = nil
	if CONDITIONS.IsConsoleGame( self ) then
		f18_local9 = MenuBuilder.BuildRegisteredType( "OptionsButtons", {
			controllerIndex = f18_local1
		} )
		f18_local9.id = "OptionsButtons"
		f18_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 184.5, _1080p * 897 )
		self:addElement( f18_local9 )
		self.OptionsButtons = f18_local9
	end
	local f18_local10 = nil
	if CONDITIONS.IsPC( self ) then
		f18_local10 = MenuBuilder.BuildRegisteredType( "PCOptionsButtons", {
			controllerIndex = f18_local1
		} )
		f18_local10.id = "PCOptionsButtonsElement"
		f18_local10:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 809 )
		self:addElement( f18_local10 )
		self.PCOptionsButtonsElement = f18_local10
	end
	local f18_local11 = nil
	if CONDITIONS.IsPC( self ) then
		f18_local11 = MenuBuilder.BuildRegisteredType( "PCOptionWindow", {
			controllerIndex = f18_local1
		} )
		f18_local11.id = "PCOptionWindow"
		f18_local11:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996 )
		self:addElement( f18_local11 )
		self.PCOptionWindow = f18_local11
	end
	local f18_local12 = nil
	if CONDITIONS.IsPC( self ) then
		f18_local12 = MenuBuilder.BuildRegisteredType( "PCOptionWindow", {
			controllerIndex = f18_local1
		} )
		f18_local12.id = "PCOptionWindowSubmenu"
		f18_local12:SetAlpha( 0, 0 )
		f18_local12:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1946, _1080p * 2582, _1080p * 196, _1080p * 996 )
		self:addElement( f18_local12 )
		self.PCOptionWindowSubmenu = f18_local12
	end
	local f18_local13 = nil
	if CONDITIONS.InFrontend( self ) then
		f18_local13 = MenuBuilder.BuildRegisteredType( "SocialFeed", {
			controllerIndex = f18_local1
		} )
		f18_local13.id = "SocialFeed"
		f18_local13:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85 )
		self:addElement( f18_local13 )
		self.SocialFeed = f18_local13
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ButtonDescriptionText:RegisterAnimationSequence( "FullScreenState", {
			{
				function ()
					return self.ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 917, _1080p * 949, 0 )
				end
			}
		} )
		ButtonHelperBar:RegisterAnimationSequence( "FullScreenState", {
			{
				function ()
					return self.ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080, 0 )
				end
			}
		} )
		if CONDITIONS.IsConsoleGame( self ) then
			f18_local9:RegisterAnimationSequence( "FullScreenState", {
				{
					function ()
						return self.OptionsButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 216, _1080p * 917, 0 )
					end
				}
			} )
		end
		if CONDITIONS.InFrontend( self ) then
			f18_local13:RegisterAnimationSequence( "FullScreenState", {
				{
					function ()
						return self.SocialFeed:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -115, _1080p * -85, 0 )
					end
				}
			} )
		end
		self._sequences.FullScreenState = function ()
			ButtonDescriptionText:AnimateSequence( "FullScreenState" )
			ButtonHelperBar:AnimateSequence( "FullScreenState" )
			if CONDITIONS.IsConsoleGame( self ) then
				f18_local9:AnimateSequence( "FullScreenState" )
			end
			if CONDITIONS.InFrontend( self ) then
				f18_local13:AnimateSequence( "FullScreenState" )
			end
		end
		
		ButtonDescriptionText:RegisterAnimationSequence( "SplitScreenState", {
			{
				function ()
					return self.ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 550, _1080p * 496, _1080p * 528, 0 )
				end
			}
		} )
		if CONDITIONS.IsConsoleGame( self ) then
			f18_local9:RegisterAnimationSequence( "SplitScreenState", {
				{
					function ()
						return self.OptionsButtons:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 906, _1080p * 216, _1080p * 496, 0 )
					end
				}
			} )
		end
		self._sequences.SplitScreenState = function ()
			ButtonDescriptionText:AnimateSequence( "SplitScreenState" )
			if CONDITIONS.IsConsoleGame( self ) then
				f18_local9:AnimateSequence( "SplitScreenState" )
			end
		end
		
		if CONDITIONS.IsPC( self ) then
			f18_local10:RegisterAnimationSequence( "ShowSubmenu", {
				{
					function ()
						return self.PCOptionsButtonsElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -600, 0, _1080p * 196, _1080p * 809, 119 )
					end
				}
			} )
		end
		if CONDITIONS.IsPC( self ) then
			f18_local11:RegisterAnimationSequence( "ShowSubmenu", {
				{
					function ()
						return self.PCOptionWindow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 196, _1080p * 996, 119 )
					end
				}
			} )
		end
		if CONDITIONS.IsPC( self ) then
			f18_local12:RegisterAnimationSequence( "ShowSubmenu", {
				{
					function ()
						return self.PCOptionWindowSubmenu:SetAlpha( 1, 0 )
					end
				},
				{
					function ()
						return self.PCOptionWindowSubmenu:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1154, _1080p * 1790, _1080p * 196, _1080p * 996, 119 )
					end
				}
			} )
		end
		self._sequences.ShowSubmenu = function ()
			if CONDITIONS.IsPC( self ) then
				f18_local10:AnimateSequence( "ShowSubmenu" )
			end
			if CONDITIONS.IsPC( self ) then
				f18_local11:AnimateSequence( "ShowSubmenu" )
			end
			if CONDITIONS.IsPC( self ) then
				f18_local12:AnimateSequence( "ShowSubmenu" )
			end
		end
		
		if CONDITIONS.IsPC( self ) then
			f18_local10:RegisterAnimationSequence( "HideSubmenu", {
				{
					function ()
						return self.PCOptionsButtonsElement:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 809, 119 )
					end
				}
			} )
		end
		if CONDITIONS.IsPC( self ) then
			f18_local11:RegisterAnimationSequence( "HideSubmenu", {
				{
					function ()
						return self.PCOptionWindow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996, 119 )
					end
				}
			} )
		end
		if CONDITIONS.IsPC( self ) then
			f18_local12:RegisterAnimationSequence( "HideSubmenu", {
				{
					function ()
						return self.PCOptionWindowSubmenu:SetAlpha( 0, 0 )
					end
				},
				{
					function ()
						return self.PCOptionWindowSubmenu:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1946, _1080p * 2582, _1080p * 196, _1080p * 996, 119 )
					end
				}
			} )
		end
		self._sequences.HideSubmenu = function ()
			if CONDITIONS.IsPC( self ) then
				f18_local10:AnimateSequence( "HideSubmenu" )
			end
			if CONDITIONS.IsPC( self ) then
				f18_local11:AnimateSequence( "HideSubmenu" )
			end
			if CONDITIONS.IsPC( self ) then
				f18_local12:AnimateSequence( "HideSubmenu" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.InFrontend( self ) then
		f18_local13:addEventHandler( "menu_create", function ( f39_arg0, f39_arg1 )
			local f39_local0 = f39_arg1.controller or f18_local1
			if CONDITIONS.IsSplitscreen( self ) then
				ACTIONS.AnimateSequence( self, "SplitScreenState" )
			end
		end )
	end
	self.addButtonHelperFunction = function ( f40_arg0, f40_arg1 )
		f40_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f40_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f41_arg0, f41_arg1 )
		local f41_local0 = f41_arg1.controller or f18_local1
		ACTIONS.LeaveMenu( self )
		return true
	end )
	self:addEventHandler( "menu_create", function ( f42_arg0, f42_arg1 )
		local f42_local0 = f42_arg1.controller or f18_local1
		if CONDITIONS.IsSplitscreen( self ) then
			ACTIONS.AnimateSequence( self, "SplitScreenState" )
		end
		if CONDITIONS.IsThirdGameMode( self ) then
			ACTIONS.PlaySoundSetSound( self, "cpSelectAlt", false )
		end
	end )
	f0_local1( self, f18_local1, controller )
	return self
end

MenuBuilder.registerType( "OptionsMenu", OptionsMenu )
LockTable( _M )
