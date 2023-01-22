local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ItemCardDualImage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 315 * _1080p, 0, 145 * _1080p )
	self.id = "ItemCardDualImage"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 6645093, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = nil
	
	Border = LUI.UIBorder.new( {
		borderThicknessLeft = _1080p * 1,
		borderThicknessRight = _1080p * 1,
		borderThicknessTop = _1080p * 1,
		borderThicknessBottom = _1080p * 1
	} )
	Border.id = "Border"
	self:addElement( Border )
	self.Border = Border
	
	local BigImage = nil
	
	BigImage = LUI.UIImage.new()
	BigImage.id = "BigImage"
	BigImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 79, _1080p * -79, _1080p * 8.5, _1080p * -8.5 )
	BigImage:SubscribeToModelThroughElement( self, "imageA", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.imageA:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			BigImage:setImage( RegisterMaterial( f2_local0 ), 0 )
		end
	end )
	self:addElement( BigImage )
	self.BigImage = BigImage
	
	local SmallImage = nil
	
	SmallImage = LUI.UIImage.new()
	SmallImage.id = "SmallImage"
	SmallImage:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 189, _1080p * 272, _1080p * 101, _1080p * 159 )
	SmallImage:SubscribeToModelThroughElement( self, "imageB", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.imageB:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			SmallImage:setImage( RegisterMaterial( f3_local0 ), 0 )
		end
	end )
	self:addElement( SmallImage )
	self.SmallImage = SmallImage
	
	return self
end

MenuBuilder.registerType( "ItemCardDualImage", ItemCardDualImage )
LockTable( _M )
