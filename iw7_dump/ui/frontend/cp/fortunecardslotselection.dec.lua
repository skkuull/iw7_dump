local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ()
	Engine.SetFrontEndSceneSection( "zm_consumable_selection", 1 )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	ZombiesUtils.ValidateFortuneCards( f2_arg1 )
	if f2_arg2.useAnimation then
		ACTIONS.AnimateSequence( f2_arg0, "ShowCardsPC" )
		local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
		f2_local0.useAnimation = false
	end
end

function FortuneCardSlotSelection( menu, controller )
	local self = LUI.UIHorizontalNavigator.new()
	self.id = "FortuneCardSlotSelection"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	f0_local0( self, f3_local1, controller )
	self:playSound( "menu_open" )
	local f3_local2 = self
	local fortuneCardSlotWidget = nil
	
	fortuneCardSlotWidget = MenuBuilder.BuildRegisteredType( "fortuneCardSlotWidget", {
		controllerIndex = f3_local1
	} )
	fortuneCardSlotWidget.id = "fortuneCardSlotWidget"
	fortuneCardSlotWidget:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 533.25, _1080p * 1386.75, _1080p * 736, _1080p * 962 )
	self:addElement( fortuneCardSlotWidget )
	self.fortuneCardSlotWidget = fortuneCardSlotWidget
	
	local EdgeDarken = nil
	
	EdgeDarken = LUI.UIImage.new()
	EdgeDarken.id = "EdgeDarken"
	EdgeDarken:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
	EdgeDarken:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1305, 0, _1080p * 672 )
	self:addElement( EdgeDarken )
	self.EdgeDarken = EdgeDarken
	
	local EdgeDarken2 = nil
	
	EdgeDarken2 = LUI.UIImage.new()
	EdgeDarken2.id = "EdgeDarken2"
	EdgeDarken2:setImage( RegisterMaterial( "menu_title_darkener" ), 0 )
	EdgeDarken2:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1305, 0, _1080p * 672 )
	self:addElement( EdgeDarken2 )
	self.EdgeDarken2 = EdgeDarken2
	
	local CPMenuTitle = nil
	
	CPMenuTitle = MenuBuilder.BuildRegisteredType( "CPMenuTitle", {
		controllerIndex = f3_local1
	} )
	CPMenuTitle.id = "CPMenuTitle"
	CPMenuTitle.MenuTitle:setText( Engine.Localize( "LUA_MENU_ZM_CREATE_DECK" ), 0 )
	CPMenuTitle:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 96, _1080p * 1056, _1080p * 54, _1080p * 134 )
	self:addElement( CPMenuTitle )
	self.CPMenuTitle = CPMenuTitle
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f3_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 995, _1080p * 1080 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local SocialFeed = nil
	
	SocialFeed = MenuBuilder.BuildRegisteredType( "SocialFeed", {
		controllerIndex = f3_local1
	} )
	SocialFeed.id = "SocialFeed"
	SocialFeed:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 1920, _1080p * 965, _1080p * 995 )
	self:addElement( SocialFeed )
	self.SocialFeed = SocialFeed
	
	local f3_local9 = nil
	if CONDITIONS.IsPublicMatch( self ) then
		f3_local9 = MenuBuilder.BuildRegisteredType( "CRMMain", {
			controllerIndex = f3_local1
		} )
		f3_local9.id = "CRMMain"
		f3_local9:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 137, _1080p * 447, _1080p * 745, _1080p * 1069 )
		self:addElement( f3_local9 )
		self.CRMMain = f3_local9
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ShowText = function ()
			
		end
		
		self._sequences.HideText = function ()
			
		end
		
		fortuneCardSlotWidget:RegisterAnimationSequence( "ShowCardsPC", {
			{
				function ()
					return self.fortuneCardSlotWidget:SetAlpha( 0, 0 )
				end,
				function ()
					return self.fortuneCardSlotWidget:SetAlpha( 0, 750 )
				end,
				function ()
					return self.fortuneCardSlotWidget:SetAlpha( 1, 450 )
				end
			}
		} )
		self._sequences.ShowCardsPC = function ()
			fortuneCardSlotWidget:AnimateSequence( "ShowCardsPC" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self.addButtonHelperFunction = function ( f12_arg0, f12_arg1 )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_SELECT" ),
			button_ref = "button_primary",
			side = "left",
			priority = -10,
			clickable = true
		} )
		f12_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_ZM_TIPS" ),
			button_ref = "button_alt1",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f3_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.bindButton:addEventHandler( "button_alt1", function ( f14_arg0, f14_arg1 )
		ACTIONS.OpenPopupMenu( self, "FAFCardsHintsPopup", true, f14_arg1.controller or f3_local1 )
	end )
	PostLoadFunc( self, f3_local1, controller )
	if not CONDITIONS.HasSeenFateCardTips( f3_local1 ) then
		ACTIONS.OpenPopupMenu( self, "FAFCardsHintsRequestPopup", true, f3_local1 )
		ACTIONS.AnimateSequence( self, "ShowText" )
		ACTIONS.SetSeenFateCardTips( f3_local1 )
	end
	if CONDITIONS.IsPublicMatch( self ) then
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "CRMMain",
			sequenceName = "Minimize",
			elementPath = "CRMMain"
		} )
	end
	return self
end

MenuBuilder.registerType( "FortuneCardSlotSelection", FortuneCardSlotSelection )
LockTable( _M )
