local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RefreshAnimation( f1_arg0, f1_arg1 )
	if f1_arg0._lastState ~= f1_arg1 then
		f1_arg0._lastState = f1_arg1
		ACTIONS.AnimateSequence( f1_arg0, f1_arg1 )
	end
end

function PostLoadFunc( f2_arg0, f2_arg1, f2_arg2 )
	f2_arg0:addEventHandler( "button_over", function ( f3_arg0, f3_arg1 )
		RefreshAnimation( f3_arg0, "ButtonOver" )
	end )
	f2_arg0:addEventHandler( "button_up", function ( f4_arg0, f4_arg1 )
		RefreshAnimation( f4_arg0, "ButtonUp" )
	end )
	f2_arg0:addEventHandler( "button_disable", function ( f5_arg0, f5_arg1 )
		RefreshAnimation( f5_arg0, "ButtonUpDisabled" )
	end )
	f2_arg0:addEventHandler( "button_over_disable", function ( f6_arg0, f6_arg1 )
		RefreshAnimation( f6_arg0, "ButtonOverDisabled" )
	end )
	if IsLanguageRightToLeft( GetCurrentLanguage() ) then
		f2_arg0:SetZRotation( 180 )
	end
end

function GenericButtonBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 30 * _1080p )
	self.id = "GenericButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local GenericButtonBlurBackground = nil
	
	GenericButtonBlurBackground = MenuBuilder.BuildRegisteredType( "GenericListButtonBackground", {
		controllerIndex = f7_local1
	} )
	GenericButtonBlurBackground.id = "GenericButtonBlurBackground"
	GenericButtonBlurBackground:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonBlurBackground )
	self.GenericButtonBlurBackground = GenericButtonBlurBackground
	
	local GamepadIcon = nil
	
	GamepadIcon = LUI.UIImage.new()
	GamepadIcon.id = "GamepadIcon"
	GamepadIcon:SetAlpha( 0, 0 )
	GamepadIcon:setImage( RegisterMaterial( "button_primary" ), 0 )
	GamepadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16 )
	self:addElement( GamepadIcon )
	self.GamepadIcon = GamepadIcon
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		self._sequences.ButtonOver = function ()
			
		end
		
		self._sequences.ButtonUp = function ()
			
		end
		
		GamepadIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GamepadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			GamepadIcon:AnimateSequence( "Locked" )
		end
		
		self._sequences.ButtonOverDisabled = function ()
			
		end
		
		self._sequences.ButtonUpDisabled = function ()
			
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0.3, 0 )
				end
			}
		} )
		GenericButtonBlurBackground:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.GenericButtonBlurBackground:SetAlpha( 1, 0 )
				end
			},
			{
				function ()
					return self.GenericButtonBlurBackground:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			DropShadow:AnimateSequence( "ButtonOver" )
			GenericButtonBlurBackground:AnimateSequence( "ButtonOver" )
		end
		
		DropShadow:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GenericButtonBlurBackground:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GenericButtonBlurBackground:SetAlpha( 0.5, 0 )
				end
			}
		} )
		GamepadIcon:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.GamepadIcon:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			DropShadow:AnimateSequence( "Locked" )
			GenericButtonBlurBackground:AnimateSequence( "Locked" )
			GamepadIcon:AnimateSequence( "Locked" )
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GenericButtonBlurBackground:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.GenericButtonBlurBackground:SetAlpha( 0.5, 0 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			DropShadow:AnimateSequence( "ButtonOverDisabled" )
			GenericButtonBlurBackground:AnimateSequence( "ButtonOverDisabled" )
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GenericButtonBlurBackground:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.GenericButtonBlurBackground:SetAlpha( 0.25, 0 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			DropShadow:AnimateSequence( "ButtonUpDisabled" )
			GenericButtonBlurBackground:AnimateSequence( "ButtonUpDisabled" )
		end
		
		DropShadow:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.DropShadow:SetAlpha( 0, 0 )
				end
			}
		} )
		GenericButtonBlurBackground:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.GenericButtonBlurBackground:SetAlpha( 0.8, 0 )
				end
			},
			{
				function ()
					return self.GenericButtonBlurBackground:SetRGBFromInt( 16777215, 0 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			DropShadow:AnimateSequence( "ButtonUp" )
			GenericButtonBlurBackground:AnimateSequence( "ButtonUp" )
		end
		
		self._sequences.initial = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameMode" )
		ACTIONS.AnimateSequence( self, "initial" )
	end
	return self
end

MenuBuilder.registerType( "GenericButtonBackground", GenericButtonBackground )
LockTable( _M )
