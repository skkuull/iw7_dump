local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:SubscribeToModel( DataSources.inGame.HUD.hints.warning.shouldShow:GetModel( f1_arg1 ), function ( f2_arg0 )
		if DataModel.GetModelValue( f2_arg0 ) then
			local f2_local0 = Game.GetOmnvar( "ui_hud_warning" )
			local f2_local1 = Engine.TableLookup( CSV.warningMessages.file, CSV.warningMessages.cols.index, f2_local0, CSV.warningMessages.cols.text )
			if f2_local0 > 0 and (not f2_local1 or f2_local1 == "") then
				DebugPrint( "Unknown message type detected for ui_hud_warning - check hudwarnings.csv" )
				return 
			end
			local f2_local2 = Engine.TableLookup( CSV.warningMessages.file, CSV.warningMessages.cols.index, f2_local0, CSV.warningMessages.cols.material )
			local f2_local3 = Engine.TableLookup( CSV.warningMessages.file, CSV.warningMessages.cols.index, f2_local0, CSV.warningMessages.cols.color )
			local f2_local4 = Engine.TableLookup( CSV.warningMessages.file, CSV.warningMessages.cols.index, f2_local0, CSV.warningMessages.cols.flashRate )
			local f2_local5 = nil
			if f2_local3 and SWATCHES.HUDWarnings[f2_local3] then
				f2_local5 = GetIntForColor( SWATCHES.HUDWarnings[f2_local3] )
			else
				DebugPrint( "Unknown color " .. f2_local3 .. " used for hud warning. Be sure the color is in the HUDWarnings swatch" )
				f2_local5 = GetIntForColor( SWATCHES.HUDWarnings.default )
			end
			DataModel.SetModelValue( DataSources.inGame.HUD.hints.warning.icon:GetModel( f1_arg1 ), f2_local2 or "" )
			local f2_local6 = DataModel.SetModelValue
			local f2_local7 = DataSources.inGame.HUD.hints.warning.text:GetModel( f1_arg1 )
			local f2_local8
			if f2_local1 then
				f2_local8 = Engine.Localize( f2_local1 )
				if not f2_local8 then
				
				else
					f2_local6( f2_local7, f2_local8 )
					DataModel.SetModelValue( DataSources.inGame.HUD.hints.warning.color:GetModel( f1_arg1 ), f2_local5 )
					if not f1_arg0._sequences[f2_local4] then
						DebugPrint( "Unknown flash anim " .. f2_local4 .. " used for hud warning. Be sure the anim is in the WarningMessage widget" )
						assert( f1_arg0._sequences.none )
						f2_local4 = "none"
					end
					ACTIONS.AnimateSequence( f1_arg0, f2_local4 )
				end
			end
			f2_local8 = ""
		else
			ACTIONS.AnimateSequence( f1_arg0, "fadeOut" )
		end
	end )
end

function WarningMessage( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 350 * _1080p, 0, 90 * _1080p )
	self.id = "WarningMessage"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local WarningMessageContent0 = nil
	
	WarningMessageContent0 = MenuBuilder.BuildRegisteredType( "WarningMessageContent", {
		controllerIndex = f3_local1
	} )
	WarningMessageContent0.id = "WarningMessageContent0"
	WarningMessageContent0:SetAlpha( 0, 0 )
	WarningMessageContent0:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 350, 0, _1080p * 90 )
	self:addElement( WarningMessageContent0 )
	self.WarningMessageContent0 = WarningMessageContent0
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		WarningMessageContent0:RegisterAnimationSequence( "none", {
			{
				function ()
					return self.WarningMessageContent0:SetAlpha( 1, 350 )
				end
			}
		} )
		self._sequences.none = function ()
			WarningMessageContent0:AnimateSequence( "none" )
		end
		
		WarningMessageContent0:RegisterAnimationSequence( "slow", {
			{
				function ()
					return self.WarningMessageContent0:SetAlpha( 1, 1000 )
				end,
				function ()
					return self.WarningMessageContent0:SetAlpha( 0, 1000 )
				end
			}
		} )
		self._sequences.slow = function ()
			WarningMessageContent0:AnimateLoop( "slow" )
		end
		
		WarningMessageContent0:RegisterAnimationSequence( "medium", {
			{
				function ()
					return self.WarningMessageContent0:SetAlpha( 1, 500 )
				end,
				function ()
					return self.WarningMessageContent0:SetAlpha( 0, 500 )
				end
			}
		} )
		self._sequences.medium = function ()
			WarningMessageContent0:AnimateLoop( "medium" )
		end
		
		WarningMessageContent0:RegisterAnimationSequence( "fast", {
			{
				function ()
					return self.WarningMessageContent0:SetAlpha( 1, 260 )
				end,
				function ()
					return self.WarningMessageContent0:SetAlpha( 0, 340 )
				end
			}
		} )
		self._sequences.fast = function ()
			WarningMessageContent0:AnimateLoop( "fast" )
		end
		
		WarningMessageContent0:RegisterAnimationSequence( "fadeOut", {
			{
				function ()
					return self.WarningMessageContent0:SetAlpha( 0, 600 )
				end
			}
		} )
		self._sequences.fadeOut = function ()
			WarningMessageContent0:AnimateSequence( "fadeOut" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local0( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "WarningMessage", WarningMessage )
LockTable( _M )
