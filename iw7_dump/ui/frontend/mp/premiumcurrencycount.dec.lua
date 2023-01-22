local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.CODPointsValue )
	f1_arg0.CODPointsValue:SetShadowUOffset( -0 )
	f1_arg0.CODPointsValue:SetShadowVOffset( -0 )
end

function PremiumCurrencyCount( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 36 * _1080p )
	self.id = "PremiumCurrencyCount"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local CODPointsIcon = nil
	
	CODPointsIcon = LUI.UIImage.new()
	CODPointsIcon.id = "CODPointsIcon"
	CODPointsIcon:setImage( RegisterMaterial( "currency_cod_points_icon" ), 0 )
	CODPointsIcon:SetAnchorsAndPosition( 0, 1, 0, 0, 0, _1080p * 36, 0, 0 )
	self:addElement( CODPointsIcon )
	self.CODPointsIcon = CODPointsIcon
	
	local CODPointsValue = nil
	
	CODPointsValue = LUI.UIStyledText.new()
	CODPointsValue.id = "CODPointsValue"
	CODPointsValue:setText( "0000", 0 )
	CODPointsValue:SetFontSize( 24 * _1080p )
	CODPointsValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CODPointsValue:SetAlignment( LUI.Alignment.Left )
	CODPointsValue:SetOptOutRightToLeftAlignmentFlip( true )
	CODPointsValue:SetStartupDelay( 1250 )
	CODPointsValue:SetLineHoldTime( 400 )
	CODPointsValue:SetAnimMoveTime( 300 )
	CODPointsValue:SetEndDelay( 1000 )
	CODPointsValue:SetCrossfadeTime( 500 )
	CODPointsValue:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CODPointsValue:SetMaxVisibleLines( 1 )
	CODPointsValue:SetShadowMinDistance( -0.2, 0 )
	CODPointsValue:SetShadowMaxDistance( 0.2, 0 )
	CODPointsValue:SetShadowRGBFromInt( 0, 0 )
	CODPointsValue:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 42, 0, _1080p * -12, _1080p * 12 )
	self:addElement( CODPointsValue )
	self.CODPointsValue = CODPointsValue
	
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "PremiumCurrencyCount", PremiumCurrencyCount )
LockTable( _M )
