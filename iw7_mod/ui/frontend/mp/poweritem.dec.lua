local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	if Engine.IsPC() then
		f1_arg0:addEventHandler( "power_select_alternate", function ( f2_arg0, f2_arg1 )
			ACTIONS.EquipPower( f1_arg0, f2_arg1.controller or f1_arg1 )
			ACTIONS.LeaveMenu( f1_arg0 )
		end )
		f1_arg0:addEventHandler( "power_select_alternate_disable", function ( f3_arg0, f3_arg1 )
			local f3_local0 = f3_arg1.controller or f1_arg1
			local f3_local1 = f1_arg0:GetDataSource()
			f3_local1 = f3_local1.power.isDisabledByPointCount:GetValue( f3_local0 )
			if CONDITIONS.IsMultiplayer( f1_arg0 ) and f3_local1 ~= nil and f3_local1 == true then
				ACTIONS.OpenLoadoutRemovalPopup( f1_arg0, "CACLoadoutRemovalPopup", true, f3_local0 )
			end
		end )
	end
	f1_arg0.actionSFX = "ui_select_screen_return"
	f1_arg0:addEventHandler( "button_action", function ( f4_arg0, f4_arg1 )
		ACTIONS.EquipPower( f1_arg0, f4_arg1.controller or f1_arg1 )
		LUI.FlowManager.RequestLeaveMenu( f1_arg0, true, true )
	end )
end

function PowerItem( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 512 * _1080p )
	self.id = "PowerItem"
	self._animationSets = {}
	self._sequences = {}
	local f5_local1 = controller and controller.controllerIndex
	if not f5_local1 and not Engine.InFrontend() then
		f5_local1 = self:getRootController()
	end
	assert( f5_local1 )
	local f5_local2 = self
	self:SubscribeToModelThroughElement( self, "power.isDisabled", function ()
		local f6_local0 = self:GetDataSource()
		f6_local0 = f6_local0.power.isDisabled:GetValue( f5_local1 )
		if f6_local0 ~= nil then
			self:SetButtonDisabled( f6_local0 )
		end
	end )
	local PowerImage = nil
	
	PowerImage = LUI.UIImage.new()
	PowerImage.id = "PowerImage"
	PowerImage:SetDotPitchEnabled( true )
	PowerImage:SetDotPitchX( 0, 0 )
	PowerImage:SetDotPitchY( 0, 0 )
	PowerImage:SetDotPitchContrast( 0, 0 )
	PowerImage:SetDotPitchMode( 0 )
	PowerImage:SubscribeToModelThroughElement( self, "power.fullImage", function ()
		local f7_local0 = self:GetDataSource()
		f7_local0 = f7_local0.power.fullImage:GetValue( f5_local1 )
		if f7_local0 ~= nil then
			PowerImage:setImage( RegisterMaterial( f7_local0 ), 0 )
		end
	end )
	self:addElement( PowerImage )
	self.PowerImage = PowerImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonOver = function ()
			
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		self._sequences.ButtonDisabled = function ()
			
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		PowerImage:RegisterAnimationSequence( "UpdateImage", {
			{
				function ()
					return self.PowerImage:SetDotPitchX( 52, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchX( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetDotPitchY( 43, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchY( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetDotPitchContrast( 0.8, 0 )
				end,
				function ()
					return self.PowerImage:SetDotPitchContrast( 0, 300 )
				end
			},
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 0, 30 )
				end,
				function ()
					return self.PowerImage:SetAlpha( 1, 30 )
				end
			}
		} )
		self._sequences.UpdateImage = function ()
			PowerImage:AnimateSequence( "UpdateImage" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "button_over", function ( f27_arg0, f27_arg1 )
		local f27_local0 = f27_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	self:addEventHandler( "button_up", function ( f28_arg0, f28_arg1 )
		local f28_local0 = f28_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	self:addEventHandler( "button_disable", function ( f29_arg0, f29_arg1 )
		local f29_local0 = f29_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonDisabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f30_arg0, f30_arg1 )
		local f30_local0 = f30_arg1.controller or f5_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	self:addEventHandler( "button_action_disable", function ( f31_arg0, f31_arg1 )
		local f31_local0 = f31_arg1.controller or f5_local1
		if CONDITIONS.IsMultiplayer( self ) then
			local f31_local1 = self:GetDataSource()
			if f31_local1.power.isDisabledByPointCount:GetValue( f31_local0 ) ~= nil then
				f31_local1 = self:GetDataSource()
				if f31_local1.power.isDisabledByPointCount:GetValue( f31_local0 ) == true then
					ACTIONS.OpenLoadoutRemovalPopup( self, "CACLoadoutRemovalPopup", true, f31_local0 )
				end
			end
		end
	end )
	self:SubscribeToModelThroughElement( self, "power.fullImage", function ()
		ACTIONS.AnimateSequence( self, "UpdateImage" )
	end )
	f0_local0( self, f5_local1, controller )
	return self
end

MenuBuilder.registerType( "PowerItem", PowerItem )
LockTable( _M )
