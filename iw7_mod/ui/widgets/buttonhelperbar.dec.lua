local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = MenuBuilder.BuildRegisteredType( "button_helper_text_main", {
		right_inset = f1_arg2.right_inset or nil,
		list_left_inset = f1_arg2.list_left_inset or nil
	} )
	f1_local0:registerAnimationState( "default", {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	f1_local0:animateToState( "default" )
	f1_local0.id = "buttonHelperText"
	f1_arg0:addElement( f1_local0 )
end

function ButtonHelperBar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1920 * _1080p, 0, 72 * _1080p )
	self.id = "ButtonHelperBar"
	self._animationSets = {}
	self._sequences = {}
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	local Background = nil
	
	Background = LUI.UIImage.new()
	Background.id = "Background"
	Background:SetRGBFromTable( SWATCHES.buttonHelper.background, 0 )
	self:addElement( Background )
	self.Background = Background
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Background:RegisterAnimationSequence( "HideBackground", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideBackground = function ()
			Background:AnimateSequence( "HideBackground" )
		end
		
		Background:RegisterAnimationSequence( "HideNotButtons", {
			{
				function ()
					return self.Background:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.HideNotButtons = function ()
			Background:AnimateSequence( "HideNotButtons" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "ButtonHelperBar", ButtonHelperBar )
LockTable( _M )
