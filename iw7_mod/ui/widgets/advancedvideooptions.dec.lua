local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
	f1_local0.showingSubCategory = false
	ACTIONS.AnimateSequence( f1_arg0, "HideSubmenu" )
	f1_arg0.PCOptionWindowSubmenu:ClearCurrentOptions()
	if f1_arg1 and not f1_arg1.noFocus then
		ACTIONS.LoseFocus( f1_arg0, "OptionsAdvancedVideo", controllerIndex )
		ACTIONS.LoseFocus( f1_arg0, "PCOptionWindowSubmenu", controllerIndex )
		ACTIONS.GainFocus( f1_arg0, "PCOptionWindow", controllerIndex )
	end
	f1_arg0.PCOptionWindow:SetHandleMouseTree( true )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.OptionsAdvancedVideo )
	assert( f2_arg0.PCOptionWindow )
	assert( f2_arg0.bindButton )
	f2_arg0.OptionsAdvancedVideo:registerEventHandler( "category_button_over", function ( element, event )
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
	f2_arg0.LeaveSubCategoryMenu = f0_local0
	f2_arg0:addEventHandler( "subcategory_option_selected", function ( f5_arg0, f5_arg1 )
		f2_arg0.PCOptionWindow:RefreshCurrentOptions()
	end )
	f2_arg0.bindButton:addEventHandler( "button_secondary", function ( f6_arg0, f6_arg1 )
		local f6_local0 = f6_arg1.controller or f2_arg1
		local f6_local1 = LUI.FlowManager.GetScopedData( f2_arg0 )
		if f6_local1.showingSubCategory then
			f2_arg0:LeaveSubCategoryMenu( f6_arg1 )
			Engine.PlaySound( CoD.SFX.SelectBack )
		elseif f2_arg0.PCOptionWindow:getFirstInFocus() ~= nil then
			ACTIONS.LoseFocus( f2_arg0, "PCOptionWindow", f6_local0 )
			ACTIONS.GainFocus( f2_arg0, "OptionsAdvancedVideo", f6_local0 )
		else
			ACTIONS.LeaveMenu( f2_arg0 )
		end
		return true
	end )
	f2_arg0:addEventHandler( "gain_focus", function ( f7_arg0, f7_arg1 )
		local f7_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
		if f7_local0.showingSubCategory then
			ACTIONS.GainFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
			return true
		else
			
		end
	end )
	f2_arg0.OptionsAdvancedVideo:registerEventHandler( "category_changed", function ( element, event )
		f2_arg0.PCOptionWindow:UpdateOptions( f2_arg1, event.title, event.createOptions, event.category )
		if not event.noFocus then
			ACTIONS.LoseFocus( f2_arg0, "OptionsAdvancedVideo", f2_arg1 )
			ACTIONS.GainFocus( f2_arg0, "PCOptionWindow", f2_arg1 )
		end
	end )
	f2_arg0.PCOptionWindow:registerEventHandler( "subcategory_changed", function ( element, event )
		f2_arg0.PCOptionWindowSubmenu:UpdateOptions( f2_arg1, event.title, event.createOptions )
		ACTIONS.AnimateSequence( f2_arg0, "ShowSubmenu" )
		local f9_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
		f9_local0.showingSubCategory = true
		if not event.noFocus then
			ACTIONS.LoseFocus( f2_arg0, "OptionsAdvancedVideo", f2_arg1 )
			ACTIONS.LoseFocus( f2_arg0, "PCOptionWindow", f2_arg1 )
			ACTIONS.GainFocus( f2_arg0, "PCOptionWindowSubmenu", f2_arg1 )
			if event.blockMouseInSubcategory then
				f2_arg0.PCOptionWindow:SetHandleMouseTree( false )
			end
		end
	end )
	f2_arg0.PCOptionWindowSubmenu:processEvent( {
		name = "hide_description_text"
	} )
end

function AdvancedVideoOptions( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AdvancedVideoOptions"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	self:playSound( "menu_open" )
	local f10_local2 = self
	local f10_local3 = nil
	if not Engine.InFrontend() then
		f10_local3 = LUI.UIImage.new()
		f10_local3.id = "Background"
		f10_local3:SetRGBFromInt( 0, 0 )
		f10_local3:SetAlpha( 0.5, 0 )
		self:addElement( f10_local3 )
		self.Background = f10_local3
	end
	local f10_local4 = nil
	if not CONDITIONS.IsThirdGameModeDesired( self ) then
		f10_local4 = MenuBuilder.BuildRegisteredType( "MenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local4.id = "MenuTitle"
		f10_local4.MenuTitle:setText( Engine.Localize( "LUA_MENU_ADVANCED_VIDEO" ), 0 )
		f10_local4.MenuBreadcrumbs:setText( ToUpperCase( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ) ), 0 )
		f10_local4.Icon:SetTop( _1080p * -10, 0 )
		f10_local4.Icon:SetBottom( _1080p * 80, 0 )
		f10_local4.Icon:setImage( RegisterMaterial( "icon_usna_symbol" ), 0 )
		f10_local4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
		self:addElement( f10_local4 )
		self.MenuTitle = f10_local4
	end
	local f10_local5 = nil
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		f10_local5 = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
			controllerIndex = f10_local1
		} )
		f10_local5.id = "CPMenuTitle"
		f10_local5.MenuTitle:setText( Engine.Localize( "LUA_MENU_OPTIONS_CAPS" ), 0 )
		f10_local5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 84.21, _1080p * 1044.21, _1080p * 43, _1080p * 123 )
		self:addElement( f10_local5 )
		self.CPMenuTitle = f10_local5
	end
	local ButtonDescriptionText = nil
	
	ButtonDescriptionText = MenuBuilder.BuildRegisteredType( "ButtonDescriptionText", {
		controllerIndex = f10_local1
	} )
	ButtonDescriptionText.id = "ButtonDescriptionText"
	ButtonDescriptionText.Description:SetRight( _1080p * 415, 0 )
	ButtonDescriptionText:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 140, _1080p * 560, _1080p * 875, _1080p * 907 )
	self:addElement( ButtonDescriptionText )
	self.ButtonDescriptionText = ButtonDescriptionText
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f10_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local f10_local8 = nil
	if not CONDITIONS.IsSingleplayer( self ) then
		f10_local8 = MenuBuilder.BuildRegisteredType( "online_friends_widget", {
			controllerIndex = f10_local1
		} )
		f10_local8.id = "FriendsElement"
		f10_local8:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
		f10_local8:SetAlignment( LUI.Alignment.Left )
		f10_local8:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1401.97, _1080p * 1901.97, _1080p * 1022.5, _1080p * 1067.5 )
		self:addElement( f10_local8 )
		self.FriendsElement = f10_local8
	end
	local OptionsAdvancedVideo = nil
	
	OptionsAdvancedVideo = MenuBuilder.BuildRegisteredType( "OptionsVideoAdvanced", {
		controllerIndex = f10_local1
	} )
	OptionsAdvancedVideo.id = "OptionsAdvancedVideo"
	OptionsAdvancedVideo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 897 )
	self:addElement( OptionsAdvancedVideo )
	self.OptionsAdvancedVideo = OptionsAdvancedVideo
	
	local PCOptionWindow = nil
	
	PCOptionWindow = MenuBuilder.BuildRegisteredType( "PCOptionWindow", {
		controllerIndex = f10_local1
	} )
	PCOptionWindow.id = "PCOptionWindow"
	PCOptionWindow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996 )
	self:addElement( PCOptionWindow )
	self.PCOptionWindow = PCOptionWindow
	
	local PCOptionWindowSubmenu = nil
	
	PCOptionWindowSubmenu = MenuBuilder.BuildRegisteredType( "PCOptionWindow", {
		controllerIndex = f10_local1
	} )
	PCOptionWindowSubmenu.id = "PCOptionWindowSubmenu"
	PCOptionWindowSubmenu:SetAlpha( 0, 0 )
	PCOptionWindowSubmenu:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1946, _1080p * 2582, _1080p * 196, _1080p * 996 )
	self:addElement( PCOptionWindowSubmenu )
	self.PCOptionWindowSubmenu = PCOptionWindowSubmenu
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		OptionsAdvancedVideo:RegisterAnimationSequence( "ShowSubmenu", {
			{
				function ()
					return self.OptionsAdvancedVideo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -600, 0, _1080p * 196, _1080p * 897, 119 )
				end
			}
		} )
		PCOptionWindow:RegisterAnimationSequence( "ShowSubmenu", {
			{
				function ()
					return self.PCOptionWindow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1096, _1080p * 196, _1080p * 996, 119 )
				end
			}
		} )
		PCOptionWindowSubmenu:RegisterAnimationSequence( "ShowSubmenu", {
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
		self._sequences.ShowSubmenu = function ()
			OptionsAdvancedVideo:AnimateSequence( "ShowSubmenu" )
			PCOptionWindow:AnimateSequence( "ShowSubmenu" )
			PCOptionWindowSubmenu:AnimateSequence( "ShowSubmenu" )
		end
		
		OptionsAdvancedVideo:RegisterAnimationSequence( "HideSubmenu", {
			{
				function ()
					return self.OptionsAdvancedVideo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 130, _1080p * 730, _1080p * 196, _1080p * 897, 119 )
				end
			}
		} )
		PCOptionWindow:RegisterAnimationSequence( "HideSubmenu", {
			{
				function ()
					return self.PCOptionWindow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 790, _1080p * 1790, _1080p * 196, _1080p * 996, 119 )
				end
			}
		} )
		PCOptionWindowSubmenu:RegisterAnimationSequence( "HideSubmenu", {
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
		self._sequences.HideSubmenu = function ()
			OptionsAdvancedVideo:AnimateSequence( "HideSubmenu" )
			PCOptionWindow:AnimateSequence( "HideSubmenu" )
			PCOptionWindowSubmenu:AnimateSequence( "HideSubmenu" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f23_arg0, f23_arg1 )
		f23_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			priority = 10,
			clickable = true
		} )
		f23_arg0:AddButtonHelperText( {
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
	
	f0_local1( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "AdvancedVideoOptions", AdvancedVideoOptions )
LockTable( _M )
