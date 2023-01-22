local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg0.AttachmentImage )
	if Engine.InFrontend() then
		f1_arg0.PulseCover:SetBlendMode( BLEND_MODE.addWithAlpha )
	end
	Cac.HandleFramedLoadoutItemAnimation( f1_arg0, f1_arg1 )
	local f1_local0 = CONDITIONS.UseLoadoutRestrictions()
	if f1_local0 then
		f1_local0 = not LOADOUT.IsSlotUnlocked( f1_arg1, LOADOUT.SlotTypes.OVERKILL, nil, nil, true )
	end
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "used", function ()
		local f2_local0 = f1_arg0:GetDataSource()
		f2_local0 = f2_local0.used:GetValue( f1_arg1 )
		if f2_local0 ~= nil and f2_local0 then
			f1_arg0.AttachmentImage:setImage( RegisterMaterial( "icon_slot_overkill" ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "OverkillOn" )
		else
			f1_arg0.AttachmentImage:setImage( RegisterMaterial( "icon_slot_overkill_empty" ), 0 )
			ACTIONS.AnimateSequence( f1_arg0, "OverkillOffInstant" )
		end
	end )
	if f1_local0 then
		f1_arg0:SetButtonDisabled( true )
	end
end

function Overkill( menu, controller )
	local self = LUI.UIButton.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 95 * _1080p, 0, 90 * _1080p )
	self.id = "Overkill"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local f3_local3 = nil
	if CONDITIONS.InGameSPOrFrontendMP( self ) then
		f3_local3 = MenuBuilder.BuildRegisteredType( "GenericItemBackground", {
			controllerIndex = f3_local1
		} )
		f3_local3.id = "GenericItemBackground"
		f3_local3:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f3_local3 )
		self.GenericItemBackground = f3_local3
	end
	local AttachmentImage = nil
	
	AttachmentImage = LUI.UIImage.new()
	AttachmentImage.id = "AttachmentImage"
	AttachmentImage:SetAlpha( 0.5, 0 )
	AttachmentImage:setImage( RegisterMaterial( "icon_slot_overkill" ), 0 )
	AttachmentImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32 )
	self:addElement( AttachmentImage )
	self.AttachmentImage = AttachmentImage
	
	local f3_local5 = nil
	if Engine.InFrontend() then
		f3_local5 = MenuBuilder.BuildRegisteredType( "PointCosts", {
			controllerIndex = f3_local1
		} )
		f3_local5.id = "PointCosts"
		if Engine.InFrontend() then
			f3_local5:SetDataSourceThroughElement( self, "pointCost" )
		end
		f3_local5:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -103, _1080p * -8, _1080p * -12, _1080p * -8 )
		self:addElement( f3_local5 )
		self.PointCosts = f3_local5
	end
	local f3_local6 = nil
	if Engine.InFrontend() then
		f3_local6 = LUI.UIImage.new()
		f3_local6.id = "PulseCover"
		f3_local6:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
		f3_local6:SetAlpha( 0, 0 )
		f3_local6:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
		f3_local6:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -170, 0, 0, 0 )
		self:addElement( f3_local6 )
		self.PulseCover = f3_local6
	end
	local Padlock = nil
	
	Padlock = LUI.UIImage.new()
	Padlock.id = "Padlock"
	Padlock:SetAlpha( 0, 0 )
	Padlock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Padlock:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -30, 0, _1080p * -32, _1080p * -2 )
	self:addElement( Padlock )
	self.Padlock = Padlock
	
	local f3_local8 = nil
	if Engine.InFrontend() then
		f3_local8 = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
			controllerIndex = f3_local1
		} )
		f3_local8.id = "GenericButtonSelection"
		f3_local8:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
		self:addElement( f3_local8 )
		self.GenericButtonSelection = f3_local8
	end
	local ConnectorTop = nil
	
	ConnectorTop = LUI.UIImage.new()
	ConnectorTop.id = "ConnectorTop"
	ConnectorTop:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	ConnectorTop:SetAlpha( 0, 0 )
	ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -18, _1080p * -10 )
	self:addElement( ConnectorTop )
	self.ConnectorTop = ConnectorTop
	
	local ConnectorMid = nil
	
	ConnectorMid = LUI.UIImage.new()
	ConnectorMid.id = "ConnectorMid"
	ConnectorMid:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	ConnectorMid:SetAlpha( 0, 0 )
	ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -4, _1080p * 4 )
	self:addElement( ConnectorMid )
	self.ConnectorMid = ConnectorMid
	
	local ConnectorBottom = nil
	
	ConnectorBottom = LUI.UIImage.new()
	ConnectorBottom.id = "ConnectorBottom"
	ConnectorBottom:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
	ConnectorBottom:SetAlpha( 0, 0 )
	ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * 10, _1080p * 18 )
	self:addElement( ConnectorBottom )
	self.ConnectorBottom = ConnectorBottom
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 50 )
				end
			}
		} )
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "ButtonOverInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		ConnectorTop:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.ConnectorTop:SetRGBFromInt( 16767586, 50 )
				end
			},
			{
				function ()
					return self.ConnectorTop:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -18, _1080p * -10, 50 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.ConnectorMid:SetRGBFromInt( 16767586, 50 )
				end
			},
			{
				function ()
					return self.ConnectorMid:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -4, _1080p * 4, 50 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "ButtonOverInUse", {
			{
				function ()
					return self.ConnectorBottom:SetRGBFromInt( 16767586, 50 )
				end
			},
			{
				function ()
					return self.ConnectorBottom:SetAlpha( 1, 50 )
				end
			},
			{
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * 10, _1080p * 18, 50 )
				end
			}
		} )
		self._sequences.ButtonOverInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonOverInUse" )
			if Engine.InFrontend() then
				f3_local6:AnimateSequence( "ButtonOverInUse" )
			end
			ConnectorTop:AnimateSequence( "ButtonOverInUse" )
			ConnectorMid:AnimateSequence( "ButtonOverInUse" )
			ConnectorBottom:AnimateSequence( "ButtonOverInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0.4, 50 )
				end
			}
		} )
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "ButtonOverNotInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		ConnectorTop:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.ConnectorTop:SetRGBFromInt( 16767586, 50 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.ConnectorMid:SetRGBFromInt( 16767586, 50 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "ButtonOverNotInUse", {
			{
				function ()
					return self.ConnectorBottom:SetRGBFromInt( 16767586, 50 )
				end
			}
		} )
		self._sequences.ButtonOverNotInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonOverNotInUse" )
			if Engine.InFrontend() then
				f3_local6:AnimateSequence( "ButtonOverNotInUse" )
			end
			ConnectorTop:AnimateSequence( "ButtonOverNotInUse" )
			ConnectorMid:AnimateSequence( "ButtonOverNotInUse" )
			ConnectorBottom:AnimateSequence( "ButtonOverNotInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 1, 50 )
				end
			}
		} )
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "ButtonUpInUse", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		ConnectorTop:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.ConnectorTop:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			},
			{
				function ()
					return self.ConnectorTop:SetAlpha( 0.5, 50 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.ConnectorMid:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			},
			{
				function ()
					return self.ConnectorMid:SetAlpha( 0.5, 50 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "ButtonUpInUse", {
			{
				function ()
					return self.ConnectorBottom:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			},
			{
				function ()
					return self.ConnectorBottom:SetAlpha( 0.5, 50 )
				end
			}
		} )
		self._sequences.ButtonUpInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonUpInUse" )
			if Engine.InFrontend() then
				f3_local6:AnimateSequence( "ButtonUpInUse" )
			end
			ConnectorTop:AnimateSequence( "ButtonUpInUse" )
			ConnectorMid:AnimateSequence( "ButtonUpInUse" )
			ConnectorBottom:AnimateSequence( "ButtonUpInUse" )
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0.4, 50 )
				end
			}
		} )
		ConnectorTop:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.ConnectorTop:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.ConnectorMid:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "ButtonUpNotInUse", {
			{
				function ()
					return self.ConnectorBottom:SetRGBFromTable( SWATCHES.genericButton.textDefault, 50 )
				end
			}
		} )
		self._sequences.ButtonUpNotInUse = function ()
			AttachmentImage:AnimateSequence( "ButtonUpNotInUse" )
			ConnectorTop:AnimateSequence( "ButtonUpNotInUse" )
			ConnectorMid:AnimateSequence( "ButtonUpNotInUse" )
			ConnectorBottom:AnimateSequence( "ButtonUpNotInUse" )
		end
		
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "RefreshWidget", {
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
				f3_local6:AnimateSequence( "RefreshWidget" )
			end
		end
		
		ConnectorTop:RegisterAnimationSequence( "OverkillOn", {
			{
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * -10, 0 )
				end,
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -18, _1080p * -10, 100 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "OverkillOn", {
			{
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -4, _1080p * 4, 100 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "OverkillOn", {
			{
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 18, 0 )
				end,
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * 10, _1080p * 18, 100 )
				end
			}
		} )
		self._sequences.OverkillOn = function ()
			ConnectorTop:AnimateSequence( "OverkillOn" )
			ConnectorMid:AnimateSequence( "OverkillOn" )
			ConnectorBottom:AnimateSequence( "OverkillOn" )
		end
		
		ConnectorTop:RegisterAnimationSequence( "OverkillOff", {
			{
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -18, _1080p * -10, 0 )
				end,
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * -10, 100 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "OverkillOff", {
			{
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -4, _1080p * 4, 0 )
				end,
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -4, _1080p * 4, 100 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "OverkillOff", {
			{
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * 10, _1080p * 18, 0 )
				end,
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 18, 100 )
				end
			}
		} )
		self._sequences.OverkillOff = function ()
			ConnectorTop:AnimateSequence( "OverkillOff" )
			ConnectorMid:AnimateSequence( "OverkillOff" )
			ConnectorBottom:AnimateSequence( "OverkillOff" )
		end
		
		ConnectorTop:RegisterAnimationSequence( "OverkillOnInstant", {
			{
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -18, _1080p * -10, 0 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "OverkillOnInstant", {
			{
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "OverkillOnInstant", {
			{
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * -6, 0, _1080p * 10, _1080p * 18, 0 )
				end
			}
		} )
		self._sequences.OverkillOnInstant = function ()
			ConnectorTop:AnimateSequence( "OverkillOnInstant" )
			ConnectorMid:AnimateSequence( "OverkillOnInstant" )
			ConnectorBottom:AnimateSequence( "OverkillOnInstant" )
		end
		
		ConnectorTop:RegisterAnimationSequence( "OverkillOffInstant", {
			{
				function ()
					return self.ConnectorTop:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -18, _1080p * -10, 0 )
				end
			}
		} )
		ConnectorMid:RegisterAnimationSequence( "OverkillOffInstant", {
			{
				function ()
					return self.ConnectorMid:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * -4, _1080p * 4, 0 )
				end
			}
		} )
		ConnectorBottom:RegisterAnimationSequence( "OverkillOffInstant", {
			{
				function ()
					return self.ConnectorBottom:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, 0, 0, _1080p * 10, _1080p * 18, 0 )
				end
			}
		} )
		self._sequences.OverkillOffInstant = function ()
			ConnectorTop:AnimateSequence( "OverkillOffInstant" )
			ConnectorMid:AnimateSequence( "OverkillOffInstant" )
			ConnectorBottom:AnimateSequence( "OverkillOffInstant" )
		end
		
		if Engine.InFrontend() then
			f3_local5:RegisterAnimationSequence( "Enabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 1, 0 )
					end
				}
			} )
		end
		self._sequences.Enabled = function ()
			if Engine.InFrontend() then
				f3_local5:AnimateSequence( "Enabled" )
			end
		end
		
		AttachmentImage:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.AttachmentImage:SetAlpha( 0.5, 50 )
				end
			}
		} )
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "ButtonOverDisabled", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.yellowHighlight, 0 )
					end
				}
			} )
		end
		self._sequences.ButtonOverDisabled = function ()
			AttachmentImage:AnimateSequence( "ButtonOverDisabled" )
			if Engine.InFrontend() then
				f3_local6:AnimateSequence( "ButtonOverDisabled" )
			end
		end
		
		if Engine.InFrontend() then
			f3_local5:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.PointCosts:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		if Engine.InFrontend() then
			f3_local6:RegisterAnimationSequence( "Disabled", {
				{
					function ()
						return self.PulseCover:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
					end
				}
			} )
		end
		self._sequences.Disabled = function ()
			if Engine.InFrontend() then
				f3_local5:AnimateSequence( "Disabled" )
			end
			if Engine.InFrontend() then
				f3_local6:AnimateSequence( "Disabled" )
			end
		end
		
		AttachmentImage:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.AttachmentImage:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -30, _1080p * 30, _1080p * -30, _1080p * 30, 0 )
				end
			}
		} )
		if Engine.InFrontend() then
			f3_local5:RegisterAnimationSequence( "Locked", {
				{
					function ()
						return self.PointCosts:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		Padlock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Padlock:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.Padlock:SetRGBFromInt( 10921638, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			AttachmentImage:AnimateSequence( "Locked" )
			if Engine.InFrontend() then
				f3_local5:AnimateSequence( "Locked" )
			end
			Padlock:AnimateSequence( "Locked" )
		end
		
		self._sequences.Pulse = function ()
			
		end
		
		self._sequences.PulseStop = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	if Engine.InFrontend() then
		f3_local5:SetDataSourceThroughElement( self, "pointCost" )
	end
	local bindButton = LUI.UIBindButton.new()
	bindButton.id = "selfBindButton"
	self:addElement( bindButton )
	self.bindButton = bindButton
	
	self:addEventHandler( "button_disable", function ( f86_arg0, f86_arg1 )
		local f86_local0 = f86_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "Disabled" )
	end )
	self:addEventHandler( "button_over_disable", function ( f87_arg0, f87_arg1 )
		local f87_local0 = f87_arg1.controller or f3_local1
		ACTIONS.AnimateSequence( self, "ButtonOverDisabled" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Overkill", Overkill )
LockTable( _M )
