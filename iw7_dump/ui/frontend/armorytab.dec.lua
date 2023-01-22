local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.NewItemNotification )
	f1_arg0:SubscribeToDataSourceThroughElement( f1_arg0, nil, function ()
		local f2_local0 = f1_arg0:GetDataSource()
		if f2_local0.isSupplyDropsTab and Engine.GetPlayerDataEx( f1_arg1, CoD.StatsGroup.Common, "newCrateRewards" ) then
			f1_arg0.NewItemNotification:SetAlpha( 1, 0 )
		else
			f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
		end
	end )
	f1_arg0:addEventHandler( "remove_supply_drops_new_notification", function ( f3_arg0, f3_arg1 )
		f1_arg0.NewItemNotification:SetAlpha( 0, 0 )
	end )
	f1_arg0:addEventHandler( "focus_tab", function ( f4_arg0, f4_arg1 )
		f1_arg0.SubMenuTab.index = f1_arg0.index
	end )
end

function ArmoryTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 30 * _1080p )
	self.id = "ArmoryTab"
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	local SubMenuTab = nil
	
	SubMenuTab = MenuBuilder.BuildRegisteredType( "SubMenuTab", {
		controllerIndex = f5_local1
	} )
	SubMenuTab.id = "SubMenuTab"
	SubMenuTab:SetDataSourceThroughElement( self, nil )
	SubMenuTab:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( SubMenuTab )
	self.SubMenuTab = SubMenuTab
	
	local NewItemNotification = nil
	
	NewItemNotification = LUI.UIImage.new()
	NewItemNotification.id = "NewItemNotification"
	NewItemNotification:SetAlpha( 0, 0 )
	NewItemNotification:setImage( RegisterMaterial( "icon_new_item_condensed" ), 0 )
	NewItemNotification:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -37, _1080p * 21, _1080p * -31, _1080p * 27 )
	self:addElement( NewItemNotification )
	self.NewItemNotification = NewItemNotification
	
	SubMenuTab:SetDataSourceThroughElement( self, nil )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "ArmoryTab", ArmoryTab )
LockTable( _M )
