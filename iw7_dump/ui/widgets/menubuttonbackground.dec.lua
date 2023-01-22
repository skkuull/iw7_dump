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
	f2_arg0.Background:SetMask( f2_arg0.Mask )
	f2_arg0.DropShadow:SetMask( f2_arg0.Mask )
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

function MenuButtonBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 50 * _1080p )
	self.id = "MenuButtonBackground"
	self._animationSets = {}
	self._sequences = {}
	local f7_local1 = controller and controller.controllerIndex
	if not f7_local1 and not Engine.InFrontend() then
		f7_local1 = self:getRootController()
	end
	assert( f7_local1 )
	local f7_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromInt( 3355443, 0 )
	Background:SetAlpha( 0.6, 0 )
	Background:SetBlendMode( BLEND_MODE.blend )
	self:addElement( Background )
	self.Background = Background
	
	local DropShadow = nil
	
	DropShadow = LUI.UIImage.new()
	DropShadow.id = "DropShadow"
	DropShadow:SetRGBFromInt( 0, 0 )
	DropShadow:SetAlpha( 0.3, 0 )
	DropShadow:setImage( RegisterMaterial( "widg_gradient_top_to_bottom" ), 0 )
	DropShadow:SetAnchorsAndPosition( 0, 0, 1, 0, 0, 0, 0, _1080p * 4 )
	self:addElement( DropShadow )
	self.DropShadow = DropShadow
	
	local Mask = nil
	
	Mask = LUI.UIImage.new()
	Mask.id = "Mask"
	Mask:setImage( RegisterMaterial( "widg_gradient_left_to_right_mask" ), 0 )
	Mask:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 54 )
	self:addElement( Mask )
	self.Mask = Mask
	
	local GamepadIcon = nil
	
	GamepadIcon = LUI.UIImage.new()
	GamepadIcon.id = "GamepadIcon"
	GamepadIcon:SetAlpha( 0, 0 )
	GamepadIcon:setImage( RegisterMaterial( "button_primary" ), 0 )
	GamepadIcon:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -42, _1080p * -10, _1080p * -16, _1080p * 16 )
	self:addElement( GamepadIcon )
	self.GamepadIcon = GamepadIcon
	
	local Tic = nil
	
	Tic = LUI.UIImage.new()
	Tic.id = "Tic"
	Tic:SetRGBFromTable( SWATCHES.genericButton.textFocus, 0 )
	Tic:SetAlpha( 0.25, 0 )
	Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5, _1080p * 9, _1080p * -8, _1080p * 7 )
	self:addElement( Tic )
	self.Tic = Tic
	
	local GenericButtonSelection = nil
	
	GenericButtonSelection = MenuBuilder.BuildRegisteredType( "GenericButtonSelection", {
		controllerIndex = f7_local1
	} )
	GenericButtonSelection.id = "GenericButtonSelection"
	GenericButtonSelection:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( GenericButtonSelection )
	self.GenericButtonSelection = GenericButtonSelection
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 40 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.8, 100 )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Mask:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			},
			{
				function ()
					return self.Mask:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, _1080p * 4, 0 )
				end
			}
		} )
		Tic:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Tic:SetRGBFromTable( SWATCHES.genericButton.textFocus, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Tic:SetAlpha( 0.5, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 14, _1080p * -8, _1080p * 7, 100, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Background:AnimateSequence( "ButtonOver" )
			Mask:AnimateSequence( "ButtonOver" )
			Tic:AnimateSequence( "ButtonOver" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Background:SetAlpha( 0.6, 200 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromInt( 3355443, 200 )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Mask:setImage( RegisterMaterial( "widg_gradient_left_to_right_mask" ), 0 )
				end
			}
		} )
		Tic:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 200 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5, _1080p * 9, _1080p * -8, _1080p * 7, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Background:AnimateSequence( "ButtonUp" )
			Mask:AnimateSequence( "ButtonUp" )
			Tic:AnimateSequence( "ButtonUp" )
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
		
		Background:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Background:SetRGBFromInt( 0, 40 )
				end
			},
			{
				function ()
					return self.Background:SetAlpha( 0.8, 100 )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Mask:setImage( RegisterMaterial( "ui_default_white" ), 0 )
				end
			}
		} )
		Tic:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 100 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 10, _1080p * 14, _1080p * -8, _1080p * 7, 100 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Background:AnimateSequence( "ButtonOverDisabled" )
			Mask:AnimateSequence( "ButtonOverDisabled" )
			Tic:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Background:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Background:SetAlpha( 0.6, 200 )
				end
			},
			{
				function ()
					return self.Background:SetRGBFromInt( 3355443, 200 )
				end
			}
		} )
		Mask:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Mask:setImage( RegisterMaterial( "widg_gradient_left_to_right_mask" ), 0 )
				end
			}
		} )
		Tic:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 200 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5, _1080p * 9, _1080p * -8, _1080p * 7, 100 )
				end,
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5.5, _1080p * 9.5, _1080p * -8, _1080p * 7, 100 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Background:AnimateSequence( "ButtonUpDisabled" )
			Mask:AnimateSequence( "ButtonUpDisabled" )
			Tic:AnimateSequence( "ButtonUpDisabled" )
		end
		
	end
	
	self._animationSets.ThirdGameMode = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tic:RegisterAnimationSequence( "ButtonOver", {
			{
				function ()
					return self.Tic:SetRGBFromTable( SWATCHES.genericButton.textFocus, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Tic:SetAlpha( 0.5, 100, LUI.EASING.outSine )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 12, _1080p * 17, _1080p * -8, _1080p * 7, 100, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.ButtonOver = function ()
			Tic:AnimateSequence( "ButtonOver" )
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
		
		Tic:RegisterAnimationSequence( "ButtonOverDisabled", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 100 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 12, _1080p * 17, _1080p * -8, _1080p * 7, 100 )
				end
			}
		} )
		self._sequences.ButtonOverDisabled = function ()
			Tic:AnimateSequence( "ButtonOverDisabled" )
		end
		
		Tic:RegisterAnimationSequence( "ButtonUpDisabled", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 100 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5.5, _1080p * 9.5, _1080p * -8, _1080p * 7, 100 )
				end
			}
		} )
		self._sequences.ButtonUpDisabled = function ()
			Tic:AnimateSequence( "ButtonUpDisabled" )
		end
		
		Tic:RegisterAnimationSequence( "ButtonUp", {
			{
				function ()
					return self.Tic:SetAlpha( 0.25, 200 )
				end
			},
			{
				function ()
					return self.Tic:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * 5.5, _1080p * 9.5, _1080p * -8, _1080p * 7, 200 )
				end
			}
		} )
		self._sequences.ButtonUp = function ()
			Tic:AnimateSequence( "ButtonUp" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f7_local1, controller )
	if CONDITIONS.IsThirdGameModeDesired( self ) then
		ACTIONS.SetAnimationSet( self, "ThirdGameMode" )
	end
	return self
end

MenuBuilder.registerType( "MenuButtonBackground", MenuButtonBackground )
LockTable( _M )
