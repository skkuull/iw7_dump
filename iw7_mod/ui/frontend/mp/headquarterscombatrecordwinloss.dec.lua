local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "wins" )
	local f1_local1 = Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Ranked, "losses" )
	f1_arg0.Wins:setText( f1_local0 )
	f1_arg0.Losses:setText( f1_local1 )
	local f1_local2 = f1_local0 + f1_local1
	if f1_local1 ~= 0 then
		local f1_local3 = f1_local1
	end
	f1_arg0.Ratio:setText( string.format( "%.2f", f1_local0 / (f1_local3 or 1) ) )
	if f1_local2 ~= 0 then
		local f1_local4 = f1_local2
	end
	f1_arg0.AARWinLossRatioBar.Wins:SetAnchors( 0, 1 - LUI.clamp( f1_local0 / (f1_local4 or 1), 0, 1 ), 0, 0 )
end

function HeadquartersCombatRecordWinLoss( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 284 * _1080p, 0, 38 * _1080p )
	self.id = "HeadquartersCombatRecordWinLoss"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local BlackBar = nil
	
	BlackBar = LUI.UIImage.new()
	BlackBar.id = "BlackBar"
	BlackBar:SetRGBFromInt( 0, 0 )
	self:addElement( BlackBar )
	self.BlackBar = BlackBar
	
	local AARWinLossRatioBar = nil
	
	AARWinLossRatioBar = MenuBuilder.BuildRegisteredType( "AARWinLossRatioBar", {
		controllerIndex = f2_local1
	} )
	AARWinLossRatioBar.id = "AARWinLossRatioBar"
	AARWinLossRatioBar.Wins:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	AARWinLossRatioBar:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * -14, _1080p * -4 )
	self:addElement( AARWinLossRatioBar )
	self.AARWinLossRatioBar = AARWinLossRatioBar
	
	local Wins = nil
	
	Wins = LUI.UIText.new()
	Wins.id = "Wins"
	Wins:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	Wins:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Wins:SetFontSize( 22 * _1080p )
	Wins:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Wins:SetAlignment( LUI.Alignment.Center )
	Wins:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3, _1080p * 87, _1080p * -24, _1080p * -2 )
	self:addElement( Wins )
	self.Wins = Wins
	
	local Ratio = nil
	
	Ratio = LUI.UIText.new()
	Ratio.id = "Ratio"
	Ratio:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Ratio:SetFontSize( 22 * _1080p )
	Ratio:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Ratio:SetAlignment( LUI.Alignment.Center )
	Ratio:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 90.5, _1080p * -90.5, _1080p * -24, _1080p * -2 )
	self:addElement( Ratio )
	self.Ratio = Ratio
	
	local Losses = nil
	
	Losses = LUI.UIText.new()
	Losses.id = "Losses"
	Losses:setText( Engine.Localize( "MENU_NEW" ), 0 )
	Losses:SetFontSize( 22 * _1080p )
	Losses:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	Losses:SetAlignment( LUI.Alignment.Center )
	Losses:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -87, _1080p * -3, _1080p * -24, _1080p * -2 )
	self:addElement( Losses )
	self.Losses = Losses
	
	local WinsLabel = nil
	
	WinsLabel = LUI.UIStyledText.new()
	WinsLabel.id = "WinsLabel"
	WinsLabel:setText( Engine.Localize( "LUA_MENU_WINS_CAPS" ), 0 )
	WinsLabel:SetFontSize( 12 * _1080p )
	WinsLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	WinsLabel:SetAlignment( LUI.Alignment.Center )
	WinsLabel:SetStartupDelay( 1000 )
	WinsLabel:SetLineHoldTime( 400 )
	WinsLabel:SetAnimMoveTime( 150 )
	WinsLabel:SetEndDelay( 1000 )
	WinsLabel:SetCrossfadeTime( 400 )
	WinsLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	WinsLabel:SetMaxVisibleLines( 1 )
	WinsLabel:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 3, _1080p * 87, _1080p * -36, _1080p * -24 )
	self:addElement( WinsLabel )
	self.WinsLabel = WinsLabel
	
	local LossesLabel = nil
	
	LossesLabel = LUI.UIStyledText.new()
	LossesLabel.id = "LossesLabel"
	LossesLabel:setText( Engine.Localize( "LUA_MENU_LOSSES_CAPS" ), 0 )
	LossesLabel:SetFontSize( 12 * _1080p )
	LossesLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	LossesLabel:SetAlignment( LUI.Alignment.Center )
	LossesLabel:SetStartupDelay( 1000 )
	LossesLabel:SetLineHoldTime( 400 )
	LossesLabel:SetAnimMoveTime( 150 )
	LossesLabel:SetEndDelay( 1000 )
	LossesLabel:SetCrossfadeTime( 400 )
	LossesLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	LossesLabel:SetMaxVisibleLines( 1 )
	LossesLabel:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -87, _1080p * -3, _1080p * -36, _1080p * -24 )
	self:addElement( LossesLabel )
	self.LossesLabel = LossesLabel
	
	local RatioLabel = nil
	
	RatioLabel = LUI.UIStyledText.new()
	RatioLabel.id = "RatioLabel"
	RatioLabel:setText( Engine.Localize( "LUA_MENU_RATIO_CAPS" ), 0 )
	RatioLabel:SetFontSize( 12 * _1080p )
	RatioLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	RatioLabel:SetAlignment( LUI.Alignment.Center )
	RatioLabel:SetStartupDelay( 1000 )
	RatioLabel:SetLineHoldTime( 400 )
	RatioLabel:SetAnimMoveTime( 150 )
	RatioLabel:SetEndDelay( 1000 )
	RatioLabel:SetCrossfadeTime( 400 )
	RatioLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	RatioLabel:SetMaxVisibleLines( 1 )
	RatioLabel:SetAnchorsAndPosition( 0, 0, 1, 0, _1080p * 90.5, _1080p * -90.5, _1080p * -36, _1080p * -24 )
	self:addElement( RatioLabel )
	self.RatioLabel = RatioLabel
	
	local RatioLine = nil
	
	RatioLine = LUI.UIImage.new()
	RatioLine.id = "RatioLine"
	RatioLine:SetRGBFromInt( 0, 0 )
	RatioLine:SetAlpha( 0.4, 0 )
	RatioLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, 0, _1080p * 1, _1080p * -14, _1080p * -4 )
	self:addElement( RatioLine )
	self.RatioLine = RatioLine
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "HeadquartersCombatRecordWinLoss", HeadquartersCombatRecordWinLoss )
LockTable( _M )
