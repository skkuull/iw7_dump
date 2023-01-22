local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0:SetButtonDisabled( true )
	f1_arg0:SetHandleMouse( false )
	f1_arg0.turnOnFunction = function ( f2_arg0 )
		local f2_local0 = "ShowButton"
		if f2_arg0._lastState ~= f2_local0 then
			f2_arg0._lastState = f2_local0
			ACTIONS.AnimateSequence( f2_arg0, f2_local0 )
		end
		f2_arg0:SetButtonDisabled( false )
		f2_arg0:SetHandleMouse( true )
	end
	
	f1_arg0.turnOffFunction = function ( f3_arg0 )
		local f3_local0 = "HideButton"
		if f3_arg0._lastState ~= f3_local0 then
			f3_arg0._lastState = f3_local0
			ACTIONS.AnimateSequence( f3_arg0, f3_local0 )
		end
		f3_arg0:SetButtonDisabled( true )
		f3_arg0:SetHandleMouse( false )
	end
	
	f1_arg0:registerEventHandler( "button_over", function ( element, event )
		local f4_local0 = element:GetDataSource()
		f4_local0 = f4_local0.used:GetValue( f1_arg1 )
		if element.extraPowerClear then
			local f4_local1 = element:GetDataSource()
			f4_local0 = f4_local1.extraUsed:GetValue( f1_arg1 )
		end
		local f4_local1 = LUI.FlowManager.GetScopedData( element )
		if element:IsDisabled() and f4_local0 and not f4_local1.hideWeaponBreadCrumbs then
			element:turnOnFunction()
		end
		if not element:IsDisabled() and element:isInFocus() then
			local f4_local2 = "ButtonOver"
			if element._lastState ~= f4_local2 then
				element._lastState = f4_local2
				ACTIONS.AnimateSequence( element, f4_local2 )
			end
		end
	end )
	f1_arg0:registerEventHandler( "button_up", function ( element, event )
		if not element:IsDisabled() then
			local f5_local0 = element:getParent()
			if not f5_local0:isInFocus() then
				element:turnOffFunction()
			end
		end
		if not element:IsDisabled() then
			local f5_local0 = element:getParent()
			if f5_local0:isInFocus() then
				f5_local0 = "ButtonUp"
				if element._lastState ~= f5_local0 then
					element._lastState = f5_local0
					ACTIONS.AnimateSequence( element, f5_local0 )
				end
			end
		end
	end )
	local f1_local0 = function ()
		local f6_local0 = f1_arg0:GetDataSource()
		f6_local0 = f6_local0.used:GetValue( f1_arg1 )
		if f1_arg0.extraPowerClear then
			local f6_local1 = f1_arg0:GetDataSource()
			f6_local0 = f6_local1.extraUsed:GetValue( f1_arg1 )
		end
		if not f6_local0 then
			f1_arg0:turnOffFunction()
		elseif f1_arg0:getParent() then
			local f6_local1 = LUI.FlowManager.GetScopedData( f1_arg0 )
			if f1_arg0:IsDisabled() and not f6_local1.hideWeaponBreadCrumbs then
				f1_arg0:turnOnFunction()
			end
			if not f1_arg0:IsDisabled() and f1_arg0:isInFocus() then
				local f6_local2 = "ButtonOver"
				if f1_arg0._lastState ~= f6_local2 then
					f1_arg0._lastState = f6_local2
					ACTIONS.AnimateSequence( f1_arg0, f6_local2 )
				end
			end
		end
	end
	
	f1_arg0.usedDataLink = f1_arg0:SubscribeToModelThroughElement( f1_arg0, "used", f1_local0 )
	f1_arg0.SetupExtraUsedDataSourceSubscription = function ()
		f1_arg0:UnsubscribeFromModelThroughElement( f1_arg0.usedDataLink )
		f1_arg0.extraPowerClear = true
		f1_arg0:SubscribeToModelThroughElement( f1_arg0, "extraUsed", f1_local0 )
	end
	
end

function ClearButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ClearButton"
	self._animationSets = {}
	self._sequences = {}
	local f8_local1 = controller and controller.controllerIndex
	if not f8_local1 and not Engine.InFrontend() then
		f8_local1 = self:getRootController()
	end
	assert( f8_local1 )
	local f8_local2 = self
	local Icon = nil
	
	Icon = LUI.UIImage.new()
	Icon.id = "Icon"
	Icon:setImage( RegisterMaterial( "icon_cac_pc_clear" ), 0 )
	self:addElement( Icon )
	self.Icon = Icon
	
	self._animationSets.DefaultAnimationSet = function ()
		Icon:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			Icon:AnimateSequence( "DefaultSequence" )
		end
		
		Icon:RegisterAnimationSequence( "ShowButton", {
			{
				function ()
					return self.Icon:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ShowButton = function ()
			Icon:AnimateSequence( "ShowButton" )
		end
		
		Icon:RegisterAnimationSequence( "HideButton", {
			{
				function ()
					return self.Icon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideButton = function ()
			Icon:AnimateSequence( "HideButton" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Icon:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Icon:AnimateSequence( "ButtonOver" )
		end
		
		Icon:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Icon:SetAlpha( 0.7, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Icon:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f8_local1, controller )
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "ClearButton", ClearButton )
LockTable( _M )
