local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ClearSlot( f1_arg0, f1_arg1 )
	ACTIONS.OnClearPower( f1_arg0, f1_arg1 )
	ACTIONS.PlaySoundSetSound( f1_arg0, "selectAlt", false )
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	if Engine.InFrontend() then
		f2_arg0.PulseCover:SetBlendMode( BLEND_MODE.addWithAlpha )
	end
	local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
	if CONDITIONS.UseCACBreadCrumbs() and not f2_local0.hideWeaponBreadcrumbs then
		local bindButton = f2_arg0:SubscribeToDataSourceThroughElement( f2_arg0, nil, function ()
			assert( f2_arg0.NewItemNotification )
			local f3_local0 = f2_arg0:GetDataSource()
			local f3_local1 = POWER_LIST[f3_local0.slot:GetValue( f2_arg1 ) + 1]
			local f3_local2 = false
			for f3_local6, f3_local7 in pairs( f3_local1 ) do
				if Rewards.IsNew( f2_arg1, "power", Engine.TableLookupGetRowNum( CSV.powerUnlockTable.file, CSV.powerUnlockTable.cols.ref, f3_local6 ) ) then
					f3_local2 = true
					break
				end
			end
			if f3_local2 then
				f2_arg0.NewItemNotification:SetAlpha( 1, 0 )
			else
				f2_arg0.NewItemNotification:SetAlpha( 0, 0 )
			end
		end )
		bindButton.unlinkOnCallback = true
	end
	Cac.HandleFramedLoadoutItemAnimation( f2_arg0, f2_arg1 )
	f2_arg0:addEventHandler( "refresh_widget", function ( f4_arg0, f4_arg1 )
		ACTIONS.AnimateSequence( f4_arg0, "RefreshWidget" )
	end )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f2_arg0:addElement( bindButton )
	f2_arg0.bindButton = bindButton
	
	f2_arg0.bindButton:addEventHandler( "button_alt1", function ( f5_arg0, f5_arg1 )
		local f5_local0 = f5_arg0:getParent()
		if #f5_local0:getAllFocusedChildren() <= 0 then
			f5_local0 = f5_arg0:getParent()
			if f5_local0:isInFocus() then
			
			else
				return false
			end
		end
		ClearSlot( f2_arg0, f2_arg1 )
		return true
	end )
	if Engine.IsSingleplayer() then
		f2_arg0.bindButton:addEventHandler( "button_alt2", function ( f6_arg0, f6_arg1 )
			local f6_local0 = f6_arg0:getParent()
			if #f6_local0:getAllFocusedChildren() <= 0 then
				f6_local0 = f6_arg0:getParent()
				if f6_local0:isInFocus() then
				
				else
					
				end
			end
			f6_local0 = f2_arg0:GetCurrentMenu()
			local f6_local1 = f6_local0.SPLoadout:GetDataSource()
			local f6_local2 = f6_local1.slot:GetValue( f2_arg1 )
			local f6_local3 = f2_arg0:GetDataSource()
			VRManager.RunVRRoom( f6_local1, f6_local3.ref:GetValue( f2_arg1 ), VRManager.ItemType.POWER, f2_arg1 )
			return true
		end )
		f2_arg0:SubscribeToModelThroughElement( f2_arg0, "extraDisabled", function ()
			local f7_local0 = f2_arg0:GetDataSource()
			local f7_local1 = f7_local0.extraDisabled:GetValue( f2_arg1 )
			if f7_local1 ~= nil then
				f2_arg0:SetButtonDisabled( f7_local1 )
				if f7_local1 then
					ACTIONS.AnimateSequence( f2_arg0, "Disabled" )
					f7_local0.ref:SetValue( f2_arg1, "none" )
				else
					ACTIONS.AnimateSequence( f2_arg0, "NotDisabled" )
				end
			end
		end )
	end
	if CONDITIONS.IsCoreFrontendPC() then
		f2_arg0.ClearButton:addEventHandler( "button_action", function ( f8_arg0, f8_arg1 )
			ClearSlot( f2_arg0, f2_arg1 )
		end )
	end
end

function PowerButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 90 * _1080p )
	self.id = "PowerButton"
	self._animationSets = {}
	self._sequences = {}
	local f9_local1 = controller and controller.controllerIndex
	if not f9_local1 and not Engine.InFrontend() then
		f9_local1 = self:getRootController()
	end
	assert( f9_local1 )
	local f9_local2 = self
	self:setUseStencil( true )
	local f9_local3 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f9_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f9_local1
		} )
		f9_local3.id = "GenericItemBackground"
		f9_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f9_local3 )
		self.GenericItemBackground = f9_local3
	end
	local PowerImage = nil
	
	PowerImage = LUI.UIImage.new()
	PowerImage.id = "PowerImage"
	PowerImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	PowerImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f10_local0 = self:GetDataSource()
		f10_local0 = f10_local0.icon:GetValue( f9_local1 )
		if f10_local0 ~= nil then
			PowerImage:setImage( RegisterMaterial( f10_local0 ), 0 )
		end
	end )
	self:addElement( PowerImage )
	self.PowerImage = PowerImage
	
	local f9_local5 = nil
	if Engine.InFrontend() then
		f9_local5 = LUI.UIImage.new()
		f9_local5.id = "PulseCover"
		f9_local5:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f9_local5:SetAlpha( 0, 0 )
		f9_local5:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
		f9_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0 )
		self:addElement( f9_local5 )
		self.PulseCover = f9_local5
	end
	local f9_local6 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f9_local6 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
			controllerIndex = f9_local1
		} )
		f9_local6.id = "GenericButtonSelection"
		f9_local6:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f9_local6 )
		self.GenericButtonSelection = f9_local6
	end
	local f9_local7 = nil
	if Engine.InFrontend() then
		f9_local7 = MenuBuilder.BuildRegisteredType( "PointCosts", {
			controllerIndex = f9_local1
		} )
		f9_local7.id = "PowerSlotOnePoints"
		f9_local7:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * -8, _1080p * -12, _1080p * -8 )
		self:addElement( f9_local7 )
		self.PowerSlotOnePoints = f9_local7
	end
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:SetAlpha( 0, 0 )
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -18, _1080p * 18 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	local f9_local9 = nil
	if CONDITIONS.UseCACBreadCrumbs( self ) then
		f9_local9 = MenuBuilder.BuildRegisteredType( "NewItemNotification", {
			controllerIndex = f9_local1
		} )
		f9_local9.id = "NewItemNotification"
		f9_local9:SetAlpha( 0, 0 )
		f9_local9:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -31, _1080p * 33 )
		self:addElement( f9_local9 )
		self.NewItemNotification = f9_local9
	end
	local f9_local10 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f9_local10 = MenuBuilder.BuildRegisteredType( "ClearButton", {
			controllerIndex = f9_local1
		} )
		f9_local10.id = "ClearButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f9_local10:SetDataSourceThroughElement( self, nil )
		end
		f9_local10:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, _1080p * -4, _1080p * 4, _1080p * 32 )
		self:addElement( f9_local10 )
		self.ClearButton = f9_local10
	end
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.PowerImage:SetAlpha( 1, 100 )
				end
			},
			{
				function ()
					return self.PowerImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local5:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverInUse = function ()
			PowerImage:AnimateSequence( "ButtonOverInUse" )
			if Engine.InFrontend() then
				f9_local5:AnimateSequence( "ButtonOverInUse" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.PowerImage:SetAlpha( 1, 200 )
				end
			},
			{
				function ()
					return self.PowerImage:SetScale( 0, 200 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local5:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUpInUse = function ()
			PowerImage:AnimateSequence( "ButtonUpInUse" )
			if Engine.InFrontend() then
				f9_local5:AnimateSequence( "ButtonUpInUse" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PowerImage:SetScale( 0.05, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local5:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverNotInUse = function ()
			PowerImage:AnimateSequence( "ButtonOverNotInUse" )
			if Engine.InFrontend() then
				f9_local5:AnimateSequence( "ButtonOverNotInUse" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end
			},
			{
				function ()
					return self.PowerImage:SetScale( 0, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f9_local5:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonUpNotInUse = function ()
			PowerImage:AnimateSequence( "ButtonUpNotInUse" )
			if Engine.InFrontend() then
				f9_local5:AnimateSequence( "ButtonUpNotInUse" )
			end
		end
		
		if Engine.InFrontend() then
			f9_local5:RegisterAnimationSequence( "RefreshWidget", {
				{
					function ()
						return self.PulseCover:SetAlpha( 0, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0.3, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0.3, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0.3, 30 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0.5, 420 )
					end,
					function ()
						return self.PulseCover:SetAlpha( 0, 10 )
					end
				},
				{
					function ()
						return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0, 180 )
					end,
					function ()
						return self.PulseCover:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 95, 0, 0, 0, 420 )
					end
				}
			} )
		end
		self._sequences.RefreshWidget = function ()
			if Engine.InFrontend() then
				f9_local5:AnimateSequence( "RefreshWidget" )
			end
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
		PowerImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end
			}
		} )
		Padlock:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.Padlock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Disabled = function ()
			PowerImage:AnimateSequence( "Disabled" )
			Padlock:AnimateSequence( "Disabled" )
		end
		
		Padlock:RegisterAnimationSequence( "NotDisabled", {
			{
				function ()
					return self.Padlock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.NotDisabled = function ()
			Padlock:AnimateSequence( "NotDisabled" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f9_local10:SetDataSourceThroughElement( self, nil )
	end
	self:addEventHandler( "button_over", function ( f47_arg0, f47_arg1 )
		local f47_local0 = f47_arg1.controller or f9_local1
		ACTIONS.ScriptNotify( "none", 0 )
	end )
	PostLoadFunc( self, f9_local1, controller )
	return self
end

MenuBuilder.registerType( "PowerButton", PowerButton )
LockTable( _M )
