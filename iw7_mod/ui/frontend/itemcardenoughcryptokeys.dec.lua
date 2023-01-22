local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardEnoughCryptokeys( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 100 * _1080p )
	self.id = "ItemCardEnoughCryptokeys"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 4210752, 0 )
	Background:setImage( RegisterMaterial( "widg_gradient_bottom_to_top_opaque" ), 0 )
	self:addElement( Background )
	self.Background = Background
	
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
	
	local Overlay = nil
	
	Overlay = LUI.UIImage.new()
	Overlay.id = "Overlay"
	Overlay:SetRGBFromInt( 0, 0 )
	Overlay:SetAlpha( 0.4, 0 )
	Overlay:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	Overlay:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, _1080p * -10, 0 )
	self:addElement( Overlay )
	self.Overlay = Overlay
	
	local SupplyDrop = nil
	
	SupplyDrop = LUI.UIImage.new()
	SupplyDrop.id = "SupplyDrop"
	SupplyDrop:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	SupplyDrop:SubscribeToModelThroughElement( self, "image", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.image:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			SupplyDrop:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( SupplyDrop )
	self.SupplyDrop = SupplyDrop
	
	local EnoughKeys = nil
	
	EnoughKeys = LUI.UIText.new()
	EnoughKeys.id = "EnoughKeys"
	EnoughKeys:SetFontSize( 20 * _1080p )
	EnoughKeys:SetFont( FONTS.GetFont( FONTS.MainCondensed.File ) )
	EnoughKeys:SetAlignment( LUI.Alignment.Center )
	EnoughKeys:SetAnchorsAndPosition( 0, 0, 0.5, 0.5, _1080p * 5, _1080p * -5, _1080p * 40, _1080p * 60 )
	EnoughKeys:SubscribeToModelThroughElement( self, "text", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.text:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			EnoughKeys:setText( f3_local0, 0 )
		end
	end )
	self:addElement( EnoughKeys )
	self.EnoughKeys = EnoughKeys
	
	return self
end

MenuBuilder.registerType( "ItemCardEnoughCryptokeys", ItemCardEnoughCryptokeys )
LockTable( _M )
