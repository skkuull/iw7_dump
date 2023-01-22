local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function StreakGraph( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 280 * _1080p, 0, 530 * _1080p )
	self.id = "StreakGraph"
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ItemSlotOne = nil
	
	ItemSlotOne = MenuBuilder.BuildRegisteredType( "StreakGraphItem", {
		controllerIndex = f1_local1
	} )
	ItemSlotOne.id = "ItemSlotOne"
	ItemSlotOne:SetAnchors( 1, 0, 1, 0, 0 )
	ItemSlotOne:SetLeft( _1080p * -203, 0 )
	ItemSlotOne:SetRight( _1080p * -103, 0 )
	ItemSlotOne:SetTop( _1080p * -60, 0 )
	ItemSlotOne:SetDataSourceThroughElement( self, "itemOne" )
	ItemSlotOne:SubscribeToModelThroughElement( self, "itemOne.bottom", function ()
		local f2_local0 = self:GetDataSource()
		f2_local0 = f2_local0.itemOne.bottom:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			ItemSlotOne:SetBottom( _1080p * f2_local0, 0 )
		end
	end )
	self:addElement( ItemSlotOne )
	self.ItemSlotOne = ItemSlotOne
	
	local ItemSlotTwo = nil
	
	ItemSlotTwo = MenuBuilder.BuildRegisteredType( "StreakGraphItem", {
		controllerIndex = f1_local1
	} )
	ItemSlotTwo.id = "ItemSlotTwo"
	ItemSlotTwo:SetAnchors( 1, 0, 1, 0, 0 )
	ItemSlotTwo:SetLeft( _1080p * -203, 0 )
	ItemSlotTwo:SetRight( _1080p * -103, 0 )
	ItemSlotTwo:SetTop( _1080p * -60, 0 )
	ItemSlotTwo:SetDataSourceThroughElement( self, "itemTwo" )
	ItemSlotTwo:SubscribeToModelThroughElement( self, "itemTwo.bottom", function ()
		local f3_local0 = self:GetDataSource()
		f3_local0 = f3_local0.itemTwo.bottom:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			ItemSlotTwo:SetBottom( _1080p * f3_local0, 0 )
		end
	end )
	self:addElement( ItemSlotTwo )
	self.ItemSlotTwo = ItemSlotTwo
	
	local ItemSlotThree = nil
	
	ItemSlotThree = MenuBuilder.BuildRegisteredType( "StreakGraphItem", {
		controllerIndex = f1_local1
	} )
	ItemSlotThree.id = "ItemSlotThree"
	ItemSlotThree:SetAnchors( 1, 0, 1, 0, 0 )
	ItemSlotThree:SetLeft( _1080p * -203, 0 )
	ItemSlotThree:SetRight( _1080p * -103, 0 )
	ItemSlotThree:SetTop( _1080p * -60, 0 )
	ItemSlotThree:SetDataSourceThroughElement( self, "itemThree" )
	ItemSlotThree:SubscribeToModelThroughElement( self, "itemThree.bottom", function ()
		local f4_local0 = self:GetDataSource()
		f4_local0 = f4_local0.itemThree.bottom:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			ItemSlotThree:SetBottom( _1080p * f4_local0, 0 )
		end
	end )
	self:addElement( ItemSlotThree )
	self.ItemSlotThree = ItemSlotThree
	
	ItemSlotOne:SetDataSourceThroughElement( self, "itemOne" )
	ItemSlotTwo:SetDataSourceThroughElement( self, "itemTwo" )
	ItemSlotThree:SetDataSourceThroughElement( self, "itemThree" )
	return self
end

MenuBuilder.registerType( "StreakGraph", StreakGraph )
LockTable( _M )
