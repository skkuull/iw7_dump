local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Image and f1_arg0.Mask )
	f1_arg0.Image:SetMask( f1_arg0.Mask )
end

function ItemCardMaskedBigImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardMaskedBigImage"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 10066329, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local ShadowTop = nil
	
	ShadowTop = LUI.UIImage.new()
	ShadowTop.id = "ShadowTop"
	ShadowTop:SetRGBFromInt( 0, 0 )
	ShadowTop:SetAlpha( 0.5, 0 )
	ShadowTop:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	ShadowTop:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 10 )
	self:addElement( ShadowTop )
	self.ShadowTop = ShadowTop
	
	local ShadowBottom = nil
	
	ShadowBottom = LUI.UIImage.new()
	ShadowBottom.id = "ShadowBottom"
	ShadowBottom:SetRGBFromInt( 0, 0 )
	ShadowBottom:SetAlpha( 0.5, 0 )
	ShadowBottom:setImage( RegisterMaterial( "widg_gradient_bottom_to_top" ), 0 )
	ShadowBottom:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -10, 0 )
	self:addElement( ShadowBottom )
	self.ShadowBottom = ShadowBottom
	
	local TabLeft = nil
	
	TabLeft = LUI.UIImage.new()
	TabLeft.id = "TabLeft"
	TabLeft:SetRGBFromInt( 0, 0 )
	TabLeft:SetAlpha( 0.6, 0 )
	TabLeft:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 16, _1080p * -44, _1080p * 44 )
	self:addElement( TabLeft )
	self.TabLeft = TabLeft
	
	local TabRight = nil
	
	TabRight = LUI.UIImage.new()
	TabRight.id = "TabRight"
	TabRight:SetRGBFromInt( 0, 0 )
	TabRight:SetAlpha( 0.6, 0 )
	TabRight:SetZRotation( 180, 0 )
	TabRight:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, 0, _1080p * -44, _1080p * 44 )
	self:addElement( TabRight )
	self.TabRight = TabRight
	
	local Frame = nil
	
	Frame = LUI.UIImage.new()
	Frame.id = "Frame"
	Frame:setImage( RegisterMaterial( "splash_hex_backing" ), 0 )
	Frame:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Frame )
	self.Frame = Frame
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "splash_hex_backing_alpha_feather" ), 0 )
	Mask:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.image:GetValue( f2_local1 )
		if f3_local0 ~= nil then
			Image:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ItemCardMaskedBigImage", ItemCardMaskedBigImage )
LockTable( _M )
