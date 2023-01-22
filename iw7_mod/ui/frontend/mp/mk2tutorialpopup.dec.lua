local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.MK2Pattern:processEvent( {
		name = "mk2_wide_pattern"
	} )
	f1_arg0.MK2Pattern.PatternAlt:SetAlpha( 0, 0 )
	f1_arg0.MK2Pattern.Gradient:SetAlpha( 0, 0 )
	f1_arg0.BodyText:setText( Engine.LocalizeLong( "LUA_MENU_MP_MKII_HELP_POPUP_DESC" ), 0 )
end

function Mk2TutorialPopup( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "Mk2TutorialPopup"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	self:playSound( "menu_open" )
	local f2_local2 = self
	local PopupFrame = nil
	
	PopupFrame = MenuBuilder.BuildRegisteredType( "PopupFrame", {
		controllerIndex = f2_local1
	} )
	PopupFrame.id = "PopupFrame"
	PopupFrame.Title:setText( Engine.Localize( "LUA_MENU_MP_MK2_WELCOME" ), 0 )
	PopupFrame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -450, _1080p * 450, _1080p * -330, _1080p * 330 )
	self:addElement( PopupFrame )
	self.PopupFrame = PopupFrame
	
	local ButtonHelperBar = nil
	
	ButtonHelperBar = MenuBuilder.BuildRegisteredType( "ButtonHelperBar", {
		controllerIndex = f2_local1
	} )
	ButtonHelperBar.id = "ButtonHelperBar"
	ButtonHelperBar:SetRGBFromTable( SWATCHES.HUD.normal, 0 )
	ButtonHelperBar:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -460, _1080p * 460, _1080p * 340, _1080p * 390 )
	self:addElement( ButtonHelperBar )
	self.ButtonHelperBar = ButtonHelperBar
	
	local MK2Pattern = nil
	
	MK2Pattern = MenuBuilder.BuildRegisteredType( "MK2Pattern", {
		controllerIndex = f2_local1
	} )
	MK2Pattern.id = "MK2Pattern"
	MK2Pattern:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -459, _1080p * 459, _1080p * -339, _1080p * -230 )
	self:addElement( MK2Pattern )
	self.MK2Pattern = MK2Pattern
	
	local MK2Logo = nil
	
	MK2Logo = LUI.UIImage.new()
	MK2Logo.id = "MK2Logo"
	MK2Logo:setImage( RegisterMaterial( "icon_inventory_mk2" ), 0 )
	MK2Logo:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 832, _1080p * 1088, _1080p * 183, _1080p * 311 )
	self:addElement( MK2Logo )
	self.MK2Logo = MK2Logo
	
	local BodyText = nil
	
	BodyText = LUI.UIText.new()
	BodyText.id = "BodyText"
	BodyText:setText( Engine.Localize( "LUA_MENU_MP_MKII_HELP_POPUP_DESC" ), 0 )
	BodyText:SetFontSize( 22 * _1080p )
	BodyText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BodyText:setTextStyle( CoD.TextStyle.ShadowedMore )
	BodyText:SetAlignment( LUI.Alignment.Center )
	BodyText:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -417, _1080p * 417, _1080p * -217, _1080p * -195 )
	self:addElement( BodyText )
	self.BodyText = BodyText
	
	local CommonHighlight = nil
	
	CommonHighlight = LUI.UIImage.new()
	CommonHighlight.id = "CommonHighlight"
	CommonHighlight:SetRGBFromTable( SWATCHES.itemRarity.quality0, 0 )
	CommonHighlight:SetAlpha( 0.8, 0 )
	CommonHighlight:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	CommonHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -320, _1080p * -33, _1080p * 4, _1080p * 154 )
	self:addElement( CommonHighlight )
	self.CommonHighlight = CommonHighlight
	
	local CommonWeapon = nil
	CommonWeapon = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f2_local1
	} )
	CommonWeapon.id = "CommonWeapon"
	CommonWeapon.Image:SetLeft( _1080p * -128, 0 )
	CommonWeapon.Image:SetRight( _1080p * 128, 0 )
	CommonWeapon.Image:SetTop( _1080p * -132, 0 )
	CommonWeapon.Image:SetBottom( _1080p * -4, 0 )
	CommonWeapon.Image:setImage( RegisterMaterial( "render_weapon_slot_m4_mp_common_mkii" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		CommonWeapon.Level:setText( "Level: 3", 0 )
	end
	CommonWeapon.Name:setText( Engine.Localize( "LOOT_MP_QUALITY_1" ), 0 )
	CommonWeapon.Name:SetAlignment( LUI.Alignment.Left )
	CommonWeapon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -320, _1080p * -33, _1080p * 4, _1080p * 154 )
	self:addElement( CommonWeapon )
	self.CommonWeapon = CommonWeapon
	
	local RareHighlight = nil
	
	RareHighlight = LUI.UIImage.new()
	RareHighlight.id = "RareHighlight"
	RareHighlight:SetRGBFromTable( SWATCHES.itemRarity.quality1, 0 )
	RareHighlight:SetAlpha( 0.8, 0 )
	RareHighlight:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	RareHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -320, _1080p * -33, _1080p * 166, _1080p * 316 )
	self:addElement( RareHighlight )
	self.RareHighlight = RareHighlight
	
	local RareWeapon = nil
	RareWeapon = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f2_local1
	} )
	RareWeapon.id = "RareWeapon"
	RareWeapon.Image:SetLeft( _1080p * -128, 0 )
	RareWeapon.Image:SetRight( _1080p * 128, 0 )
	RareWeapon.Image:SetTop( _1080p * -132, 0 )
	RareWeapon.Image:SetBottom( _1080p * -4, 0 )
	RareWeapon.Image:setImage( RegisterMaterial( "render_weapon_slot_ar57_mp_rare_mkii" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		RareWeapon.Level:setText( "Level: 3", 0 )
	end
	RareWeapon.Name:setText( Engine.Localize( "LOOT_MP_QUALITY_2" ), 0 )
	RareWeapon.Name:SetAlignment( LUI.Alignment.Left )
	RareWeapon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -320, _1080p * -33, _1080p * 166, _1080p * 316 )
	self:addElement( RareWeapon )
	self.RareWeapon = RareWeapon
	
	local LegendaryHighlight = nil
	
	LegendaryHighlight = LUI.UIImage.new()
	LegendaryHighlight.id = "LegendaryHighlight"
	LegendaryHighlight:SetRGBFromTable( SWATCHES.itemRarity.quality2, 0 )
	LegendaryHighlight:SetAlpha( 0.8, 0 )
	LegendaryHighlight:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	LegendaryHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 33, _1080p * 320, _1080p * 4, _1080p * 154 )
	self:addElement( LegendaryHighlight )
	self.LegendaryHighlight = LegendaryHighlight
	
	local LegendaryWeapon = nil
	LegendaryWeapon = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f2_local1
	} )
	LegendaryWeapon.id = "LegendaryWeapon"
	LegendaryWeapon.Image:SetLeft( _1080p * -128, 0 )
	LegendaryWeapon.Image:SetRight( _1080p * 128, 0 )
	LegendaryWeapon.Image:SetTop( _1080p * -132, 0 )
	LegendaryWeapon.Image:SetBottom( _1080p * -4, 0 )
	LegendaryWeapon.Image:setImage( RegisterMaterial( "render_weapon_slot_sonic_mpr_legendary_mkii" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		LegendaryWeapon.Level:setText( "Level: 3", 0 )
	end
	LegendaryWeapon.Name:setText( Engine.Localize( "LOOT_MP_QUALITY_3" ), 0 )
	LegendaryWeapon.Name:SetAlignment( LUI.Alignment.Left )
	LegendaryWeapon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 33, _1080p * 320, _1080p * 4, _1080p * 154 )
	self:addElement( LegendaryWeapon )
	self.LegendaryWeapon = LegendaryWeapon
	
	local EpicHighlight = nil
	
	EpicHighlight = LUI.UIImage.new()
	EpicHighlight.id = "EpicHighlight"
	EpicHighlight:SetRGBFromTable( SWATCHES.itemRarity.quality3, 0 )
	EpicHighlight:SetAlpha( 0.8, 0 )
	EpicHighlight:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	EpicHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 33, _1080p * 320, _1080p * 166, _1080p * 316 )
	self:addElement( EpicHighlight )
	self.EpicHighlight = EpicHighlight
	
	local EpicWeapon = nil
	EpicWeapon = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f2_local1
	} )
	EpicWeapon.id = "EpicWeapon"
	EpicWeapon.Image:SetLeft( _1080p * -128, 0 )
	EpicWeapon.Image:SetRight( _1080p * 128, 0 )
	EpicWeapon.Image:SetTop( _1080p * -132, 0 )
	EpicWeapon.Image:SetBottom( _1080p * -4, 0 )
	EpicWeapon.Image:setImage( RegisterMaterial( "render_weapon_slot_kbs_mpl_mkii" ), 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		EpicWeapon.Level:setText( "Level: 3", 0 )
	end
	EpicWeapon.Name:setText( Engine.Localize( "LOOT_MP_QUALITY_4" ), 0 )
	EpicWeapon.Name:SetAlignment( LUI.Alignment.Left )
	EpicWeapon:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 33, _1080p * 320, _1080p * 166, _1080p * 316 )
	self:addElement( EpicWeapon )
	self.EpicWeapon = EpicWeapon
	
	self.addButtonHelperFunction = function ( f3_arg0, f3_arg1 )
		f3_arg0:AddButtonHelperText( {
			helper_text = Engine.Localize( "MENU_BACK" ),
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
		local f4_local0 = f4_arg1.controller or f2_local1
		ACTIONS.LeaveMenu( self )
	end )
	PostLoadFunc( self, f2_local1, controller )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "MK2Pattern",
		sequenceName = "DefaultSequence",
		elementPath = "MK2Pattern"
	} )
	return self
end

MenuBuilder.registerType( "Mk2TutorialPopup", Mk2TutorialPopup )
LockTable( _M )
