local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.Image and f1_arg0.ChipBG, "WARNING: Item Card Big Image Items Are Missing..." )
	if f1_arg2.perkOverride then
		f1_arg0.Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -84, _1080p * 44 )
		f1_arg0.Image:SetScale( -0.25, 0 )
		f1_arg0.ChipBG:SetAlpha( 1, 0 )
	end
	if f1_arg2.scaleOverride then
		f1_arg0.Image:SetScale( f1_arg2.scaleOverride, 0 )
	end
end

function ItemCardBigImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardBigImage"
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
	
	local ChipBG = nil
	
	ChipBG = LUI.UIImage.new()
	ChipBG.id = "ChipBG"
	ChipBG:SetAlpha( 0, 0 )
	ChipBG:SetScale( -0.25, 0 )
	ChipBG:setImage( RegisterMaterial( "icon_perk_showcase_chip_backing" ), 0 )
	ChipBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -118, _1080p * 138, _1080p * -128, _1080p * 128 )
	self:addElement( ChipBG )
	self.ChipBG = ChipBG
	
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

MenuBuilder.registerType( "ItemCardBigImage", ItemCardBigImage )
LockTable( _M )
