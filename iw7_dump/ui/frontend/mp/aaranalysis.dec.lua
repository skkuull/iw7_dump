local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AARAnalysis( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "AARAnalysis"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	self:playSound( "menu_open" )
	local f1_local2 = self
	local Temp = nil
	
	Temp = LUI.UIText.new()
	Temp.id = "Temp"
	Temp:setText( "Coming soon to a game near you!", 0 )
	Temp:SetFontSize( 50 * _1080p )
	Temp:SetFont( FONTS.GetFont( FONTS.Dev.File ) )
	Temp:SetAlignment( LUI.Alignment.Center )
	Temp:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, 0, 0, _1080p * -25, _1080p * 25 )
	self:addElement( Temp )
	self.Temp = Temp
	
	return self
end

MenuBuilder.registerType( "AARAnalysis", AARAnalysis )
LockTable( _M )
