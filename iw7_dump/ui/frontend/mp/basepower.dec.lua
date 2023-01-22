local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.ButtonBase )
	assert( f1_arg0.ButtonBase.NewItemNotification )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "isUnlocked", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.isUnlocked
		if f2_local0 ~= nil and f2_local0:GetValue( f1_arg1 ) then
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "ButtonBase",
				sequenceName = "Unlocked",
				elementPath = "ButtonBase"
			} )
		else
			ACTIONS.AnimateSequenceByElement( f1_arg0, {
				elementName = "ButtonBase",
				sequenceName = "Locked",
				elementPath = "ButtonBase"
			} )
		end
	end )
	if CONDITIONS.UseCACBreadCrumbs() then
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", function ()
			local f3_local0 = f1_arg0:GetDataSource()
			Cac.UpdateNewItemNotification( f1_arg1, f3_local0.ref:GetValue( f1_arg1 ), CSV.powerUnlockTable, "power", f1_arg0.ButtonBase.NewItemNotification )
		end )
		f1_arg0:addEventHandler( "gain_focus", function ( f4_arg0, f4_arg1 )
			local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
			local f4_local1 = f1_arg0:GetDataSource()
			f4_local0.currentPower = f4_local1.ref:GetValue( f1_arg1 )
		end )
		f1_arg0:addEventHandler( "lose_focus", function ( f5_arg0, f5_arg1 )
			local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
			Cac.ClearNewItemNotification( f1_arg1, f5_local0.currentPower, CSV.powerUnlockTable, "power", f1_arg0.ButtonBase.NewItemNotification )
		end )
	end
	if not f1_arg0.properties then
		f1_arg0.properties = {}
	end
	if Engine.IsPC() then
		f1_arg0:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "power_select_alternate"
			} )
		end )
		f1_arg0:addEventHandler( "button_action_disable", function ( f7_arg0, f7_arg1 )
			f1_arg0:dispatchEventToCurrentMenu( {
				name = "power_select_alternate_disable"
			} )
		end )
	end
	f1_arg0.properties.muteAction = true
end

function BasePower( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 250 * _1080p, 0, 133.2 * _1080p )
	self.id = "BasePower"
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f9_local0 = self:GetDataSource()
		f9_local0 = f9_local0.isDisabled:GetValue( f8_local1 )
		if f9_local0 ~= nil then
			self:SetButtonDisabled( f9_local0 )
		end
	end )
	local ButtonBase = nil
	ButtonBase = MenuBuilder.BuildRegisteredType( "CaCButtonBaseImage", {
		controllerIndex = f8_local1
	} )
	ButtonBase.id = "ButtonBase"
	ButtonBase.Image:SetLeft( _1080p * -50, 0 )
	ButtonBase.Image:SetRight( _1080p * 50, 0 )
	ButtonBase.Image:SetTop( _1080p * -108.5, 0 )
	ButtonBase.Image:SetBottom( _1080p * -8.5, 0 )
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.LevelBacker:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.LevelFrame:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.Level:SetAlpha( 0, 0 )
	end
	if Engine.IsMultiplayer() and not Engine.IsAliensMode() then
		ButtonBase.Level:setText( "Level: 3", 0 )
	end
	ButtonBase.Name:SetAlignment( LUI.Alignment.Left )
	ButtonBase:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	ButtonBase:SubscribeToModelThroughElement( self, "icon", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.icon:GetValue( f8_local1 )
		if f10_local0 ~= nil then
			ButtonBase.Image:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	ButtonBase:SubscribeToModelThroughElement( self, "name", function ()
		local f11_local0 = self:GetDataSource()
		f11_local0 = f11_local0.name:GetValue( f8_local1 )
		if f11_local0 ~= nil then
			ButtonBase.Name:setText( LocalizeString( f11_local0 ), 0 )
		end
	end )
	self:addElement( ButtonBase )
	self.ButtonBase = ButtonBase
	
	self:SubscribeToModelThroughElement( self, "isDisabled", function ()
		local f12_local0 = self:GetDataSource()
		if f12_local0.isDisabled:GetValue( f8_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.isDisabled:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Disabled",
					elementPath = "ButtonBase"
				} )
			end
		end
		f12_local0 = self:GetDataSource()
		if f12_local0.isDisabled:GetValue( f8_local1 ) ~= nil then
			f12_local0 = self:GetDataSource()
			if f12_local0.isDisabled:GetValue( f8_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "ButtonBase",
					sequenceName = "Enabled",
					elementPath = "ButtonBase"
				} )
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "selected", function ()
		local f13_local0 = self:GetDataSource()
		if f13_local0.selected:GetValue( f8_local1 ) ~= nil then
			f13_local0 = self:GetDataSource()
			if f13_local0.selected:GetValue( f8_local1 ) == true then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Activate",
					elementPath = "ButtonBase.Message"
				} )
			end
		end
		f13_local0 = self:GetDataSource()
		if f13_local0.selected:GetValue( f8_local1 ) ~= nil then
			f13_local0 = self:GetDataSource()
			if f13_local0.selected:GetValue( f8_local1 ) == false then
				ACTIONS.AnimateSequenceByElement( self, {
					elementName = "Message",
					sequenceName = "Inactive",
					elementPath = "ButtonBase.Message"
				} )
			end
		end
	end )
	f0_local0( self, f8_local1, controller )
	return self
end

MenuBuilder.registerType( "BasePower", BasePower )
LockTable( _M )
