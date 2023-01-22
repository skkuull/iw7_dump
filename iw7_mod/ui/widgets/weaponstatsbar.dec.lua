local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function WeaponStatsBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 20 * _1080p )
	self.id = "WeaponStatsBar"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ProgressBar = nil
	
	ProgressBar = MenuBuilder.BuildRegisteredType( "WeaponStatsProgressBar", {
		controllerIndex = f1_local1
	} )
	ProgressBar.id = "ProgressBar"
	ProgressBar:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 111, _1080p * -67, _1080p * -5, _1080p * 5 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local StatName = nil
	
	StatName = LUI.UIText.new()
	StatName.id = "StatName"
	StatName:SetAlpha( 0.5, 0 )
	StatName:setText( ToUpperCase( Engine.Localize( "MENU_STATS_CAPS" ) ), 0 )
	StatName:SetFontSize( 18 * _1080p )
	StatName:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	StatName:SetAlignment( LUI.Alignment.Left )
	StatName:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 100, _1080p * 1, _1080p * 19 )
	self:addElement( StatName )
	self.StatName = StatName
	
	local BaseValue = nil
	
	BaseValue = LUI.UIText.new()
	BaseValue.id = "BaseValue"
	BaseValue:SetAlpha( 0.5, 0 )
	BaseValue:setText( "999", 0 )
	BaseValue:SetFontSize( 19 * _1080p )
	BaseValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	BaseValue:SetAlignment( LUI.Alignment.Right )
	BaseValue:SetOptOutRightToLeftAlignmentFlip( true )
	BaseValue:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -63, _1080p * -33, 0, _1080p * 19 )
	self:addElement( BaseValue )
	self.BaseValue = BaseValue
	
	local AttachmentValue = nil
	
	AttachmentValue = LUI.UIText.new()
	AttachmentValue.id = "AttachmentValue"
	AttachmentValue:SetRGBFromInt( 14804029, 0 )
	AttachmentValue:setText( "999", 0 )
	AttachmentValue:SetFontSize( 19 * _1080p )
	AttachmentValue:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	AttachmentValue:SetAlignment( LUI.Alignment.Left )
	AttachmentValue:SetOptOutRightToLeftAlignmentFlip( true )
	AttachmentValue:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -30, 0, 0, _1080p * 19 )
	self:addElement( AttachmentValue )
	self.AttachmentValue = AttachmentValue
	
	return self
end

MenuBuilder.registerType( "WeaponStatsBar", WeaponStatsBar )
LockTable( _M )
