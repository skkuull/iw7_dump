local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	
end

function ItemCardWeaponStatsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 15 * _1080p )
	self.id = "ItemCardWeaponStatsBar"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "WeaponStatsProgressBar", {
		controllerIndex = f2_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 72, _1080p * -55, _1080p * -5, _1080p * 5 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local StatName = nil
	
	StatName = LUI.UIStyledText.new()
	StatName.id = "StatName"
	StatName:setText( ToUpperCase( Engine.Localize( "MENU_STATS_CAPS" ) ), 0 )
	StatName:SetFontSize( 14 * _1080p )
	StatName:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	StatName:SetAlignment( LUI.Alignment.Left )
	StatName:SetStartupDelay( 1000 )
	StatName:SetLineHoldTime( 500 )
	StatName:SetAnimMoveTime( 500 )
	StatName:SetEndDelay( 1000 )
	StatName:SetCrossfadeTime( 500 )
	StatName:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	StatName:SetMaxVisibleLines( 1 )
	StatName:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 69, _1080p * -7, _1080p * 7 )
	self:addElement( StatName )
	self.StatName = StatName
	
	local BaseValue = nil
	
	BaseValue = LUI.UIText.new()
	BaseValue.id = "BaseValue"
	BaseValue:setText( "999", 0 )
	BaseValue:SetFontSize( 14 * _1080p )
	BaseValue:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	BaseValue:SetAlignment( LUI.Alignment.Left )
	BaseValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -50, _1080p * -25, _1080p * -7, _1080p * 7 )
	self:addElement( BaseValue )
	self.BaseValue = BaseValue
	
	local AttachmentValue = nil
	
	AttachmentValue = LUI.UIText.new()
	AttachmentValue.id = "AttachmentValue"
	AttachmentValue:SetRGBFromInt( 65280, 0 )
	AttachmentValue:setText( "999", 0 )
	AttachmentValue:SetFontSize( 14 * _1080p )
	AttachmentValue:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	AttachmentValue:SetAlignment( LUI.Alignment.Right )
	AttachmentValue:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -24, 0, _1080p * -7, _1080p * 7 )
	self:addElement( AttachmentValue )
	self.AttachmentValue = AttachmentValue
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ItemCardWeaponStatsBar", ItemCardWeaponStatsBar )
LockTable( _M )
