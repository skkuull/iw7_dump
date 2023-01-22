local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardCallingCard( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 138 * _1080p )
	self.id = "ItemCardCallingCard"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Blur = nil
	
	Blur = LUI.UIBlur.new()
	Blur.id = "Blur"
	Blur:SetRGBFromInt( 10066329, 0 )
	Blur:SetBlurStrength( 2.75, 0 )
	self:addElement( Blur )
	self.Blur = Blur
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -175, _1080p * 175, _1080p * -69, _1080p * 69 )
	Image:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local TabLeft = nil
	
	TabLeft = LUI.UIImage.new()
	TabLeft.id = "TabLeft"
	TabLeft:SetRGBFromInt( 0, 0 )
	TabLeft:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, _1080p * 16, _1080p * -44, _1080p * 44 )
	self:addElement( TabLeft )
	self.TabLeft = TabLeft
	
	local TabRight = nil
	
	TabRight = LUI.UIImage.new()
	TabRight.id = "TabRight"
	TabRight:SetRGBFromInt( 0, 0 )
	TabRight:SetZRotation( 180, 0 )
	TabRight:setImage( RegisterMaterial( "wdg_itemcard_tab" ), 0 )
	TabRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -16, 0, _1080p * -44, _1080p * 44 )
	self:addElement( TabRight )
	self.TabRight = TabRight
	
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
	
	return self
end

MenuBuilder.registerType( "ItemCardCallingCard", ItemCardCallingCard )
LockTable( _M )
