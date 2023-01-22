local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.HighlightLeft )
	assert( f1_arg0.HighlightRight )
	if f1_arg1 == Teams.allies then
		f1_arg0.HighlightLeft:SetRGBFromInt( CODCASTER.GetTeam1Color( f1_arg2 ), 0 )
		f1_arg0.HighlightRight:SetRGBFromInt( CODCASTER.GetTeam2Color( f1_arg2 ), 0 )
	elseif f1_arg1 == Teams.axis then
		f1_arg0.HighlightRight:SetRGBFromInt( CODCASTER.GetTeam1Color( f1_arg2 ), 0 )
		f1_arg0.HighlightLeft:SetRGBFromInt( CODCASTER.GetTeam2Color( f1_arg2 ), 0 )
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.SetupTeamColor = f0_local0
end

function LoadoutDraftTeamBG( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1730 * _1080p, 0, 128 * _1080p )
	self.id = "LoadoutDraftTeamBG"
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BackgroundLeft = nil
	
	BackgroundLeft = LUI.UIImage.new()
	BackgroundLeft.id = "BackgroundLeft"
	BackgroundLeft:setImage( RegisterMaterial( "wdg_pnb_header" ), 0 )
	BackgroundLeft:SetUseAA( true )
	BackgroundLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -864, _1080p * -0.5, 0, _1080p * 128 )
	self:addElement( BackgroundLeft )
	self.BackgroundLeft = BackgroundLeft
	
	local BackgroundRight = nil
	
	BackgroundRight = LUI.UIImage.new()
	BackgroundRight.id = "BackgroundRight"
	BackgroundRight:setImage( RegisterMaterial( "wdg_pnb_header" ), 0 )
	BackgroundRight:SetUseAA( true )
	BackgroundRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 864, _1080p * -0.5, 0, _1080p * 128 )
	self:addElement( BackgroundRight )
	self.BackgroundRight = BackgroundRight
	
	local HighlightLeft = nil
	
	HighlightLeft = LUI.UIImage.new()
	HighlightLeft.id = "HighlightLeft"
	HighlightLeft:setImage( RegisterMaterial( "wdg_pnb_header_team_color" ), 0 )
	HighlightLeft:SetUseAA( true )
	HighlightLeft:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -876, _1080p * -367, _1080p * 63, _1080p * 129 )
	self:addElement( HighlightLeft )
	self.HighlightLeft = HighlightLeft
	
	local HighlightRight = nil
	
	HighlightRight = LUI.UIImage.new()
	HighlightRight.id = "HighlightRight"
	HighlightRight:setImage( RegisterMaterial( "wdg_pnb_header_team_color" ), 0 )
	HighlightRight:SetUseAA( true )
	HighlightRight:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * 876, _1080p * 367, _1080p * 63, _1080p * 129 )
	self:addElement( HighlightRight )
	self.HighlightRight = HighlightRight
	
	f0_local1( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "LoadoutDraftTeamBG", LoadoutDraftTeamBG )
LockTable( _M )
