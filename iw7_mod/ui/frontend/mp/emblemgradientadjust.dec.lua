local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemGradientAdjust( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 480 * _1080p, 0, 234 * _1080p )
	self.id = "EmblemGradientAdjust"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local GradientSlider = nil
	
	GradientSlider = MenuBuilder.BuildRegisteredType( "ColorMixerColorSlider", {
		controllerIndex = f1_local1
	} )
	GradientSlider.id = "GradientSlider"
	GradientSlider:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 26.5, _1080p * 426.5, _1080p * 151.02, _1080p * 196.02 )
	self:addElement( GradientSlider )
	self.GradientSlider = GradientSlider
	
	local EmblemGradientColorButton1 = nil
	
	EmblemGradientColorButton1 = MenuBuilder.BuildRegisteredType( "EmblemGradientColorButton", {
		controllerIndex = f1_local1
	} )
	EmblemGradientColorButton1.id = "EmblemGradientColorButton1"
	EmblemGradientColorButton1.colorName:setText( "COLOR 1", 0 )
	EmblemGradientColorButton1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 365, _1080p * 92.05, _1080p * 128 )
	self:addElement( EmblemGradientColorButton1 )
	self.EmblemGradientColorButton1 = EmblemGradientColorButton1
	
	local EmblemGradientColorButton0 = nil
	
	EmblemGradientColorButton0 = MenuBuilder.BuildRegisteredType( "EmblemGradientColorButton", {
		controllerIndex = f1_local1
	} )
	EmblemGradientColorButton0.id = "EmblemGradientColorButton0"
	EmblemGradientColorButton0.colorName:setText( "COLOR 0", 0 )
	EmblemGradientColorButton0:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 115, _1080p * 365, _1080p * 37.05, _1080p * 69.05 )
	self:addElement( EmblemGradientColorButton0 )
	self.EmblemGradientColorButton0 = EmblemGradientColorButton0
	
	GradientSlider.navigation = {
		up = EmblemGradientColorButton1
	}
	EmblemGradientColorButton1.navigation = {
		up = EmblemGradientColorButton0,
		down = GradientSlider
	}
	EmblemGradientColorButton0.navigation = {
		down = EmblemGradientColorButton1
	}
	return self
end

MenuBuilder.registerType( "EmblemGradientAdjust", EmblemGradientAdjust )
LockTable( _M )
