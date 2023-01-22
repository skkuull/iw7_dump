local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function VerticalMinimalScrollbar( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 16 * _1080p, 0, 400 * _1080p )
	self.id = "VerticalMinimalScrollbar"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local guide = nil
	
	guide = LUI.UIImage.new()
	guide.id = "guide"
	guide:SetRGBFromTable( SWATCHES.CAC.greenLight, 0 )
	guide:SetAlpha( 0.4, 0 )
	guide:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -1.5, _1080p * 1.5, 0, 0 )
	self:addElement( guide )
	self.guide = guide
	
	local sliderArea = nil
	
	sliderArea = MenuBuilder.BuildRegisteredType( "VerticalMinimalScrollbarSliderArea", {
		controllerIndex = f1_local1
	} )
	sliderArea.id = "sliderArea"
	sliderArea:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * 4, _1080p * -4 )
	self:addElement( sliderArea )
	self.sliderArea = sliderArea
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		guide:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.guide:SetAlpha( 1, 0 )
				end
			}
		} )
		sliderArea:RegisterAnimationSequence( "Show", {
			{
				function ()
					return self.sliderArea:SetAlpha( 1, 0 )
				end
			}
		} )
		self._sequences.Show = function ()
			guide:AnimateSequence( "Show" )
			sliderArea:AnimateSequence( "Show" )
		end
		
		guide:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.guide:SetAlpha( 0, 0 )
				end
			}
		} )
		sliderArea:RegisterAnimationSequence( "Hide", {
			{
				function ()
					return self.sliderArea:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.Hide = function ()
			guide:AnimateSequence( "Hide" )
			sliderArea:AnimateSequence( "Hide" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:addEventHandler( "scrollbar_all_visible", function ( f10_arg0, f10_arg1 )
		local f10_local0 = f10_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Hide" )
	end )
	self:addEventHandler( "scrollbar_not_all_visible", function ( f11_arg0, f11_arg1 )
		local f11_local0 = f11_arg1.controller or f1_local1
		ACTIONS.AnimateSequence( self, "Show" )
	end )
	return self
end

MenuBuilder.registerType( "VerticalMinimalScrollbar", VerticalMinimalScrollbar )
LockTable( _M )
