local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if CONDITIONS.IsCoreMultiplayer( f1_arg0 ) then
		ACTIONS.EquipWeapon( f1_arg0, f1_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end
	if CONDITIONS.IsSingleplayer( f1_arg0 ) then
		local f1_local0 = f1_arg0:GetDataSource()
		if f1_local0.weapon.isUnlocked:GetValue( f1_arg1 ) ~= nil then
			f1_local0 = f1_arg0:GetDataSource()
			if f1_local0.weapon.isUnlocked:GetValue( f1_arg1 ) ~= true then
				f1_local0 = false
			end
			f1_local0 = true
		end
		f1_local0 = false
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0.actionSFX = "ui_select_screen_return"
	f2_arg0:addEventHandler( "button_action", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f2_arg0:GetCurrentMenu()
		local f3_local1 = f3_arg1.controller or f2_arg1
		if CONDITIONS.IsDraftEnabled() and f3_local0.XUID and f3_local0.draftSlot then
			local f3_local2 = f2_arg0:GetDataSource()
			local f3_local3 = Cac.GetWeaponIndex( f3_local2.weapon.baseWeaponRef:GetValue( f3_local1 ) )
			LoadoutDrafting.RequestWeapon( f3_local1, f3_local3, f3_local0.draftSlot )
			LUI.FlowManager.RequestPopupMenu( f2_arg0, "RequestDraftPopup", true, f3_local1, false, {
				refreshFunction = function ()
					local f4_local0 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f3_local1, f3_local3, 1 )
					local f4_local1 = LoadoutDrafting.GetPlayerXUIDWithWeapon( f3_local1, f3_local3, 2 )
					if not Engine.IsXUIDInvalid( f4_local0 ) or not Engine.IsXUIDInvalid( f4_local1 ) then
						if f4_local0 == f3_local0.XUID or f4_local1 == f3_local0.XUID then
							LUI.FlowManager.RequestLeaveMenuByName( "RequestDraftPopup" )
							LUI.FlowManager.RequestLeaveMenu( f2_arg0, true, true )
						else
							LUI.FlowManager.RequestLeaveMenuByName( "RequestDraftPopup" )
							LUI.FlowManager.RequestPopupMenu( f2_arg0, "DraftFailed", true, f3_local1, false )
							local f4_local2 = f2_arg0:GetDataSource()
							f4_local2.weapon.isUnlocked:SetValue( f3_local1, false )
						end
					end
				end
			} )
		else
			f0_local0( f2_arg0, f3_local1 )
		end
	end )
	if Engine.IsSingleplayer() then
		local bindButton = LUI.UIBindButton.new()
		bindButton.id = "selfBindButton"
		f2_arg0:addElement( bindButton )
		f2_arg0.bindButton = bindButton
		
		f2_arg0:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
			if CONDITIONS.IsSingleplayer( f2_arg0 ) then
				Engine.SetDvarString( "loadout_tut_string", "exit_primary_select" )
			end
		end )
	end
	if Engine.IsMultiplayer() then
		local bindButton = function ( f6_arg0, f6_arg1 )
			local f6_local0 = f6_arg0:GetDataSource()
			f6_local0 = f6_local0.weapon
			local f6_local1 = LUI.FlowManager.GetScopedData( f6_arg0 )
			f6_local1.currentLootItemID = Engine.IsAliensMode() and f6_local0.weaponLootID:GetValue( f2_arg1 ) or f6_local0.lootItemID
			if Engine.IsCoreMode() then
				f6_arg0:dispatchEventToCurrentMenu( {
					name = "update_stream_requests",
					gridIndex = f6_local0.variantIndex:GetValue( f2_arg1 )
				} )
			end
		end
		
		f2_arg0:addEventHandler( "button_over", bindButton )
		f2_arg0:addEventHandler( "button_over_disable", bindButton )
	end
	if CONDITIONS.UseCACBreadCrumbs() then
		f2_arg0:addEventHandler( "lose_focus", function ( f7_arg0, f7_arg1 )
			local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
			local f7_local1 = f7_local0.currentLootItemID
			if Loot.IsNew( f2_arg1, f7_local1 ) and f7_local1 ~= Cac.LootIDNoneValue then
				Loot.ClearNew( f2_arg1, f7_local1 )
				f7_arg0:dispatchEventToCurrentMenu( {
					name = "update_loot_item_new",
					class = Cac.GetWeaponClassFromLootID( f7_local1 ),
					lootItemID = f7_local1,
					baseWeapon = Cac.GetBaseWeaponRefFromLootID( f7_local1 )
				} )
			end
		end )
	end
	if Engine.IsPC() then
		f2_arg0:addEventHandler( "weapon_select_alternate", function ( f8_arg0, f8_arg1 )
			if f8_arg0:isInFocus() then
				if not Engine.IsSingleplayer() then
					local f8_local0 = f2_arg0:GetDataSource()
					if f8_local0.weapon.isItemUnlocked then
					
					else
						
					end
				end
				f0_local0( f2_arg0, f8_arg1.controller or f2_arg1 )
			end
		end )
		f2_arg0:addEventHandler( "weapon_select_alternate_disable", function ( f9_arg0, f9_arg1 )
			if CONDITIONS.IsCoreMultiplayer( f2_arg0 ) then
				local f9_local0 = f2_arg0:GetDataSource()
				if f9_local0.weapon.isItemUnlocked then
					local f9_local1 = f9_arg1.controller or f2_arg1
					local f9_local2 = f2_arg0:GetDataSource()
					f9_local2 = f9_local2.weapon.isDisabledByPointCount:GetValue( f9_local1 )
					if f9_local2 ~= nil and f9_local2 == true then
						ACTIONS.OpenLoadoutRemovalPopup( f2_arg0, "CACLoadoutRemovalPopup", true, f9_local1 )
					end
				end
			end
		end )
		f2_arg0:SetHandleMouse( false )
	end
end

function Weapon( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1000 * _1080p, 0, 450 * _1080p )
	self.id = "Weapon"
	self._animationSets = {}
	self._sequences = {}
	local f10_local1 = controller and controller.controllerIndex
	if not f10_local1 and not Engine.InFrontend() then
		f10_local1 = self:getRootController()
	end
	assert( f10_local1 )
	local f10_local2 = self
	self:SubscribeToModelThroughElement( self, "weapon.isDisabled", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.weapon.isDisabled:GetValue( f10_local1 )
		if f11_local0 ~= nil then
			self:SetButtonDisabled( f11_local0 )
		end
	end )
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -10, _1080p * -79, _1080p * -79, _1080p * -10 )
	self:addElement( Lock )
	self.Lock = Lock
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonOver = function ()
			
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			Lock:AnimateSequence( "Locked" )
		end
		
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			Lock:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f20_arg0, f20_arg1 )
		local f20_local0 = f20_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f21_arg0, f21_arg1 )
		local f21_local0 = f21_arg1.controller or f10_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:SubscribeToModelThroughElement( self, "weapon.isDisabled", function ()
		local f22_local0 = self:GetDataSource()
		if f22_local0.weapon.isDisabled:GetValue( f10_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.weapon.isDisabled:GetValue( f10_local1 ) == true then
				ACTIONS.AnimateSequence( self, "Locked" )
			end
		end
		f22_local0 = self:GetDataSource()
		if f22_local0.weapon.isDisabled:GetValue( f10_local1 ) ~= nil then
			f22_local0 = self:GetDataSource()
			if f22_local0.weapon.isDisabled:GetValue( f10_local1 ) == false then
				ACTIONS.AnimateSequence( self, "Unlocked" )
			end
		end
	end )
	self:addEventHandler( "button_action_disable", function ( f23_arg0, f23_arg1 )
		local f23_local0 = f23_arg1.controller or f10_local1
		if CONDITIONS.IsCoreMultiplayer( self ) then
			local f23_local1 = self:GetDataSource()
			if f23_local1.weapon.isDisabledByPointCount:GetValue( f23_local0 ) ~= nil then
				f23_local1 = self:GetDataSource()
				if f23_local1.weapon.isDisabledByPointCount:GetValue( f23_local0 ) == true then
					ACTIONS.OpenLoadoutRemovalPopup( self, "CACLoadoutRemovalPopup", true, f23_local0 )
				end
			end
		end
	end )
	f0_local1( self, f10_local1, controller )
	return self
end

MenuBuilder.registerType( "Weapon", Weapon )
LockTable( _M )
