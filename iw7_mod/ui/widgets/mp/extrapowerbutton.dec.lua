local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function AnimateExtraPowerButton( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg0:GetDataSource()
	if not f1_local0 then
		return 
	end
	local f1_local1 = f1_local0.extraUsed:GetValue( f1_arg2 )
	local f1_local2 = false
	if Engine.InFrontend() then
		f1_local2 = CONDITIONS.UseLoadoutRestrictions() and f1_local0.esportsLocked or f1_local0.extraDisabled:GetValue( f1_arg2 )
	end
	local f1_local3 = nil
	if f1_arg1 then
		if f1_local2 then
			f1_local3 = "ButtonOverDisabled"
		elseif f1_local1 then
			f1_local3 = "ButtonOverInUse"
		else
			f1_local3 = "ButtonOverNotInUse"
		end
	elseif f1_local2 then
		f1_local3 = "Disabled"
	elseif f1_local1 then
		f1_local3 = "ButtonUpInUse"
	else
		f1_local3 = "ButtonUpNotInUse"
	end
	if f1_local3 and f1_arg0._currentSequence ~= f1_local3 then
		ACTIONS.AnimateSequence( f1_arg0, f1_local3 )
		f1_arg0._currentSequence = f1_local3
	end
end

function ClearSlot( f2_arg0, f2_arg1 )
	ACTIONS.OnClearExtraPower( f2_arg0, f2_arg1 )
	ACTIONS.PlaySoundSetSound( f2_arg0, "selectAlt", false )
end

function PostLoadFunc( f3_arg0, f3_arg1, f3_arg2 )
	f3_arg0:addEventHandler( "refresh_widget", function ( f4_arg0, f4_arg1 )
		ACTIONS.AnimateSequence( f4_arg0, "RefreshWidget" )
	end )
	if Engine.InFrontend() then
		f3_arg0.PulseCover:SetBlendMode( BLEND_MODE.addWithAlpha )
	end
	if CONDITIONS.InGameSPOrFrontendMP() then
		f3_arg0:registerEventHandler( "button_over", function ( element, event )
			AnimateExtraPowerButton( element, true, f3_arg1 )
		end )
		f3_arg0:registerEventHandler( "button_over_disable", function ( element, event )
			AnimateExtraPowerButton( element, true, f3_arg1 )
		end )
		f3_arg0:registerEventHandler( "button_up", function ( element, event )
			AnimateExtraPowerButton( element, false, f3_arg1 )
		end )
		f3_arg0:registerEventHandler( "button_disable", function ( element, event )
			AnimateExtraPowerButton( element, false, f3_arg1 )
		end )
		f3_arg0:SubscribeToModelThroughElement( f3_arg0, "extraDisabled", function ()
			local f9_local0 = f3_arg0:GetDataSource()
			f9_local0 = f9_local0.extraDisabled:GetValue( f3_arg1 )
			local f9_local1 = CONDITIONS.UseLoadoutRestrictions()
			if f9_local1 then
				f9_local1 = f3_arg0:GetDataSource()
				f9_local1 = f9_local1.esportsLocked
			end
			f3_arg0:SetButtonDisabled( f9_local0 or f9_local1 )
		end )
	end
	f3_arg0:SubscribeToModelThroughElement( f3_arg0, "extraUsed", function ()
		AnimateExtraPowerButton( f3_arg0, f3_arg0:isInFocus(), f3_arg1 )
	end )
	
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	f3_arg0:addElement( bindButton )
	f3_arg0.bindButton = bindButton
	
	f3_arg0.bindButton:addEventHandler( "button_alt1", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg0:getParent()
		if #f11_local0:getAllFocusedChildren() <= 0 then
			f11_local0 = f11_arg0:getParent()
			if f11_local0:isInFocus() then
			
			else
				return false
			end
		end
		ClearSlot( f3_arg0, f3_arg1 )
		return true
	end )
	if CONDITIONS.IsCoreFrontendPC() then
		f3_arg0.ClearButton.SetupExtraUsedDataSourceSubscription()
		f3_arg0.ClearButton:addEventHandler( "button_action", function ( f12_arg0, f12_arg1 )
			ClearSlot( f3_arg0, f3_arg1 )
		end )
	end
end

function ExtraPowerButton( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 90 * _1080p )
	self.id = "ExtraPowerButton"
	self._animationSets = {}
	self._sequences = {}
	local f13_local1 = controller and controller.controllerIndex
	if not f13_local1 and not Engine.InFrontend() then
		f13_local1 = self:getRootController()
	end
	assert( f13_local1 )
	local f13_local2 = self
	local f13_local3 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f13_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f13_local1
		} )
		f13_local3.id = "GenericItemBackground"
		f13_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f13_local3 )
		self.GenericItemBackground = f13_local3
	end
	local PowerImage = nil
	
	PowerImage = LUI.UIImage.new()
	PowerImage.id = "PowerImage"
	PowerImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	PowerImage:SubscribeToModelThroughElement( self, "icon", function ()
		local f14_local0 = self:GetDataSource()
		f14_local0 = f14_local0.icon:GetValue( f13_local1 )
		if f14_local0 ~= nil then
			PowerImage:setImage( RegisterMaterial( f14_local0 ), 0 )
		end
	end )
	self:addElement( PowerImage )
	self.PowerImage = PowerImage
	
	local f13_local5 = nil
	if Engine.InFrontend() then
		f13_local5 = LUI.UIImage.new()
		f13_local5.id = "PulseCover"
		f13_local5:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f13_local5:SetAlpha( 0, 0 )
		f13_local5:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
		f13_local5:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0 )
		self:addElement( f13_local5 )
		self.PulseCover = f13_local5
	end
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:SetRGBFromInt( 10921638, 0 )
	Padlock:SetAlpha( 0, 0 )
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -18, _1080p * 18, _1080p * -18, _1080p * 18 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	local f13_local7 = nil
	if Engine.InFrontend() then
		f13_local7 = MenuBuilder.BuildRegisteredType( "PointCosts", {
			controllerIndex = f13_local1
		} )
		f13_local7.id = "ExtraPowerSlotOnePoints"
		f13_local7:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * -8, _1080p * -12, _1080p * -8 )
		self:addElement( f13_local7 )
		self.ExtraPowerSlotOnePoints = f13_local7
	end
	local f13_local8 = nil
	if Engine.InFrontend() then
		f13_local8 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
			controllerIndex = f13_local1
		} )
		f13_local8.id = "GenericButtonSelection"
		f13_local8:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f13_local8 )
		self.GenericButtonSelection = f13_local8
	end
	local f13_local9 = nil
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f13_local9 = MenuBuilder.BuildRegisteredType( "ClearButton", {
			controllerIndex = f13_local1
		} )
		f13_local9.id = "ClearButton"
		if CONDITIONS.IsCoreFrontendPC( self ) then
			f13_local9:SetDataSourceThroughElement( self, nil )
		end
		f13_local9:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -32, _1080p * -4, _1080p * 4, _1080p * 32 )
		self:addElement( f13_local9 )
		self.ClearButton = f13_local9
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
			f13_local5:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 1, 100 )
					end
				}
			} )
		end
		self._sequences.ButtonOverInUse = function ()
			PowerImage:AnimateSequence( "ButtonOverInUse" )
			if Engine.InFrontend() then
				f13_local5:AnimateSequence( "ButtonOverInUse" )
			end
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "ButtonOverInUse" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.PowerImage:SetScale( 0.05, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f13_local5:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 1, 100 )
					end
				}
			} )
		end
		self._sequences.ButtonOverNotInUse = function ()
			PowerImage:AnimateSequence( "ButtonOverNotInUse" )
			if Engine.InFrontend() then
				f13_local5:AnimateSequence( "ButtonOverNotInUse" )
			end
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "ButtonOverNotInUse" )
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
			f13_local5:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		self._sequences.ButtonUpInUse = function ()
			PowerImage:AnimateSequence( "ButtonUpInUse" )
			if Engine.InFrontend() then
				f13_local5:AnimateSequence( "ButtonUpInUse" )
			end
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "ButtonUpInUse" )
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
			f13_local5:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "ButtonUpNotInUse", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 1, 200 )
					end
				}
			} )
		end
		self._sequences.ButtonUpNotInUse = function ()
			PowerImage:AnimateSequence( "ButtonUpNotInUse" )
			if Engine.InFrontend() then
				f13_local5:AnimateSequence( "ButtonUpNotInUse" )
			end
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "ButtonUpNotInUse" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "Disabled", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 0, 200 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			PowerImage:AnimateSequence( "Disabled" )
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "Disabled" )
			end
		end
		
		PowerImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.PowerImage:SetAlpha( 0, 100 )
				end
			}
		} )
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 0, 100 )
					end
				}
			} )
		end
		self._sequences.ButtonOverDisabled = function ()
			PowerImage:AnimateSequence( "ButtonOverDisabled" )
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "ButtonOverDisabled" )
			end
		end
		
		if Engine.InFrontend() then
			f13_local5:RegisterAnimationSequence( "RefreshWidget", {
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
						return self.PulseCover:SetAlpha( 0, 30 )
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
				f13_local5:AnimateSequence( "RefreshWidget" )
			end
		end
		
		Padlock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Padlock:SetAlpha( 0.2, 0 )
				end
			},
			{
				function ()
					return self.Padlock:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f13_local7:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.ExtraPowerSlotOnePoints:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		self._sequences.Locked = function ()
			Padlock:AnimateSequence( "Locked" )
			if Engine.InFrontend() then
				f13_local7:AnimateSequence( "Locked" )
			end
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if CONDITIONS.IsCoreFrontendPC( self ) then
		f13_local9:SetDataSourceThroughElement( self, nil )
	end
	PostLoadFunc( self, f13_local1, controller )
	return self
end

MenuBuilder.registerType( "ExtraPowerButton", ExtraPowerButton )
LockTable( _M )
