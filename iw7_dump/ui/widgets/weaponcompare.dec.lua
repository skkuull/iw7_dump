local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local self = nil
	local f1_local1 = 50 * _1080p
	local f1_local2 = f1_local1 / 2
	self = LUI.UIText.new( CoD.CreateState( f1_arg0, -f1_local2, f1_arg1, f1_local2, f1_arg2 ) )
	self.id = "noWeaponMessage"
	self:SetFontSize( f1_local1 )
	self:SetFont( FONTS.GetFont( FONTS.MainExtended.File ) )
	self:SetAlignment( LUI.Alignment.Center )
	self:setText( Engine.Localize( "LUA_MENU_MP_NO_WEAPON" ) )
	return self
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	assert( f2_arg2 )
	assert( f2_arg2.archetypeDataSource )
	assert( f2_arg2.archetypeDataSource.weaponOne )
	assert( f2_arg2.archetypeDataSource.weaponTwo )
	local f2_local0 = {
		left = _1080p * 429,
		top = _1080p * 300,
		right = _1080p * 949,
		bottom = _1080p * 890
	}
	if Cac.IsWeaponSlotInUse( f2_arg2.archetypeDataSource.weaponOne.weapon.baseWeaponRef:GetValue( f2_arg1 ) ) then
		local f2_local1 = f2_arg2.archetypeDataSource.weaponOne.weapon.ref:GetValue( f2_arg1 )
		local f2_local2 = Cac.GetLootWeaponID( f2_local1 )
		local f2_local3 = f2_local2 and f2_local2 ~= ""
		local f2_local4
		if f2_local3 then
			f2_local4 = tonumber( f2_local2 )
			if not f2_local4 then
			
			else
				local f2_local5
				if f2_local3 then
					f2_local5 = LUI.ItemCard.contexts.WEAPON_COMPARE_LOOT
					if not f2_local5 then
					
					else
						local f2_local6 = nil
						f2_local6 = LUI.ItemCard.new( {
							leftAnchor = true,
							rightAnchor = false,
							topAnchor = true,
							bottomAnchor = false,
							left = f2_local0.left,
							right = f2_local0.right,
							top = f2_local0.top,
							bottom = f2_local0.bottom
						}, {
							context = f2_local5,
							itemType = LUI.ItemCard.types.WEAPON,
							identifier = f2_local4,
							modelPath = "frontEnd.mp.weaponCompare.cardOne",
							controllerIndex = f2_arg1
						} )
						f2_local6.id = "WeaponOne"
						f2_local6:SetDataSourceThroughElement( f2_arg0, "weaponOne" )
						f2_arg0.WeaponOne = f2_local6
					end
				end
				f2_local5 = LUI.ItemCard.contexts.WEAPON_COMPARE_BASE
			end
		end
		f2_local4 = f2_local1
	else
		f2_arg0.WeaponOne = f0_local0( f2_local0.left, f2_local0.right, CoD.AnchorTypes.Left )
	end
	f2_arg0:addElement( f2_arg0.WeaponOne )
	local f2_local1 = {
		left = _1080p * -949,
		top = _1080p * 300,
		right = _1080p * -429,
		bottom = _1080p * 890
	}
	if Cac.IsWeaponSlotInUse( f2_arg2.archetypeDataSource.weaponTwo.weapon.baseWeaponRef:GetValue( f2_arg1 ) ) then
		local f2_local2 = f2_arg2.archetypeDataSource.weaponTwo.weapon.ref:GetValue( f2_arg1 )
		local f2_local3 = Cac.GetLootWeaponID( f2_local2 )
		local f2_local4 = f2_local3 and f2_local3 ~= ""
		local f2_local5
		if f2_local4 then
			f2_local5 = tonumber( f2_local3 )
			if not f2_local5 then
			
			else
				local f2_local6
				if f2_local4 then
					f2_local6 = LUI.ItemCard.contexts.WEAPON_COMPARE_LOOT
					if not f2_local6 then
					
					else
						local f2_local7 = LUI.ItemCard.new( {
							leftAnchor = false,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = f2_local1.left,
							right = f2_local1.right,
							top = f2_local1.top,
							bottom = f2_local1.bottom
						}, {
							context = f2_local6,
							itemType = LUI.ItemCard.types.WEAPON,
							identifier = f2_local5,
							modelPath = "frontEnd.mp.weaponCompare.cardTwo",
							controllerIndex = f2_arg1
						} )
						f2_local7.id = "WeaponTwo"
						f2_arg0.WeaponTwo = f2_local7
					end
				end
				f2_local6 = LUI.ItemCard.contexts.WEAPON_COMPARE_BASE
			end
		end
		f2_local5 = f2_local2
	else
		f2_arg0.WeaponTwo = f0_local0( f2_local1.left, f2_local1.right, CoD.AnchorTypes.Right )
	end
	f2_arg0:addElement( f2_arg0.WeaponTwo )
	f2_arg0:registerEventHandler( "gamepad_button", function ( element, event )
		if event.down == false and event.button == "right_trigger" then
			LUI.FlowManager.RequestLeaveMenu( element )
		end
		return true
	end )
end

function WeaponCompare( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "WeaponCompare"
	local f4_local1 = controller and controller.controllerIndex
	if not f4_local1 and not Engine.InFrontend() then
		f4_local1 = self:getRootController()
	end
	assert( f4_local1 )
	self:playSound( "menu_open" )
	local f4_local2 = self
	local Darkener = nil
	
	Darkener = LUI.UIImage.new()
	Darkener.id = "Darkener"
	Darkener:SetRGBFromInt( 0, 0 )
	Darkener:SetAlpha( 0.6, 0 )
	self:addElement( Darkener )
	self.Darkener = Darkener
	
	f0_local1( self, f4_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponCompare", WeaponCompare )
LockTable( _M )
