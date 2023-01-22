local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function NotEnoughMoneyForArmoryItem( menu, controller )
	local self = LUI.UIVerticalNavigator.new( {
		left = 0 * _1080p,
		right = 0 * _1080p,
		top = 0 * _1080p,
		bottom = 0 * _1080p,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	self.id = "NotEnoughMoneyForArmoryItem"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller or {}
	local f1_local2 = nil
	if Engine.InFrontend() then
		f1_local2 = f1_local1.controllerIndex
		if not f1_local2 then
			local f1_local3 = LUI.FlowManager.GetScopedData( self )
			assert( f1_local3 )
			f1_local2 = f1_local3.controllerIndex
		end
	else
		f1_local2 = self:getRootController()
	end
	self:playSound( "menu_open" )
	local f1_local3 = self
	local GenericPopup = nil
	
	GenericPopup = MenuBuilder.BuildRegisteredType( "GenericPopup", {
		controllerIndex = f1_local2
	} )
	GenericPopup.id = "GenericPopup"
	GenericPopup:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	GenericPopup:SetLeft( _1080p * -300, 0 )
	GenericPopup:SetRight( _1080p * 300, 0 )
	GenericPopup:SetTop( _1080p * -150, 0 )
	GenericPopup:SetBottom( _1080p * 150, 0 )
	self:addElement( GenericPopup )
	self.GenericPopup = GenericPopup
	
	local OKButton = nil
	
	OKButton = MenuBuilder.BuildRegisteredType( "GenericButton", {
		controllerIndex = f1_local2
	} )
	OKButton.id = "OKButton"
	OKButton:SetAnchors( 0, 0, 1, 0, 0 )
	OKButton:SetLeft( _1080p * 660, 0 )
	OKButton:SetRight( _1080p * -660, 0 )
	OKButton:SetTop( _1080p * -433, 0 )
	OKButton:SetBottom( _1080p * -390, 0 )
	OKButton.Text:setText( Engine.Localize( "MENU_OK" ), 0 )
	OKButton.Text:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	OKButton.Text:SetAlignment( LUI.Alignment.Left )
	self:addElement( OKButton )
	self.OKButton = OKButton
	
	local NotEnoughMoney = nil
	
	NotEnoughMoney = LUI.UIText.new()
	NotEnoughMoney.id = "NotEnoughMoney"
	NotEnoughMoney:SetAnchors( 0, 1, 0, 1, 0 )
	NotEnoughMoney:SetLeft( _1080p * 744.5, 0 )
	NotEnoughMoney:SetRight( _1080p * 1175.5, 0 )
	NotEnoughMoney:SetTop( _1080p * 458.5, 0 )
	NotEnoughMoney:SetBottom( _1080p * 478.5, 0 )
	NotEnoughMoney:setText( "You do not have enough kryptokeys to purchase this item.", 0 )
	NotEnoughMoney:SetFontSize( 20 * _1080p )
	NotEnoughMoney:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	NotEnoughMoney:SetAlignment( LUI.Alignment.Center )
	self:addElement( NotEnoughMoney )
	self.NotEnoughMoney = NotEnoughMoney
	
	OKButton:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg1.controller or controller
		ACTIONS.LeaveMenu( self )
	end )
	self.addButtonHelperFunction = function ( f3_arg0, f3_arg1 )
		f3_arg0:AddButtonHelperText( {
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
	
	self.bindButton:addEventHandler( "button_secondary", function ( f4_arg0, f4_arg1 )
		local f4_local0 = f4_arg1.controller or controller
		ACTIONS.LeaveMenu( self )
	end )
	return self
end

MenuBuilder.registerType( "NotEnoughMoneyForArmoryItem", NotEnoughMoneyForArmoryItem )
LockTable( _M )
