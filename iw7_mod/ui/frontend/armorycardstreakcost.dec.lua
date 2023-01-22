local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ArmoryCardStreakCost( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 120 * _1080p )
	self.id = "ArmoryCardStreakCost"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 6710886, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Description = nil
	
	Description = LUI.UIStyledText.new()
	Description.id = "Description"
	Description:setText( LocalizeString( "" ), 0 )
	Description:SetFontSize( 20 * _1080p )
	Description:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	Description:SetAlignment( LUI.Alignment.Center )
	Description:SetStartupDelay( 1000 )
	Description:SetLineHoldTime( 1000 )
	Description:SetAnimMoveTime( 200 )
	Description:SetEndDelay( 1000 )
	Description:SetCrossfadeTime( 250 )
	Description:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollV )
	Description:SetMaxVisibleLines( 6 )
	Description:SetDecodeUseSystemTime( false )
	Description:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -10, _1080p * 10 )
	self:addElement( Description )
	self.Description = Description
	
	return self
end

MenuBuilder.registerType( "ArmoryCardStreakCost", ArmoryCardStreakCost )
LockTable( _M )
