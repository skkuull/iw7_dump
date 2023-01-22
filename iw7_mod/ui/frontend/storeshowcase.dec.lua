local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = #f1_arg0.StoreItemButtons
	for f1_local1 = 1, f1_local0, 1 do
		f1_arg0.StoreItemButtons[f1_local1].navigation = {}
	end
	if f1_arg1 > 1 then
		f1_arg0.StoreItemButton0.navigation.right = f1_arg0.StoreItemButton1
		f1_arg0.StoreItemButton1.navigation.left = f1_arg0.StoreItemButton0
	end
	if f1_arg1 > 2 then
		f1_arg0.StoreItemButton1.navigation.down = f1_arg0.StoreItemButton2
		f1_arg0.StoreItemButton2.navigation.up = f1_arg0.StoreItemButton1
		f1_arg0.StoreItemButton2.navigation.left = f1_arg0.StoreItemButton0
	end
	if f1_arg1 > 3 then
		f1_arg0.StoreItemButton0.navigation.down = f1_arg0.StoreItemButton3
		f1_arg0.StoreItemButton3.navigation.up = f1_arg0.StoreItemButton0
	end
	if f1_arg1 > 4 then
		f1_arg0.StoreItemButton3.navigation.right = f1_arg0.StoreItemButton4
		f1_arg0.StoreItemButton4.navigation.up = f1_arg0.StoreItemButton0
		f1_arg0.StoreItemButton4.navigation.left = f1_arg0.StoreItemButton3
	end
	if f1_arg1 > 5 then
		f1_arg0.StoreItemButton2.navigation.down = f1_arg0.StoreItemButton5
		f1_arg0.StoreItemButton5.navigation.up = f1_arg0.StoreItemButton2
		f1_arg0.StoreItemButton4.navigation.right = f1_arg0.StoreItemButton5
		f1_arg0.StoreItemButton5.navigation.left = f1_arg0.StoreItemButton4
	end
end

f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.StoreItemButtons[f2_arg1 + 1]
	assert( f2_local0 )
	f2_local0:processEvent( {
		name = "gain_focus"
	} )
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = #f3_arg0.StoreItemButtons
	local f3_local1 = f3_arg2:GetCountValue( f3_arg1 )
	if f3_local0 < f3_local1 then
		DebugPrint( "Warning: we're receiving " .. f3_local1 .. " items for a category, but we can only show " .. f3_local0 )
	end
	for f3_local2 = 0, f3_local0 - 1, 1 do
		if f3_local2 < f3_local1 then
			f3_arg0.StoreItemButtons[f3_local2 + 1]:SetDataSource( f3_arg2:GetDataSourceAtIndex( f3_local2, f3_arg1 ), f3_arg1 )
			f3_arg0.StoreItemButtons[f3_local2 + 1]:SetAlpha( 1, 0 )
			if Engine.IsPC() then
				f3_arg0.StoreItemButtons[f3_local2 + 1]:SetHandleMouse( true )
			end
		end
		f3_arg0.StoreItemButtons[f3_local2 + 1]:SetAlpha( 0, 0 )
		f3_arg0.StoreItemButtons[f3_local2 + 1]:SetHandleMouse( false )
	end
	f0_local0( f3_arg0, f3_local1 )
	if f3_local1 > 0 then
		f3_arg0.StoreItemDetails:SetDataSource( f3_arg0.StoreItemButtons[1]:GetDataSource( f3_arg1 ), f3_arg1 )
		f3_arg0.StoreItemDetails:SetAlpha( 1, 0 )
	else
		f3_arg0.StoreItemDetails:SetAlpha( 0, 0 )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg0.StoreItemButtons = {
		f4_arg0.StoreItemButton0,
		f4_arg0.StoreItemButton1,
		f4_arg0.StoreItemButton2,
		f4_arg0.StoreItemButton3,
		f4_arg0.StoreItemButton4,
		f4_arg0.StoreItemButton5
	}
	for f4_local0 = 1, #f4_arg0.StoreItemButtons, 1 do
		f4_arg0.StoreItemButtons[f4_local0]:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
			f4_arg0.StoreItemDetails:SetDataSource( f5_arg0:GetDataSource( f4_arg1 ), f4_arg1 )
		end )
	end
	f0_local0( f4_arg0, 0 )
	f4_arg0.UpdateStoreItemButtons = f0_local2
	f4_arg0.FocusItem = f0_local1
end

function StoreShowcase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1150 * _1080p, 0, 900 * _1080p )
	self.id = "StoreShowcase"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local StoreItemButton0 = nil
	
	StoreItemButton0 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton0.id = "StoreItemButton0"
	StoreItemButton0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 740, 0, _1080p * 420 )
	self:addElement( StoreItemButton0 )
	self.StoreItemButton0 = StoreItemButton0
	
	local StoreItemButton1 = nil
	
	StoreItemButton1 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton1.id = "StoreItemButton1"
	StoreItemButton1:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 756, _1080p * 1126, 0, _1080p * 206 )
	self:addElement( StoreItemButton1 )
	self.StoreItemButton1 = StoreItemButton1
	
	local StoreItemButton2 = nil
	
	StoreItemButton2 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton2.id = "StoreItemButton2"
	StoreItemButton2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 756, _1080p * 1126, _1080p * 214, _1080p * 420 )
	self:addElement( StoreItemButton2 )
	self.StoreItemButton2 = StoreItemButton2
	
	local StoreItemButton3 = nil
	
	StoreItemButton3 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton3.id = "StoreItemButton3"
	StoreItemButton3:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 367, _1080p * 428, _1080p * 634 )
	self:addElement( StoreItemButton3 )
	self.StoreItemButton3 = StoreItemButton3
	
	local StoreItemButton4 = nil
	
	StoreItemButton4 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton4.id = "StoreItemButton4"
	StoreItemButton4:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 373, _1080p * 740, _1080p * 428, _1080p * 634 )
	self:addElement( StoreItemButton4 )
	self.StoreItemButton4 = StoreItemButton4
	
	local StoreItemButton5 = nil
	
	StoreItemButton5 = MenuBuilder.BuildRegisteredType( "StoreBasicItemButton", {
		controllerIndex = f6_local1
	} )
	StoreItemButton5.id = "StoreItemButton5"
	StoreItemButton5:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 756, _1080p * 1126, _1080p * 428, _1080p * 634 )
	self:addElement( StoreItemButton5 )
	self.StoreItemButton5 = StoreItemButton5
	
	local StoreItemDetails = nil
	
	StoreItemDetails = MenuBuilder.BuildRegisteredType( "StoreItemDetails", {
		controllerIndex = f6_local1
	} )
	StoreItemDetails.id = "StoreItemDetails"
	StoreItemDetails:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, _1080p * 650, _1080p * 802 )
	self:addElement( StoreItemDetails )
	self.StoreItemDetails = StoreItemDetails
	
	f0_local3( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "StoreShowcase", StoreShowcase )
LockTable( _M )
