local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARAverageContainer( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 57 * _1080p, 0, 37 * _1080p )
	self.id = "AARAverageContainer"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Backer = nil
	
	Backer = LUI.UIImage.new()
	Backer.id = "Backer"
	Backer:setImage( RegisterMaterial( "aar_graphic_arrow" ), 0 )
	Backer:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 70, _1080p * -6.5, _1080p * 41.5 )
	self:addElement( Backer )
	self.Backer = Backer
	
	local AverageValue = nil
	
	AverageValue = LUI.UIText.new()
	AverageValue.id = "AverageValue"
	AverageValue:setText( "1.03", 0 )
	AverageValue:SetFontSize( 18 * _1080p )
	AverageValue:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AverageValue:SetAlignment( LUI.Alignment.Right )
	AverageValue:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 54, _1080p * 3.5, _1080p * 21.5 )
	self:addElement( AverageValue )
	self.AverageValue = AverageValue
	
	local AverageLabel = nil
	
	AverageLabel = LUI.UIText.new()
	AverageLabel.id = "AverageLabel"
	AverageLabel:SetAlpha( 0.5, 0 )
	AverageLabel:setText( Engine.Localize( "LUA_MENU_MP_AVG" ), 0 )
	AverageLabel:SetFontSize( 12 * _1080p )
	AverageLabel:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	AverageLabel:SetAlignment( LUI.Alignment.Right )
	AverageLabel:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 2, _1080p * 54, _1080p * 22.5, _1080p * 34.5 )
	self:addElement( AverageLabel )
	self.AverageLabel = AverageLabel
	
	return self
end

MenuBuilder.registerType( "AARAverageContainer", AARAverageContainer )
LockTable( _M )
