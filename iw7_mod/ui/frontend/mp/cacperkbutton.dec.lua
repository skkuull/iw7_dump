local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	assert( f1_arg0.Base )
	assert( f1_arg0.Base.NewItemNotification )
	f1_arg0.actionSFX = "ui_select_screen_return"
	f1_arg0:addEventHandler( "button_action", function ( f2_arg0, f2_arg1 )
		ACTIONS.OnSelectPerk( f1_arg0, f2_arg1.controller or f1_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
			local f3_local0 = f1_arg0:GetDataSource()
			Cac.UpdateNewItemNotification( f1_arg1, f3_local0.ref:GetValue( f1_arg1 ), CSV.perkUnlockTable, "perk", f1_arg0.Base.NewItemNotification )
		end )
		f1_arg0:addEventHandler( "lose_focus", function ( f4_arg0, f4_arg1 )
			local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
			Cac.ClearNewItemNotification( f1_arg1, f4_local0.currentPerk, CSV.perkUnlockTable, "perk", f1_arg0.Base.NewItemNotification )
		end )
		f1_arg0:addEventHandler( "gain_focus", function ( f5_arg0, f5_arg1 )
			local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
			local f5_local1 = f1_arg0:GetDataSource()
			f5_local0.currentPerk = f5_local1.ref:GetValue( f1_arg1 )
		end )
	end
end

function CaCPerkButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 192.67 * _1080p, 0, 200 * _1080p )
	self.id = "CaCPerkButton"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.isDisabled:GetValue( f6_local1 )
		if f7_local0 ~= nil then
			self:SetButtonDisabled( f7_local0 )
		end
	end )
	local Base = nil
	Base = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f6_local1
	} )
	Base.id = "Base"
	Base.Image:SetLeft( _1080p * -60, 0 )
	Base.Image:SetRight( _1080p * 60, 0 )
	Base.Image:SetTop( _1080p * -146, 0 )
	Base.Image:SetBottom( _1080p * -26, 0 )
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
		local f8_local0 = self:GetDataSource()
		f8_local0 = f8_local0.icon:GetValue( f6_local1 )
		if f8_local0 ~= nil then
			Base.Image:setImage( RegisterMaterial( f8_local0 ), 0 )
		end
	end )
	Base:SubscribeToModelThroughElement( self, "name", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.name:GetValue( f6_local1 )
		if f9_local0 ~= nil then
			Base.Name:setText( LocalizeString( f9_local0 ), 0 )
		end
	end )
	self:addElement( Base )
	self.Base = Base
	
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f10_local0 = self:GetDataSource()
		if f10_local0.isDisabled:GetValue( f6_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isDisabled:GetValue( f6_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Disabled",
					elementPath = "Base"
				} )
			end
		end
		f10_local0 = self:GetDataSource()
		if f10_local0.isDisabled:GetValue( f6_local1 ) ~= nil then
			f10_local0 = self:GetDataSource()
			if f10_local0.isDisabled:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Enabled",
					elementPath = "Base"
				} )
			end
		end
	end )
	self:addEventHandler( "button_action_disable", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f6_local1
		local f11_local1 = self:GetDataSource()
		if f11_local1.isDisabledByPointCount:GetValue( f11_local0 ) ~= nil then
			f11_local1 = self:GetDataSource()
			if f11_local1.isDisabledByPointCount:GetValue( f11_local0 ) == true then
				f11_local1 = self:GetDataSource()
				if f11_local1.isUnlocked:GetValue( f11_local0 ) ~= nil then
					f11_local1 = self:GetDataSource()
					if f11_local1.isUnlocked:GetValue( f11_local0 ) == true then
						ACTIONS.OpenLoadoutRemovalPopup( self, "CACLoadoutRemovalPopup", true, f11_local0 )
					end
				end
			end
		end
	end )
	self:addEventHandler( "button_disable", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f6_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Base",
			sequenceName = "Disabled_Rollout",
			elementPath = "Base"
		} )
	end )
	self:addEventHandler( "button_over_disable", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f6_local1
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Base",
			sequenceName = "Disabled_Rollover",
			elementPath = "Base"
		} )
	end )
	self:SubscribeToModelThroughElement( self, "isEquipped", function ()
		local f14_local0 = self:GetDataSource()
		if f14_local0.isEquipped:GetValue( f6_local1 ) ~= nil then
			f14_local0 = self:GetDataSource()
			if f14_local0.isEquipped:GetValue( f6_local1 ) == true then
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
		if f15_local0.isUnlocked:GetValue( f6_local1 ) ~= nil then
			f15_local0 = self:GetDataSource()
			if f15_local0.isUnlocked:GetValue( f6_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Base",
					sequenceName = "Locked",
					elementPath = "Base"
				} )
			end
		end
	end )
	PostLoadFunc( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "CaCPerkButton", CaCPerkButton )
LockTable( _M )
