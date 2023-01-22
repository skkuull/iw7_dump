local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.NewText, "WARNING: Latest Item Notification Items Are Missing..." )
	local f1_local0 = f1_arg0.NewText
	f1_local0:SetShadowMinDistance( -0.2, 0 )
	f1_local0:SetShadowMaxDistance( 0.2, 0 )
	f1_local0:SetShadowRGBFromInt( 0, 0 )
	f1_local0:SetShadowUOffset( -0 )
	f1_local0:SetShadowVOffset( -0 )
end

function LatestItemNotification( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 64 * _1080p )
	self.id = "LatestItemNotification"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:setImage( RegisterMaterial( "loot_latest_icon_1" ), 0 )
	Backer:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -1, _1080p * -1 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local NewText = nil
	
	NewText = LUI.UIStyledText.new()
	NewText.id = "NewText"
	NewText:setText( ToUpperCase( Engine.Localize( "LUA_MENU_MP_LATEST" ) ), 0 )
	NewText:SetFontSize( 22 * _1080p )
	NewText:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	NewText:SetAlignment( LUI.Alignment.Center )
	NewText:SetShadowRGBFromInt( 0, 0 )
	NewText:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -11, _1080p * 11 )
	self:addElement( NewText )
	self.NewText = NewText
	
	return self
end

MenuBuilder.registerType( "LatestItemNotification", LatestItemNotification )
LockTable( _M )
