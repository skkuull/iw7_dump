local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Status )
	assert( f1_arg0.Type )
	assert( f1_arg0.Players )
	assert( f1_arg0.Map )
	assert( f1_arg0.Host )
	if IsLanguageOversizedFont() then
		f1_arg0.Status:SetTop( -11 * _1080p, 0 )
		f1_arg0.Status:SetBottom( 11 * _1080p, 0 )
		f1_arg0.Type:SetTop( -11 * _1080p, 0 )
		f1_arg0.Type:SetBottom( 11 * _1080p, 0 )
		f1_arg0.Players:SetTop( -11 * _1080p, 0 )
		f1_arg0.Players:SetBottom( 11 * _1080p, 0 )
		f1_arg0.Map:SetTop( -11 * _1080p, 0 )
		f1_arg0.Map:SetBottom( 11 * _1080p, 0 )
		f1_arg0.Host:SetTop( -11 * _1080p, 0 )
		f1_arg0.Host:SetBottom( 11 * _1080p, 0 )
	end
end

function SystemLinkJoinMenuTitleRow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1131 * _1080p, 0, 40 * _1080p )
	self.id = "SystemLinkJoinMenuTitleRow"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local TitleBG = nil
	
	TitleBG = LUI.UIImage.new()
	TitleBG.id = "TitleBG"
	TitleBG:SetRGBFromInt( 0, 0 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local Host = nil
	
	Host = LUI.UIText.new()
	Host.id = "Host"
	Host:setText( Engine.Localize( "MENU_HOST_NAME" ), 0 )
	Host:SetFontSize( 24 * _1080p )
	Host:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Host:SetAlignment( LUI.Alignment.Left )
	Host:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 9, _1080p * 275, _1080p * -12, _1080p * 12 )
	self:addElement( Host )
	self.Host = Host
	
	local Map = nil
	
	Map = LUI.UIText.new()
	Map.id = "Map"
	Map:setText( Engine.Localize( "MENU_MAP" ), 0 )
	Map:SetFontSize( 24 * _1080p )
	Map:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Map:SetAlignment( LUI.Alignment.Left )
	Map:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 627, _1080p * 853, _1080p * -12, _1080p * 12 )
	self:addElement( Map )
	self.Map = Map
	
	local Players = nil
	
	Players = LUI.UIText.new()
	Players.id = "Players"
	Players:setText( Engine.Localize( "MENU_NUMPLAYERS" ), 0 )
	Players:SetFontSize( 24 * _1080p )
	Players:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Players:SetAlignment( LUI.Alignment.Left )
	Players:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 283, _1080p * 418, _1080p * -12, _1080p * 12 )
	self:addElement( Players )
	self.Players = Players
	
	local Type = nil
	
	Type = LUI.UIText.new()
	Type.id = "Type"
	Type:setText( Engine.Localize( "MENU_TYPE1" ), 0 )
	Type:SetFontSize( 24 * _1080p )
	Type:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Type:SetAlignment( LUI.Alignment.Left )
	Type:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 862, _1080p * 1119, _1080p * -12, _1080p * 12 )
	self:addElement( Type )
	self.Type = Type
	
	local Status = nil
	
	Status = LUI.UIText.new()
	Status.id = "Status"
	Status:setText( Engine.Localize( "MENU_STATUS_NAME" ), 0 )
	Status:SetFontSize( 24 * _1080p )
	Status:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Status:SetAlignment( LUI.Alignment.Left )
	Status:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 426, _1080p * 620, _1080p * -12, _1080p * 12 )
	self:addElement( Status )
	self.Status = Status
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "SystemLinkJoinMenuTitleRow", SystemLinkJoinMenuTitleRow )
LockTable( _M )
