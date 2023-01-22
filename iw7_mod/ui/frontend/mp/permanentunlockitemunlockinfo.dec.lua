local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PermanentUnlockItemUnlockInfo( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 32 * _1080p )
	self.id = "PermanentUnlockItemUnlockInfo"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local UnlockIcon = nil
	
	UnlockIcon = LUI.UIImage.new()
	UnlockIcon.id = "UnlockIcon"
	UnlockIcon:SetRGBFromInt( 16711680, 0 )
	UnlockIcon:setImage( RegisterMaterial( "hud_icon_warning" ), 0 )
	UnlockIcon:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 32, _1080p * -16, _1080p * 16 )
	self:addElement( UnlockIcon )
	self.UnlockIcon = UnlockIcon
	
	local UnlockDesc = nil
	
	UnlockDesc = LUI.UIText.new()
	UnlockDesc.id = "UnlockDesc"
	UnlockDesc:setText( "", 0 )
	UnlockDesc:SetFontSize( 18 * _1080p )
	UnlockDesc:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	UnlockDesc:SetAlignment( LUI.Alignment.Left )
	UnlockDesc:SetOptOutRightToLeftAlignmentFlip( true )
	UnlockDesc:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 34, _1080p * 500, _1080p * -9, _1080p * 9 )
	self:addElement( UnlockDesc )
	self.UnlockDesc = UnlockDesc
	
	return self
end

MenuBuilder.registerType( "PermanentUnlockItemUnlockInfo", PermanentUnlockItemUnlockInfo )
LockTable( _M )
