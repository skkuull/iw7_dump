local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	if Engine.IsCoreMode() then
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "disabledByPointCount", function ()
			local f2_local0 = f1_arg0:GetDataSource()
			if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) ~= nil then
				f2_local0 = f1_arg0:GetDataSource()
				if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) == true then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "Base",
						sequenceName = "Disabled",
						elementPath = "Base"
					} )
				end
			end
			f2_local0 = f1_arg0:GetDataSource()
			if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) ~= nil then
				f2_local0 = f1_arg0:GetDataSource()
				if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) == false then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "Base",
						sequenceName = "Enabled",
						elementPath = "Base"
					} )
				end
			end
			f2_local0 = f1_arg0:GetDataSource()
			if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) ~= nil then
				f2_local0 = f1_arg0:GetDataSource()
				if f2_local0.disabledByPointCount:GetValue( f1_arg1 ) == true then
					f2_local0 = f1_arg0:GetDataSource()
					if f2_local0.disabled:GetValue( f1_arg1 ) ~= nil then
						f2_local0 = f1_arg0:GetDataSource()
						if f2_local0.disabled:GetValue( f1_arg1 ) == true then
							ACTIONS.AnimateSequenceByElement( f1_arg0, {
								elementName = "Base",
								sequenceName = "Disabled_Rollout",
								elementPath = "Base"
							} )
						end
					end
				end
			end
		end )
	end
	if Engine.IsSingleplayer() then
		f1_arg0:addEventHandler( "lose_focus", function ( f3_arg0, f3_arg1 )
			local f3_local0 = f1_arg0:GetDataSource()
			local f3_local1 = f3_local0.ref
			if f3_local0.isScanned:GetValue( f1_arg1 ) then
				DataSources.alwaysLoaded.playerData.SP.spData.attachmentsState[f3_local0.baseRef]:SetValue( f1_arg1, Cac.spLockStates.UNLOCKED )
			end
		end )
		f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
			DataSources.inGame.SP.loadoutTutString:SetValue( f4_arg1.controller or f1_arg1, "exit_primary_attach" )
			Engine.SetDvarString( "loadout_tut_string", "exit_primary_attach" )
		end )
	end
	if CONDITIONS.UseCACBreadCrumbs() then
		assert( f1_arg0.Base )
		assert( f1_arg0.Base.NewItemNotification )
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "name", function ()
			local f5_local0 = f1_arg0:GetDataSource()
			local f5_local1 = f5_local0.weaponRef
			local f5_local2 = "+"
			local f5_local3 = f1_arg0:GetDataSource()
			if Rewards.IsNew( f1_arg1, Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f5_local0.weaponRef ) ), Engine.TableLookupGetRowNum( Cac.GetAttachmentUnlockTable( f5_local0.weaponRef ), CSV.attachmentUnlockTable.cols.weaponAttachRef, f5_local1 .. f5_local2 .. f5_local3.ref ) ) then
				f1_arg0.Base.NewItemNotification:SetAlpha( 1, 0 )
			else
				f1_arg0.Base.NewItemNotification:SetAlpha( 0, 0 )
			end
		end )
		f1_arg0:addEventHandler( "lose_focus", function ( f6_arg0, f6_arg1 )
			local f6_local0 = LUI.FlowManager.GetScopedData( f6_arg0 )
			local f6_local1 = f6_local0.currentAttach
			local f6_local2 = Cac.GetWeaponClassAttachUnlockTablePrefix( Cac.GetWeaponClass( f6_local0.currentAttachWeaponRef ) )
			local f6_local3 = Engine.TableLookupGetRowNum( Cac.GetAttachmentUnlockTable( f6_local0.currentAttachWeaponRef ), CSV.attachmentUnlockTable.cols.weaponAttachRef, f6_local1 )
			if Rewards.IsNew( f1_arg1, f6_local2, f6_local3 ) then
				Rewards.ClearNew( f1_arg1, f6_local2, f6_local3 )
				f1_arg0.Base.NewItemNotification:SetAlpha( 0, 0 )
			end
		end )
		f1_arg0:addEventHandler( "gain_focus", function ( f7_arg0, f7_arg1 )
			local f7_local0 = LUI.FlowManager.GetScopedData( f7_arg0 )
			local f7_local1 = f1_arg0:GetDataSource()
			local f7_local2 = f7_local1.weaponRef
			local f7_local3 = "+"
			local f7_local4 = f1_arg0:GetDataSource()
			f7_local0.currentAttach = f7_local2 .. f7_local3 .. f7_local4.ref
			f7_local0.currentAttachWeaponRef = f7_local1.weaponRef
		end )
	end
	f1_arg0.actionSFX = "ui_select_screen_return"
end

function Attachment( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 143 * _1080p, 0, 150 * _1080p )
	self.id = "Attachment"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.disabled:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			self:SetButtonDisabled( f9_local0 )
		end
	end )
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f8_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -50, 0 )
	Base.Image:SetRight( _1080p * 50, 0 )
	Base.Image:SetTop( _1080p * -111, 0 )
	Base.Image:SetBottom( _1080p * -11, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		Base.Level:setText( "Level: 3", 0 )
	end
	Base.Name:SetAlignment( LUI.Alignment.Center )
	Base:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	Base:SubscribeToModelThroughElement( self, "icon", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.icon:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.name:GetValue( f8_local1 )
		if f11_local0 ~= nil then
			Base.Name:setText( LocalizeString( f11_local0 ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	self:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
		ACTIONS.OnSelectAttachment( self, f12_arg1.controller or f8_local1 )
	end )
	self:addEventHandler( "button_action_disable", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f8_local1
		if CONDITIONS.IsCoreMultiplayer( self ) then
			local f13_local1 = self:GetDataSource()
			if f13_local1.disabledByPointCount:GetValue( f13_local0 ) ~= nil then
				f13_local1 = self:GetDataSource()
				if f13_local1.disabledByPointCount:GetValue( f13_local0 ) == true then
					f13_local1 = self:GetDataSource()
					if f13_local1.isUnlocked:GetValue( f13_local0 ) ~= nil then
						f13_local1 = self:GetDataSource()
						if f13_local1.isUnlocked:GetValue( f13_local0 ) == true then
							ACTIONS.OpenLoadoutRemovalPopup( self, "CACLoadoutRemovalPopup", true, f13_local0 )
						end
					end
				end
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "equipped", function ()
		local f14_local0 = self:GetDataSource()
		if f14_local0.equipped:GetValue( f8_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.equipped:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "Base.Message"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isUnlocked", function ()
		local f15_local0 = self:GetDataSource()
		if f15_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isUnlocked:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Unlocked",
					elementPath = "Base"
				} )
			end
		end
		f15_local0 = self:GetDataSource()
		if f15_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isUnlocked:GetValue( f8_local1 ) == false then
				f15_local0 = self:GetDataSource()
				if f15_local0.isScanned:GetValue( f8_local1 ) ~= nil then
					f15_local0 = self:GetDataSource()
					if f15_local0.isScanned:GetValue( f8_local1 ) == false and CONDITIONS.IsSingleplayer( self ) then
						ACTIONS.AnimateSequenceByElement( self, {
							elementName = "Base",
							sequenceName = "Locked",
							elementPath = "Base"
						} )
					end
				end
			end
		end
		f15_local0 = self:GetDataSource()
		if f15_local0.isUnlocked:GetValue( f8_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isUnlocked:GetValue( f8_local1 ) == false and not CONDITIONS.IsSingleplayer( self ) then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Locked",
					elementPath = "Base"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "disabled", function ()
		local f16_local0 = self:GetDataSource()
		if f16_local0.disabled:GetValue( f8_local1 ) ~= nil then
			f16_local0 = self:GetDataSource()
			if f16_local0.disabled:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Disabled",
					elementPath = "Base"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "isScanned", function ()
		if CONDITIONS.IsSingleplayer( self ) then
			local f17_local0 = self:GetDataSource()
			if f17_local0.isScanned:GetValue( f8_local1 ) ~= nil then
				f17_local0 = self:GetDataSource()
				if f17_local0.isScanned:GetValue( f8_local1 ) == true then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "IsNew",
						elementPath = "Base"
					} )
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "Unlocked",
						elementPath = "Base"
					} )
				end
			end
		end
		if CONDITIONS.IsSingleplayer( self ) then
			local f17_local0 = self:GetDataSource()
			if f17_local0.isScanned:GetValue( f8_local1 ) ~= nil then
				f17_local0 = self:GetDataSource()
				if f17_local0.isScanned:GetValue( f8_local1 ) == false then
					ACTIONS.AnimateSequenceByElement( self, {
						elementName = "Base",
						sequenceName = "IsNotNew",
						elementPath = "Base"
					} )
				end
			end
		end
	end )
	f0_local0( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "Attachment", Attachment )
LockTable( _M )
