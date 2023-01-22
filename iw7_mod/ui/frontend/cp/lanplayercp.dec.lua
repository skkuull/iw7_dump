local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LANPlayerCP( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 105 * _1080p )
	self.id = "LANPlayerCP"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 0, 0 )
	Background:SetAlpha( 0.6, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local FAFCard5Image = nil
	
	FAFCard5Image = LUI.UIImage.new()
	FAFCard5Image.id = "FAFCard5Image"
	FAFCard5Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 338.69, _1080p * 409.69, _1080p * 29, _1080p * 100 )
	FAFCard5Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot5Icon", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.zombiesConsumables.cardSlot5Icon:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			FAFCard5Image:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard5Image )
	self.FAFCard5Image = FAFCard5Image
	
	local FAFCard4Image = nil
	
	FAFCard4Image = LUI.UIImage.new()
	FAFCard4Image.id = "FAFCard4Image"
	FAFCard4Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256.69, _1080p * 327.69, _1080p * 29, _1080p * 100 )
	FAFCard4Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot4Icon", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.zombiesConsumables.cardSlot4Icon:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			FAFCard4Image:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard4Image )
	self.FAFCard4Image = FAFCard4Image
	
	local FAFCard3Image = nil
	
	FAFCard3Image = LUI.UIImage.new()
	FAFCard3Image.id = "FAFCard3Image"
	FAFCard3Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 175.19, _1080p * 246.19, _1080p * 29, _1080p * 100 )
	FAFCard3Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot3Icon", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.zombiesConsumables.cardSlot3Icon:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			FAFCard3Image:setImage( RegisterMaterial( f4_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard3Image )
	self.FAFCard3Image = FAFCard3Image
	
	local FAFCard2Image = nil
	
	FAFCard2Image = LUI.UIImage.new()
	FAFCard2Image.id = "FAFCard2Image"
	FAFCard2Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 93.19, _1080p * 164.19, _1080p * 29, _1080p * 100 )
	FAFCard2Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot2Icon", function ()
		local f5_local0 = self:GetDataSource()
		f5_local0 = f5_local0.zombiesConsumables.cardSlot2Icon:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			FAFCard2Image:setImage( RegisterMaterial( f5_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard2Image )
	self.FAFCard2Image = FAFCard2Image
	
	local FAFCard1Image = nil
	
	FAFCard1Image = LUI.UIImage.new()
	FAFCard1Image.id = "FAFCard1Image"
	FAFCard1Image:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.19, _1080p * 83.19, _1080p * 29, _1080p * 100 )
	FAFCard1Image:SubscribeToModelThroughElement( self, "zombiesConsumables.cardSlot1Icon", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.zombiesConsumables.cardSlot1Icon:GetValue( f1_local1 )
		if f6_local0 ~= nil then
			FAFCard1Image:setImage( RegisterMaterial( f6_local0 ), 0 )
		end
	end )
	self:addElement( FAFCard1Image )
	self.FAFCard1Image = FAFCard1Image
	
	local FullName = nil
	
	FullName = LUI.UIStyledText.new()
	FullName.id = "FullName"
	FullName:SetFontSize( 20 * _1080p )
	FullName:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	FullName:SetAlignment( LUI.Alignment.Left )
	FullName:SetShadowMinDistance( -0.2, 0 )
	FullName:SetShadowMaxDistance( 0.2, 0 )
	FullName:SetShadowRGBFromInt( 0, 0 )
	FullName:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 12.19, _1080p * 305.19, _1080p * 4, _1080p * 24 )
	FullName:SubscribeToModelThroughElement( self, "fullName", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.fullName:GetValue( f1_local1 )
		if f7_local0 ~= nil then
			FullName:setText( f7_local0, 0 )
		end
	end )
	self:addElement( FullName )
	self.FullName = FullName
	
	return self
end

MenuBuilder.registerType( "LANPlayerCP", LANPlayerCP )
LockTable( _M )
