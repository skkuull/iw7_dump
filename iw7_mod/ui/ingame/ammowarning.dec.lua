local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = {
	NO_AMMO = 0,
	LOW_AMMO = 1,
	RELOAD = 2,
	OK = 3
}
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.PLATFORM_RELOAD_CAPS = Engine.Localize( "PLATFORM_RELOAD_CAPS" )
	f1_arg0.PLATFORM_NO_AMMO_CAPS = Engine.Localize( "PLATFORM_NO_AMMO_CAPS" )
	f1_arg0.PLATFORM_LOW_AMMO_NO_RELOAD_CAPS = Engine.Localize( "PLATFORM_LOW_AMMO_NO_RELOAD_CAPS" )
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.ammoWarningState:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		local f2_local1
		if f2_local0 == f0_local0.NO_AMMO then
			f2_local1 = "WarningOn"
			if not f2_local1 then
			
			else
				if f1_arg0.currentWarning ~= f2_local1 then
					ACTIONS.AnimateSequenceByElement( f1_arg0, {
						elementName = "WarningGlow",
						sequenceName = f2_local1,
						elementPath = "WarningGlow"
					} )
					f1_arg0.currentWarning = f2_local1
				end
				local f2_local2 = nil
				if f2_local0 == f0_local0.NO_AMMO then
					f2_local2 = "NoAmmo"
				elseif f2_local0 == f0_local0.LOW_AMMO then
					f2_local2 = "LowAmmo"
				elseif f2_local0 == f0_local0.RELOAD then
					f2_local2 = "Reload"
				else
					f2_local2 = "Hide"
				end
				if f1_arg0.currentAnimation ~= f2_local2 then
					ACTIONS.AnimateSequence( f1_arg0, f2_local2 )
					f1_arg0.currentAnimation = f2_local2
					local f2_local3 = nil
					if f2_local0 == f0_local0.NO_AMMO then
						f2_local3 = f1_arg0.PLATFORM_NO_AMMO_CAPS
					elseif f2_local0 == f0_local0.LOW_AMMO then
						f2_local3 = f1_arg0.PLATFORM_LOW_AMMO_NO_RELOAD_CAPS
					elseif f2_local0 == f0_local0.RELOAD then
						if Engine.IsConsoleGame() then
							f2_local3 = f1_arg0.PLATFORM_RELOAD_CAPS
						else
							if Engine.IsGamepadEnabled() == 1 then
								local f2_local4 = "PLATFORM_RELOAD_GAMEPAD_CAPS"
							end
							f2_local3 = ToUpperCase( Engine.Localize( f2_local4 or "PLATFORM_RELOAD" ) )
						end
					else
						f2_local3 = ""
					end
					f1_arg0.MessageText:setText( f2_local3 )
				end
			end
		end
		f2_local1 = "WarningOff"
	end )
end

function AmmoWarning( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 500 * _1080p, 0, 34 * _1080p )
	self.id = "AmmoWarning"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local WarningGlow = nil
	
	WarningGlow = MenuBuilder.BuildRegisteredType( "WarningGlow", {
		controllerIndex = f3_local1
	} )
	WarningGlow.id = "WarningGlow"
	WarningGlow:SetAlpha( 0.5, 0 )
	WarningGlow:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( WarningGlow )
	self.WarningGlow = WarningGlow
	
	local MessageText = nil
	
	MessageText = LUI.UIText.new()
	MessageText.id = "MessageText"
	MessageText:setText( "", 0 )
	MessageText:SetFontSize( 32 * _1080p )
	MessageText:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
	MessageText:SetAlignment( LUI.Alignment.Center )
	MessageText:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * -5.5, _1080p * 5.5, _1080p * 0.75, _1080p * -0.75 )
	self:addElement( MessageText )
	self.MessageText = MessageText
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		MessageText:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.MessageText:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			MessageText:AnimateSequence( "Hide" )
		end
		
		MessageText:RegisterAnimationSequence( "LowAmmo", {
			{
				function ()
					return self.MessageText:SetRGBFromTable( SWATCHES.HUD.caution, 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.LowAmmo = function ()
			MessageText:AnimateSequence( "LowAmmo" )
		end
		
		MessageText:RegisterAnimationSequence( "NoAmmo", {
			{
				function ()
					return self.MessageText:SetRGBFromTable( SWATCHES.HUD.warning, 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.NoAmmo = function ()
			MessageText:AnimateSequence( "NoAmmo" )
		end
		
		MessageText:RegisterAnimationSequence( "Reload", {
			{
				function ()
					return self.MessageText:SetRGBFromTable( SWATCHES.HUD.stable, 0 )
				end
			},
			{
				function ()
					return self.MessageText:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Reload = function ()
			MessageText:AnimateSequence( "Reload" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "AmmoWarning", AmmoWarning )
LockTable( _M )
