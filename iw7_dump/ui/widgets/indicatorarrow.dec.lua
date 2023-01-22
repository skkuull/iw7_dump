local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function IndicatorArrow( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 20 * _1080p, 0, 15 * _1080p )
	self.id = "IndicatorArrow"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local ArrowImage = nil
	
	ArrowImage = LUI.UIImage.new()
	ArrowImage.id = "ArrowImage"
	ArrowImage:SetZRotation( -90, 0 )
	ArrowImage:setImage( RegisterMaterial( "wdg_button_arrow_tip" ), 0 )
	ArrowImage:SetAnchorsAndPosition( 0, 0, 0, 0, _1080p * 6.25, _1080p * -6.25, 0, _1080p * -1 )
	self:addElement( ArrowImage )
	self.ArrowImage = ArrowImage
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ArrowImage:RegisterAnimationSequence( "IndicatorDown", {
			{
				function ()
					return self.ArrowImage:SetZRotation( -90, 0 )
				end
			}
		} )
		self._sequences.IndicatorDown = function ()
			ArrowImage:AnimateSequence( "IndicatorDown" )
		end
		
		ArrowImage:RegisterAnimationSequence( "IndicatorUp", {
			{
				function ()
					return self.ArrowImage:SetZRotation( 90, 0 )
				end
			}
		} )
		self._sequences.IndicatorUp = function ()
			ArrowImage:AnimateSequence( "IndicatorUp" )
		end
		
		ArrowImage:RegisterAnimationSequence( "IndicatorLeft", {
			{
				function ()
					return self.ArrowImage:SetZRotation( 180, 0 )
				end
			}
		} )
		self._sequences.IndicatorLeft = function ()
			ArrowImage:AnimateSequence( "IndicatorLeft" )
		end
		
		ArrowImage:RegisterAnimationSequence( "IndicatorRight", {
			{
				function ()
					return self.ArrowImage:SetZRotation( 0, 0 )
				end
			}
		} )
		self._sequences.IndicatorRight = function ()
			ArrowImage:AnimateSequence( "IndicatorRight" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "IndicatorArrow", IndicatorArrow )
LockTable( _M )
