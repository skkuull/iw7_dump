local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	assert( f1_arg0.Image )
	assert( f1_arg0.Name )
	f1_arg0.Image:setImage( RegisterMaterial( Cac.GetStreakImage( f1_arg1 ) ) )
	f1_arg0.Name:setText( Engine.Localize( Cac.GetStreakName( f1_arg1 ) ) )
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupBaseStreak = f0_local0
end

function ArmoryBaseStreak( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 150 * _1080p, 0, 100 * _1080p )
	self.id = "ArmoryBaseStreak"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 36.5, _1080p * 109.5, _1080p * -78.5, _1080p * -8.5 )
	self:addElement( Image )
	self.Image = Image
	
	local Name = nil
	
	Name = LUI.UIStyledText.new()
	Name.id = "Name"
	Name:SetRGBFromInt( 15132390, 0 )
	Name:setText( "", 0 )
	Name:SetFontSize( 19 * _1080p )
	Name:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Name:SetAlignment( LUI.Alignment.Right )
	Name:SetStartupDelay( 2000 )
	Name:SetLineHoldTime( 400 )
	Name:SetAnimMoveTime( 300 )
	Name:SetEndDelay( 1500 )
	Name:SetCrossfadeTime( 750 )
	Name:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	Name:SetMaxVisibleLines( 1 )
	Name:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 0.5, _1080p * 145.5, _1080p * 2.5, _1080p * 21.5 )
	self:addElement( Name )
	self.Name = Name
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryBaseStreak", ArmoryBaseStreak )
LockTable( _M )
