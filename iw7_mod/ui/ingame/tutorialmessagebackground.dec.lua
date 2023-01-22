local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function TutorialMessageBackground( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1200 * _1080p, 0, 60 * _1080p )
	self.id = "TutorialMessageBackground"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local f1_local3 = nil
	if CONDITIONS.IsSingleplayer( self ) then
		f1_local3 = LUI.UIImage.new()
		f1_local3.id = "Background"
		f1_local3:SetRGBFromInt( 0, 0 )
		self:addElement( f1_local3 )
		self.Background = f1_local3
	end
	local BackgroundFadeRight = nil
	
	BackgroundFadeRight = LUI.UIImage.new()
	BackgroundFadeRight.id = "BackgroundFadeRight"
	BackgroundFadeRight:SetRGBFromInt( 0, 0 )
	BackgroundFadeRight:setImage( RegisterMaterial( "widg_gradient_left_to_right" ), 0 )
	BackgroundFadeRight:SetAnchorsAndPosition( 1, 0, 0, 0, 0, _1080p * 128, 0, 0 )
	self:addElement( BackgroundFadeRight )
	self.BackgroundFadeRight = BackgroundFadeRight
	
	local BackgroundFadeLeft = nil
	
	BackgroundFadeLeft = LUI.UIImage.new()
	BackgroundFadeLeft.id = "BackgroundFadeLeft"
	BackgroundFadeLeft:SetRGBFromInt( 0, 0 )
	BackgroundFadeLeft:setImage( RegisterMaterial( "widg_gradient_right_to_left" ), 0 )
	BackgroundFadeLeft:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * -128, 0, 0, 0 )
	self:addElement( BackgroundFadeLeft )
	self.BackgroundFadeLeft = BackgroundFadeLeft
	
	self._animationSets.DefaultAnimationSet = function ()
		if CONDITIONS.IsSingleplayer( self ) then
			f1_local3:RegisterAnimationSequence( "DefaultSequence", {
				{
					function ()
						return self.Background:SetAlpha( 0, 0 )
					end
				}
			} )
		end
		BackgroundFadeRight:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BackgroundFadeRight:SetAlpha( 0, 0 )
				end
			}
		} )
		BackgroundFadeLeft:RegisterAnimationSequence( "DefaultSequence", {
			{
				function ()
					return self.BackgroundFadeLeft:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.DefaultSequence = function ()
			if CONDITIONS.IsSingleplayer( self ) then
				f1_local3:AnimateSequence( "DefaultSequence" )
			end
			BackgroundFadeRight:AnimateSequence( "DefaultSequence" )
			BackgroundFadeLeft:AnimateSequence( "DefaultSequence" )
		end
		
		if CONDITIONS.IsSingleplayer( self ) then
			f1_local3:RegisterAnimationSequence( "FadeIn", {
				{
					function ()
						return self.Background:SetAlpha( 0.3, 250 )
					end
				}
			} )
		end
		BackgroundFadeRight:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.BackgroundFadeRight:SetAlpha( 0.3, 250 )
				end
			}
		} )
		BackgroundFadeLeft:RegisterAnimationSequence( "FadeIn", {
			{
				function ()
					return self.BackgroundFadeLeft:SetAlpha( 0.3, 250 )
				end
			}
		} )
		self._sequences.FadeIn = function ()
			if CONDITIONS.IsSingleplayer( self ) then
				f1_local3:AnimateSequence( "FadeIn" )
			end
			BackgroundFadeRight:AnimateSequence( "FadeIn" )
			BackgroundFadeLeft:AnimateSequence( "FadeIn" )
		end
		
		if CONDITIONS.IsSingleplayer( self ) then
			f1_local3:RegisterAnimationSequence( "FadeOut", {
				{
					function ()
						return self.Background:SetAlpha( 0, 250 )
					end
				}
			} )
		end
		BackgroundFadeRight:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.BackgroundFadeRight:SetAlpha( 0, 250 )
				end
			}
		} )
		BackgroundFadeLeft:RegisterAnimationSequence( "FadeOut", {
			{
				function ()
					return self.BackgroundFadeLeft:SetAlpha( 0, 250 )
				end
			}
		} )
		self._sequences.FadeOut = function ()
			if CONDITIONS.IsSingleplayer( self ) then
				f1_local3:AnimateSequence( "FadeOut" )
			end
			BackgroundFadeRight:AnimateSequence( "FadeOut" )
			BackgroundFadeLeft:AnimateSequence( "FadeOut" )
		end
		
		self._sequences.FadeInInvalidCmd = function ()
			
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "DefaultSequence" )
	return self
end

MenuBuilder.registerType( "TutorialMessageBackground", TutorialMessageBackground )
LockTable( _M )
