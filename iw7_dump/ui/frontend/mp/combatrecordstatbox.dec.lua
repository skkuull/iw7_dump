local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CombatRecordStatBox( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 150 * _1080p )
	self.id = "CombatRecordStatBox"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ListBlurSubmenu = nil
	
	ListBlurSubmenu = LUI.UIBlur.new()
	ListBlurSubmenu.id = "ListBlurSubmenu"
	ListBlurSubmenu:SetRGBFromInt( 12566463, 0 )
	ListBlurSubmenu:SetBlurStrength( 2.75, 0 )
	self:addElement( ListBlurSubmenu )
	self.ListBlurSubmenu = ListBlurSubmenu
	
	local TitleBackground = nil
	
	TitleBackground = LUI.UIImage.new()
	TitleBackground.id = "TitleBackground"
	TitleBackground:SetRGBFromInt( 0, 0 )
	TitleBackground:SetAlpha( 0.4, 0 )
	TitleBackground:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 8, _1080p * -8, _1080p * 8, _1080p * 38 )
	self:addElement( TitleBackground )
	self.TitleBackground = TitleBackground
	
	local Stat = nil
	
	Stat = LUI.UIText.new()
	Stat.id = "Stat"
	Stat:setText( ToUpperCase( "" ), 0 )
	Stat:SetFontSize( 48 * _1080p )
	Stat:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Stat:SetAlignment( LUI.Alignment.Center )
	Stat:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 10, _1080p * -10, _1080p * -9, _1080p * 39 )
	self:addElement( Stat )
	self.Stat = Stat
	
	local StatTitle = nil
	
	StatTitle = LUI.UIStyledText.new()
	StatTitle.id = "StatTitle"
	StatTitle:setText( "", 0 )
	StatTitle:SetFontSize( 16 * _1080p )
	StatTitle:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	StatTitle:SetAlignment( LUI.Alignment.Left )
	StatTitle:SetStartupDelay( 1000 )
	StatTitle:SetLineHoldTime( 400 )
	StatTitle:SetAnimMoveTime( 150 )
	StatTitle:SetEndDelay( 1000 )
	StatTitle:SetCrossfadeTime( 400 )
	StatTitle:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	StatTitle:SetMaxVisibleLines( 1 )
	StatTitle:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 20, _1080p * -20, _1080p * 15, _1080p * 31 )
	self:addElement( StatTitle )
	self.StatTitle = StatTitle
	
	return self
end

MenuBuilder.registerType( "CombatRecordStatBox", CombatRecordStatBox )
LockTable( _M )
