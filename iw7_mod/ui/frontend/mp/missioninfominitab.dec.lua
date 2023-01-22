local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function MissionInfoMiniTab( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 30 * _1080p, 0, 120 * _1080p )
	self.id = "MissionInfoMiniTab"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BlurBackground = nil
	
	BlurBackground = LUI.UIBlur.new()
	BlurBackground.id = "BlurBackground"
	BlurBackground:SetBlurStrength( 2.75, 0 )
	self:addElement( BlurBackground )
	self.BlurBackground = BlurBackground
	
	local Top = nil
	
	Top = LUI.UIImage.new()
	Top.id = "Top"
	Top:SetRGBFromTable( SWATCHES.MissionSelectButton.tabBackgroundFocus, 0 )
	Top:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( Top )
	self.Top = Top
	
	local NumText = nil
	
	NumText = LUI.UIStyledText.new()
	NumText.id = "NumText"
	NumText:setText( "3", 0 )
	NumText:SetFontSize( 24 * _1080p )
	NumText:SetFont( FONTS.GetFont( FONTS.MainBold.File ) )
	NumText:SetAlignment( LUI.Alignment.Center )
	NumText:SetAnchorsAndPosition( 0, 0, 0, 1, 0, 0, 0, _1080p * 24 )
	self:addElement( NumText )
	self.NumText = NumText
	
	local Lock = nil
	
	Lock = LUI.UIImage.new()
	Lock.id = "Lock"
	Lock:SetAlpha( 0, 0 )
	Lock:setImage( RegisterMaterial( "icon_slot_locked" ), 0 )
	Lock:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -12, _1080p * 12, 0, _1080p * 24 )
	self:addElement( Lock )
	self.Lock = Lock
	
	local Gradient = nil
	
	Gradient = LUI.UIImage.new()
	Gradient.id = "Gradient"
	Gradient:SetRGBFromInt( 0, 0 )
	Gradient:SetAlpha( 0.4, 0 )
	Gradient:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		NumText:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.NumText:SetAlpha( 0, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Locked", {
			{
				function ()
					return self.Lock:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Locked = function ()
			NumText:AnimateSequence( "Locked" )
			Lock:AnimateSequence( "Locked" )
		end
		
		NumText:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.NumText:SetAlpha( 1, 0 )
				end
			}
		} )
		Lock:RegisterAnimationSequence( "Unlocked", {
			{
				function ()
					return self.Lock:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Unlocked = function ()
			NumText:AnimateSequence( "Unlocked" )
			Lock:AnimateSequence( "Unlocked" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	BlurBackground:addEventHandler( "button_over", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonOver" )
	end )
	BlurBackground:addEventHandler( "button_over_disable", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled" )
	end )
	BlurBackground:addEventHandler( "button_up", function ( f12_arg0, f12_arg1 )
		local f12_local0 = f12_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "ButtonUp" )
	end )
	BlurBackground:addEventHandler( "button_disable", function ( f13_arg0, f13_arg1 )
		local f13_local0 = f13_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Disabled" )
	end )
	return self
end

MenuBuilder.registerType( "MissionInfoMiniTab", MissionInfoMiniTab )
LockTable( _M )
