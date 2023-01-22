local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = f1_arg0:GetCurrentMenu()
	assert( f1_local0.LoadoutList )
	assert( f1_local0.LoadoutList.Loadouts )
	local f1_local1 = LUI.FlowManager.GetScopedData( f1_local0 )
	f1_local1.refreshWidgetMenu = f1_arg3
	local f1_local2 = f1_arg0:GetDataSource()
	f1_local1.refreshWidget = f1_local2.ref:GetValue( f1_arg1 )
	if f1_arg2 then
		f1_local2 = f1_arg0:GetDataSource()
		f1_local1.refreshWidgetLootItemID = f1_local2.lootItemID:GetValue( f1_arg1 )
	end
	f1_local1.staticPointAnimation = true
	f1_local2 = f1_local0.LoadoutList.Loadouts:GetDataSource()
	f1_local1.loadoutPointsUsed = f1_local2.pointCount:GetValue( f1_arg1 )
end

f0_local1 = function ( f2_arg0 )
	local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0:GetCurrentMenu() )
	f2_local0.refreshWidget = nil
	f2_local0.refreshWidgetLootItemID = nil
end

f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = LUI.FlowManager.GetScopedData( f3_arg0:GetCurrentMenu() )
	if f3_local0.refreshWidget then
		local f3_local1 = f3_local0.refreshWidget
		local f3_local2 = f3_arg0:GetDataSource()
		if f3_local1 ~= f3_local2.ref:GetValue( f3_arg1 ) then
			f0_local1( f3_arg0 )
			return true
		end
	end
	if f3_arg2 and f3_local0.usesLootItemID then
		local f3_local1 = f3_local0.usesLootItemID
		local f3_local2 = f3_arg0:GetDataSource()
		if f3_local1 ~= f3_local2.lootItemID:GetValue( f3_arg1 ) then
			f0_local1( f3_arg0 )
			return true
		end
	end
	f0_local1( f3_arg0 )
	return false
end

local f0_local3 = function ( f4_arg0 )
	local f4_local0 = f4_arg0:getAllFocusedChildren()
	if #f4_local0 <= 0 then
		return false
	end
	local f4_local1 = false
	for f4_local2 = 1, #f4_local0, 1 do
		if not f4_local0[f4_local2]:IsDisabled() then
			f4_local1 = true
		end
	end
	return f4_local1
end

local f0_local4 = function ( f5_arg0 )
	return function ( f6_arg0, f6_arg1 )
		if CONDITIONS.IsCoreFrontendPC() then
			if not f0_local3( f6_arg0 ) then
				f0_local0( f6_arg0, f5_arg0, true, Cac.LoadoutEditMenus.WeaponSelect )
				ACTIONS.OpenWeaponSelectMenu( f6_arg0, f6_arg0, f5_arg0 )
			end
			return true
		else
			f0_local0( f6_arg0, f5_arg0, true, Cac.LoadoutEditMenus.WeaponSelect )
			ACTIONS.OpenWeaponSelectMenu( f6_arg0, f6_arg0, f5_arg0 )
		end
	end
	
end

local f0_local5 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg0:getParent()
	if #f7_local0:getAllFocusedChildren() <= 0 then
		f7_local0 = f7_arg0:getParent()
		if f7_local0:isInFocus() then
		
		else
			return false
		end
	end
	ACTIONS.CloseLoadoutEditMenu( f7_arg0 )
	return true
end

local f0_local6 = function ( f8_arg0 )
	return function ( f9_arg0, f9_arg1 )
		if CONDITIONS.IsCoreFrontendPC() then
			if not f0_local3( f9_arg0 ) then
				f0_local0( f9_arg0, f8_arg0, true, Cac.LoadoutEditMenus.PowerSelect )
				ACTIONS.OpenPowerSelectMenu( f9_arg0, f9_arg0, f8_arg0 )
			end
			return true
		else
			f0_local0( f9_arg0, f8_arg0, true, Cac.LoadoutEditMenus.PowerSelect )
			ACTIONS.OpenPowerSelectMenu( f9_arg0, f9_arg0, f8_arg0 )
		end
	end
	
end

local f0_local7 = function ( f10_arg0 )
	return function ( f11_arg0, f11_arg1 )
		if CONDITIONS.IsCoreFrontendPC() then
			if not f0_local3( f11_arg0 ) then
				ACTIONS.ToggleExtraPower( f11_arg0, f11_arg0, f10_arg0 )
			end
			return true
		else
			ACTIONS.ToggleExtraPower( f11_arg0, f11_arg0, f10_arg0 )
		end
	end
	
end

local f0_local8 = function ( f12_arg0 )
	return function ( f13_arg0, f13_arg1 )
		if CONDITIONS.IsCoreFrontendPC() then
			if not f0_local3( f13_arg0 ) then
				f0_local0( f13_arg0, f12_arg0, false, Cac.LoadoutEditMenus.PerkSelect )
				ACTIONS.OpenPerkSelectMenu( f13_arg0, f13_arg0, f12_arg0 )
			end
			return true
		else
			f0_local0( f13_arg0, f12_arg0, false, Cac.LoadoutEditMenus.PerkSelect )
			ACTIONS.OpenPerkSelectMenu( f13_arg0, f13_arg0, f12_arg0 )
		end
	end
	
end

function PostLoadFunc( f14_arg0, f14_arg1, f14_arg2 )
	f14_arg0.CACLoadout.WeaponOne.WeaponButton:addEventHandler( "button_action", f0_local4( f14_arg1 ) )
	f14_arg0.CACLoadout.WeaponTwo.WeaponButton:addEventHandler( "button_action", f0_local4( f14_arg1 ) )
	f14_arg0.CACLoadout.WeaponOne.WeaponButton:addEventHandler( "gain_focus", function ( f15_arg0, f15_arg1 )
		if f0_local2( f15_arg0, f14_arg1, true ) then
			f14_arg0.CACLoadout.WeaponOne:processEvent( {
				name = "refresh_widget"
			} )
		end
	end )
	f14_arg0.CACLoadout.WeaponTwo.WeaponButton:addEventHandler( "gain_focus", function ( f16_arg0, f16_arg1 )
		if f0_local2( f16_arg0, f14_arg1, true ) then
			f14_arg0.CACLoadout.WeaponTwo:processEvent( {
				name = "refresh_widget"
			} )
		end
	end )
	f14_arg0.CACLoadout.WeaponOne.WeaponButton.bindButton:addEventHandler( "button_secondary", f0_local5 )
	f14_arg0.CACLoadout.WeaponTwo.WeaponButton.bindButton:addEventHandler( "button_secondary", f0_local5 )
	local f14_local0 = function ( f17_arg0, f17_arg1, f17_arg2 )
		local f17_local0 = function ( f18_arg0, f18_arg1 )
			f0_local0( f18_arg0, f17_arg2, false, Cac.LoadoutEditMenus.AttachmentSelect )
			local f18_local0 = f17_arg0:GetDataSource( f17_arg2 )
			f18_local0.isProperty = false
			local f18_local1 = f18_arg0:GetCurrentMenu()
			assert( f18_local1.LoadoutList )
			assert( f18_local1.LoadoutList.Loadouts )
			LUI.FlowManager.RequestAddMenu( "AttachmentSelect", true, f17_arg2, nil, {
				currentWeaponDataSource = f18_local0,
				loadoutDataSource = f14_arg0:GetDataSource(),
				attachmentSlot = f17_arg1,
				squadMemberDataSource = f18_local1.squadMemberDataSource
			}, true )
		end
		
		return function ( f19_arg0, f19_arg1 )
			if CONDITIONS.IsCoreFrontendPC() then
				if not f0_local3( f19_arg0 ) then
					f17_local0( f19_arg0, f19_arg1 )
				end
				return true
			else
				f17_local0( f19_arg0, f19_arg1 )
			end
		end
		
	end
	
	for f14_local9, f14_local10 in pairs( {
		{
			attachmentGrids = {
				f14_arg0.CACLoadout.WeaponOne.AttachmentsOne,
				f14_arg0.CACLoadout.WeaponOne.AttachmentsTwo
			},
			weapon = f14_arg0.CACLoadout.WeaponOne.WeaponButton
		},
		{
			attachmentGrids = {
				f14_arg0.CACLoadout.WeaponTwo.AttachmentsOne,
				f14_arg0.CACLoadout.WeaponTwo.AttachmentsTwo
			},
			weapon = f14_arg0.CACLoadout.WeaponTwo.WeaponButton
		}
	} ) do
		local f14_local5 = 0
		for f14_local6, f14_local7 in ipairs( f14_local10.attachmentGrids ) do
			local f14_local4 = f14_local7:getFirstChild()
			while f14_local4 do
				if f14_local4.bindButton then
					f14_local4.bindButton:addEventHandler( "button_secondary", f0_local5 )
					f14_local4:addEventHandler( "button_action", f14_local0( f14_local10.weapon, f14_local5, f14_arg1 ) )
					f14_local4:addEventHandler( "gain_focus", function ( f20_arg0, f20_arg1 )
						if f0_local2( f20_arg0, f14_arg1, false ) then
							ACTIONS.AnimateSequence( f20_arg0, "RefreshWidget" )
						end
					end )
				end
				f14_local4 = f14_local4:getNextSibling()
				f14_local5 = f14_local5 + 1
			end
			f14_local5 = f14_local5 - 1
		end
	end
	f14_arg0.CACLoadout.WeaponTwo.Overkill:addEventHandler( "button_action", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg0:GetCurrentMenu()
		local f21_local1 = f21_local0.LoadoutList.Loadouts:GetDataSource()
		assert( f21_local1 )
		if not f21_local1.overkill.used:GetValue( f14_arg1 ) then
			if Cac.CanAffordItem( f21_local1, f21_local1.overkill.pointCost, f14_arg1 ) then
				f21_local1.overkill.usedInt:SetValue( f14_arg1, 1 )
			else
				Cac.ClearWeaponAndAttachments( f14_arg0.CACLoadout.WeaponTwo:GetDataSource(), f14_arg1 )
				if f21_local1.overkill.pointCost:GetCountValue( f14_arg1 ) <= Cac.PointMax - Cac.GetPointCountForLoadout( f21_local1, f14_arg1 ) then
					f21_local1.overkill.usedInt:SetValue( f14_arg1, 1 )
				else
					local f21_local2 = LUI.FlowManager.GetScopedData( f21_local0 )
					f21_local2.staticPointAnimation = true
					LUI.FlowManager.RequestAddMenu( "CACLoadoutRemovalPopup", true, f14_arg1, nil, {
						weaponSlot = 1,
						perkSlot = nil,
						desiredItemCost = f21_local1.overkill.pointCost,
						loadoutDataSource = f21_local1,
						statsGroupDataSource = f21_local0.statsGroupDataSource
					} )
				end
				return 
			end
		else
			f21_local1.overkill.usedInt:SetValue( f14_arg1, 0 )
		end
		f14_arg0:dispatchEventToCurrentMenu( {
			name = "update_new_item",
			slot = f21_local1.overkill.usedInt:GetValue( f14_arg1 ) and "2" or "1"
		} )
		ACTIONS.OnClearWeapon( f21_local0.CACLoadoutWrapper.CACLoadout.WeaponTwo.WeaponButton, f14_arg1 )
	end )
	f14_arg0.CACLoadout.WeaponTwo.Overkill.bindButton:addEventHandler( "button_alt1", function ( f22_arg0, f22_arg1 )
		local f22_local0 = f22_arg0:getParent()
		if #f22_local0:getAllFocusedChildren() <= 0 then
			f22_local0 = f22_arg0:getParent()
			if f22_local0:isInFocus() then
				f22_local0 = f22_arg0:getParent()
				f22_local0 = f22_local0:GetDataSource()
				if f22_local0.used:GetValue( f14_arg1 ) then
					f22_local0 = f22_arg0:getParent()
					f22_local0 = f22_local0:GetDataSource()
					f22_local0.usedInt:SetValue( f14_arg1, 0 )
					f22_local0 = ACTIONS.OnClearWeapon
					local f22_local1 = f22_arg0:getParent()
					f22_local1 = f22_local1:GetCurrentMenu()
					f22_local0( f22_local1.CACLoadoutWrapper.CACLoadout.WeaponTwo.WeaponButton, f14_arg1 )
				end
			end
		else
			f22_local0 = f22_arg0:getParent()
			f22_local0 = f22_local0:GetDataSource()
			if f22_local0.used:GetValue( f14_arg1 ) then
				f22_local0 = f22_arg0:getParent()
				f22_local0 = f22_local0:GetDataSource()
				f22_local0.usedInt:SetValue( f14_arg1, 0 )
				f22_local0 = ACTIONS.OnClearWeapon
				local f22_local1 = f22_arg0:getParent()
				f22_local1 = f22_local1:GetCurrentMenu()
				f22_local0( f22_local1.CACLoadoutWrapper.CACLoadout.WeaponTwo.WeaponButton, f14_arg1 )
			end
		end
	end )
	f14_local1 = {
		f14_arg0.CACLoadout.Equipment.PowerSlotOne.PowerButton,
		f14_arg0.CACLoadout.Equipment.PowerSlotTwo.PowerButton,
		f14_arg0.CACLoadout.Equipment.PowerSlotOne.ExtraPowerButton,
		f14_arg0.CACLoadout.Equipment.PowerSlotTwo.ExtraPowerButton
	}
	if Engine.InFrontend() then
		table.insert( f14_local1, f14_arg0.CACLoadout.Equipment.RigPerk )
		table.insert( f14_local1, f14_arg0.CACLoadout.Equipment.RigSuper )
	end
	for f14_local10, f14_local5 in ipairs( f14_local1 ) do
		f14_local5.bindButton:addEventHandler( "button_secondary", f0_local5 )
	end
	f14_arg0.CACLoadout.Equipment.PowerSlotOne.PowerButton:addEventHandler( "button_action", f0_local6( f14_arg1 ) )
	f14_arg0.CACLoadout.Equipment.PowerSlotTwo.PowerButton:addEventHandler( "button_action", f0_local6( f14_arg1 ) )
	f14_arg0.CACLoadout.Equipment.PowerSlotOne.PowerButton:addEventHandler( "gain_focus", function ( f23_arg0, f23_arg1 )
		if f0_local2( f23_arg0, f14_arg1, true ) then
			f14_arg0.CACLoadout.Equipment.PowerSlotOne:processEvent( {
				name = "refresh_widget"
			} )
		end
	end )
	f14_arg0.CACLoadout.Equipment.PowerSlotTwo.PowerButton:addEventHandler( "gain_focus", function ( f24_arg0, f24_arg1 )
		if f0_local2( f24_arg0, f14_arg1, true ) then
			f14_arg0.CACLoadout.Equipment.PowerSlotTwo:processEvent( {
				name = "refresh_widget"
			} )
		end
	end )
	f14_arg0.CACLoadout.Equipment.PowerSlotOne.ExtraPowerButton:addEventHandler( "button_action", f0_local7( f14_arg1 ) )
	f14_arg0.CACLoadout.Equipment.PowerSlotTwo.ExtraPowerButton:addEventHandler( "button_action", f0_local7( f14_arg1 ) )
	for f14_local5, f14_local11 in ipairs( {
		f14_arg0.CACLoadout.PerkOne,
		f14_arg0.CACLoadout.PerkTwo,
		f14_arg0.CACLoadout.PerkThree
	} ) do
		f14_local11.Perk:addEventHandler( "button_action", f0_local8( f14_arg1 ) )
		f14_local11.ExtraPerk:addEventHandler( "button_action", f0_local8( f14_arg1 ) )
		f14_local11.Perk.bindButton:addEventHandler( "button_secondary", f0_local5 )
		f14_local11.ExtraPerk.bindButton:addEventHandler( "button_secondary", f0_local5 )
		f14_local11.Perk:addEventHandler( "gain_focus", function ( f25_arg0, f25_arg1 )
			if f0_local2( f25_arg0, f14_arg1, false ) then
				ACTIONS.AnimateSequence( f25_arg0, "RefreshWidget" )
			end
		end )
		f14_local11.ExtraPerk:addEventHandler( "gain_focus", function ( f26_arg0, f26_arg1 )
			if f0_local2( f26_arg0, f14_arg1, false ) then
				ACTIONS.AnimateSequence( f26_arg0, "RefreshWidget" )
			end
		end )
	end
end

function CACLoadoutWrapper( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 588 * _1080p, 0, 629 * _1080p )
	self.id = "CACLoadoutWrapper"
	local f27_local1 = controller and controller.controllerIndex
	if not f27_local1 and not Engine.InFrontend() then
		f27_local1 = self:getRootController()
	end
	assert( f27_local1 )
	local f27_local2 = self
	local f27_local3 = nil
	if Engine.InFrontend() then
		f27_local3 = LUI.UIImage.new()
		f27_local3.id = "DropShadow"
		f27_local3:SetRGBFromInt( 0, 0 )
		f27_local3:SetAlpha( 0.3, 0 )
		f27_local3:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
		f27_local3:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
		self:addElement( f27_local3 )
		self.DropShadow = f27_local3
	end
	local CACLoadout = nil
	
	CACLoadout = MenuBuilder.BuildRegisteredType( "CACLoadout", {
		controllerIndex = f27_local1
	} )
	CACLoadout.id = "CACLoadout"
	CACLoadout:SetDataSourceThroughElement( self, nil )
	CACLoadout:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 590, 0, _1080p * 630 )
	self:addElement( CACLoadout )
	self.CACLoadout = CACLoadout
	
	CACLoadout:SetDataSourceThroughElement( self, nil )
	PostLoadFunc( self, f27_local1, controller )
	return self
end

MenuBuilder.registerType( "CACLoadoutWrapper", CACLoadoutWrapper )
LockTable( _M )
