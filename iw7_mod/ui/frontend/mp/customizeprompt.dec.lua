local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CustomizePrompt( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 156 * _1080p, 0, 27 * _1080p )
	self.id = "CustomizePrompt"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local bg = nil
	
	bg = LUI.UIImage.new()
	bg.id = "bg"
	bg:SetRGBFromInt( 3882044, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local Icon = nil
	
	Icon = LUI.UIText.new()
	Icon.id = "Icon"
	Icon:setText( Engine.Localize( "LUA_MENU_PAD_ALT2_BUTTON" ), 0 )
	Icon:SetFontSize( 18 * _1080p )
	Icon:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	Icon:SetAlignment( LUI.Alignment.Right )
	Icon:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -49, _1080p * 36, _1080p * 9, _1080p * 27 )
	self:addElement( Icon )
	self.Icon = Icon
	
	local CustomizeLabel = nil
	
	CustomizeLabel = LUI.UIStyledText.new()
	CustomizeLabel.id = "CustomizeLabel"
	CustomizeLabel:setText( Engine.Localize( "MP_EMBLEM_EDITOR_CUSTOMIZE" ), 0 )
	CustomizeLabel:SetFontSize( 18 * _1080p )
	CustomizeLabel:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	CustomizeLabel:SetAlignment( LUI.Alignment.Left )
	CustomizeLabel:SetOptOutRightToLeftAlignmentFlip( true )
	CustomizeLabel:SetStartupDelay( 1000 )
	CustomizeLabel:SetLineHoldTime( 500 )
	CustomizeLabel:SetAnimMoveTime( 250 )
	CustomizeLabel:SetEndDelay( 1000 )
	CustomizeLabel:SetCrossfadeTime( 400 )
	CustomizeLabel:SetAutoScrollStyle( LUI.UIStyledText.AutoScrollStyle.ScrollH )
	CustomizeLabel:SetMaxVisibleLines( 1 )
	CustomizeLabel:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -112, _1080p * -6, _1080p * 9, _1080p * 27 )
	self:addElement( CustomizeLabel )
	self.CustomizeLabel = CustomizeLabel
	
	local HighlightShadow = nil
	
	HighlightShadow = LUI.UIImage.new()
	HighlightShadow.id = "HighlightShadow"
	HighlightShadow:SetRGBFromInt( 13398272, 0 )
	HighlightShadow:SetAlpha( 0.4, 0 )
	HighlightShadow:SetBlendMode( BLEND_MODE.blend )
	HighlightShadow:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 6 )
	self:addElement( HighlightShadow )
	self.HighlightShadow = HighlightShadow
	
	local HighlightLeft = nil
	
	HighlightLeft = LUI.UIImage.new()
	HighlightLeft.id = "HighlightLeft"
	HighlightLeft:SetRGBFromInt( 16767586, 0 )
	HighlightLeft:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 4 )
	self:addElement( HighlightLeft )
	self.HighlightLeft = HighlightLeft
	
	return self
end

MenuBuilder.registerType( "CustomizePrompt", CustomizePrompt )
LockTable( _M )
