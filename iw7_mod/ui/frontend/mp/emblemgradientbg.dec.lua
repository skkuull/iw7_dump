local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function EmblemGradientbg( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 72 * _1080p, 0, 256 * _1080p )
	self.id = "EmblemGradientbg"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local gradient = nil
	
	gradient = LUI.UIImage.new()
	gradient.id = "gradient"
	gradient:setImage( RegisterMaterial( "emblem_gradient_bg_left" ), 0 )
	gradient:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 21, _1080p * -5, _1080p * 251 )
	self:addElement( gradient )
	self.gradient = gradient
	
	local gradientCopy0 = nil
	
	gradientCopy0 = LUI.UIImage.new()
	gradientCopy0.id = "gradientCopy0"
	gradientCopy0:setImage( RegisterMaterial( "emblem_gradient_bg_center" ), 0 )
	gradientCopy0:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 21, _1080p * -19, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy0 )
	self.gradientCopy0 = gradientCopy0
	
	local gradientCopy1 = nil
	
	gradientCopy1 = LUI.UIImage.new()
	gradientCopy1.id = "gradientCopy1"
	gradientCopy1:setImage( RegisterMaterial( "emblem_gradient_bg_right" ), 0 )
	gradientCopy1:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -19, _1080p * 13, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy1 )
	self.gradientCopy1 = gradientCopy1
	
	local gradientCopy2 = nil
	
	gradientCopy2 = LUI.UIImage.new()
	gradientCopy2.id = "gradientCopy2"
	gradientCopy2:setImage( RegisterMaterial( "emblem_gradient_bg_left" ), 0 )
	gradientCopy2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 21, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy2 )
	self.gradientCopy2 = gradientCopy2
	
	local gradientCopy3 = nil
	
	gradientCopy3 = LUI.UIImage.new()
	gradientCopy3.id = "gradientCopy3"
	gradientCopy3:setImage( RegisterMaterial( "emblem_gradient_bg_center" ), 0 )
	gradientCopy3:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 21, _1080p * -19, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy3 )
	self.gradientCopy3 = gradientCopy3
	
	local gradientCopy4 = nil
	
	gradientCopy4 = LUI.UIImage.new()
	gradientCopy4.id = "gradientCopy4"
	gradientCopy4:setImage( RegisterMaterial( "emblem_gradient_bg_right" ), 0 )
	gradientCopy4:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -19, _1080p * 13, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy4 )
	self.gradientCopy4 = gradientCopy4
	
	local gradientCopy5 = nil
	
	gradientCopy5 = LUI.UIImage.new()
	gradientCopy5.id = "gradientCopy5"
	gradientCopy5:setImage( RegisterMaterial( "emblem_gradient_bg_left" ), 0 )
	gradientCopy5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 21, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy5 )
	self.gradientCopy5 = gradientCopy5
	
	local gradientCopy6 = nil
	
	gradientCopy6 = LUI.UIImage.new()
	gradientCopy6.id = "gradientCopy6"
	gradientCopy6:setImage( RegisterMaterial( "emblem_gradient_bg_center" ), 0 )
	gradientCopy6:SetAnchorsAndPosition( 0, 0, 0, 1, _1080p * 21, _1080p * -19, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy6 )
	self.gradientCopy6 = gradientCopy6
	
	local gradientCopy7 = nil
	
	gradientCopy7 = LUI.UIImage.new()
	gradientCopy7.id = "gradientCopy7"
	gradientCopy7:setImage( RegisterMaterial( "emblem_gradient_bg_right" ), 0 )
	gradientCopy7:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -19, _1080p * 13, _1080p * -5, _1080p * 251 )
	self:addElement( gradientCopy7 )
	self.gradientCopy7 = gradientCopy7
	
	return self
end

MenuBuilder.registerType( "EmblemGradientbg", EmblemGradientbg )
LockTable( _M )
