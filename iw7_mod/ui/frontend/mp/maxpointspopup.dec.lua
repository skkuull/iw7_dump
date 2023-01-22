local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MaxPointsPopup( menu, controller )
	local self = LUI.UIVerticalNavigator.new()
	self:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, -215.5 * _1080p, 215.5 * _1080p, -126.5 * _1080p, 126.5 * _1080p )
	self.id = "MaxPointsPopup"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local GenericPopup = nil
	
	GenericPopup = MenuBuilder.BuildRegisteredType( "GenericPopup", {
		controllerIndex = f1_local1
	} )
	GenericPopup.id = "GenericPopup"
	GenericPopup:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericPopup )
	self.GenericPopup = GenericPopup
	
	local PointsFull = nil
	
	PointsFull = LUI.UIText.new()
	PointsFull.id = "PointsFull"
	PointsFull:setText( Engine.Localize( "LUA_MENU_MP_POINTS_MAXED_OUT" ), 0 )
	PointsFull:SetFontSize( 20 * _1080p )
	PointsFull:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	PointsFull:SetAlignment( LUI.Alignment.Left )
	PointsFull:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 22.48, _1080p * 389.48, _1080p * 26.52, _1080p * 46.52 )
	self:addElement( PointsFull )
	self.PointsFull = PointsFull
	
	local YesButton = nil
	
	YesButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	YesButton.id = "YesButton"
	YesButton.Text:setText( Engine.Localize( "LUA_MENU_YES" ), 0 )
	YesButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 431, _1080p * 167, _1080p * 210 )
	self:addElement( YesButton )
	self.YesButton = YesButton
	
	local NoButton = nil
	
	NoButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local1
	} )
	NoButton.id = "NoButton"
	NoButton.Text:setText( Engine.Localize( "LUA_MENU_NO" ), 0 )
	NoButton:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 431, _1080p * 210, _1080p * 253 )
	self:addElement( NoButton )
	self.NoButton = NoButton
	
	YesButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.RestoreMenu( "LoadoutSelect", true, f2_arg1.controller or f1_local1 )
	end )
	NoButton:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg1.controller or f1_local1
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f4_arg0, f4_arg1 )
		f4_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "LUA_MENU_BACK" ),
			button_ref = "button_secondary",
			side = "left",
			clickable = true
		} )
	end
	
	self:addEventHandler( "menu_create", self.addButtonHelperFunction )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self.bindButton:addEventHandler( "button_secondary", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg1.controller or f1_local1
		ACTIONS.LeaveMenu( self )
	end )
	return self
end

MenuBuilder.registerType( "MaxPointsPopup", MaxPointsPopup )
LockTable( _M )
