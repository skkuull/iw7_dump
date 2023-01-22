local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Cac.GetWeaponRowList()
	for f1_local4, f1_local5 in pairs( f1_local0[f1_arg0] ) do
		if Rewards.IsNew( f1_arg1, "weapon", Engine.TableLookupGetRowNum( CSV.weaponUnlockTable.file, CSV.weaponUnlockTable.cols.ref, f1_local4 ) ) then
			return true
		end
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg0.NewItemNotification )
	if CONDITIONS.UseCACBreadCrumbs() then
		f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0, nil, function ()
			local f3_local0 = f2_arg0:GetDataSource()
			f3_local0 = f3_local0.ref:GetValue( f2_arg1 )
			f2_arg0.newLootItems = LOOT.AreAnyLastLootItemsWeaponByClass( f2_arg1, f3_local0 )
			f2_arg0.newProgressionItems = false
			if not f2_arg0.newLootItems then
				f2_arg0.newProgressionItem = f0_local0( f3_local0, f2_arg1 )
			end
			if f2_arg0.newLootItems or f2_arg0.newProgressionItem then
				f2_arg0.NewItemNotification:SetAlpha( 1, 0 )
			else
				f2_arg0.NewItemNotification:SetAlpha( 0, 0 )
			end
		end )
		f2_arg0:addEventHandler( "update_loot_item_new", function ( f4_arg0, f4_arg1 )
			local f4_local0 = f4_arg0:GetDataSource()
			f4_local0 = f4_local0.ref:GetValue( f2_arg1 )
			if f4_local0 == f4_arg1.class and not f4_arg0.newProgressionItems then
				f4_arg0.newLootItems = LOOT.AreAnyLastLootItemsWeaponByClass( f2_arg1, f4_local0 )
				if f4_arg0.newLootItems then
					f4_arg0.NewItemNotification:SetAlpha( 1, 0 )
				else
					f4_arg0.NewItemNotification:SetAlpha( 0, 0 )
				end
			end
		end )
		f2_arg0:addEventHandler( "update_progression_item_new", function ( f5_arg0, f5_arg1 )
			local f5_local0 = f5_arg0:GetDataSource()
			f5_local0 = f5_local0.ref:GetValue( f2_arg1 )
			if f5_local0 == f5_arg1.class and not f5_arg0.newLootItems then
				f5_arg0.newProgressionItems = f0_local0( f5_local0, f2_arg1 )
				if f5_arg0.newProgressionItems then
					f5_arg0.NewItemNotification:SetAlpha( 1, 0 )
				else
					f5_arg0.NewItemNotification:SetAlpha( 0, 0 )
				end
			end
		end )
	end
	f2_arg0:addEventHandler( "focus_tab", function ( f6_arg0, f6_arg1 )
		f2_arg0.SubMenuTab.index = f2_arg0.index
	end )
end

function WeaponClassTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 180 * _1080p, 0, 30 * _1080p )
	self.id = "WeaponClassTab"
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local SubMenuTab = nil
	
	SubMenuTab = MenuBuilder.BuildRegisteredType( "SubMenuTab", {
		controllerIndex = f7_local1
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
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f8_local0 = self:GetDataSource()
		if f8_local0.disabled:GetValue( f7_local1 ) ~= nil then
			f8_local0 = self:GetDataSource()
			if f8_local0.disabled:GetValue( f7_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Disabled" )
			end
		end
	end )
	f0_local1( self, f7_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponClassTab", WeaponClassTab )
LockTable( _M )
