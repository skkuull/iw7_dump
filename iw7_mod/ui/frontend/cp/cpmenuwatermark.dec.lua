local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CPMenuWatermark( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1024 * _1080p, 0, 1024 * _1080p )
	self.id = "CPMenuWatermark"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CPWatermarkBG = nil
	
	CPWatermarkBG = LUI.UIImage.new()
	CPWatermarkBG.id = "CPWatermarkBG"
	CPWatermarkBG:SetAlpha( 0.2, 0 )
	CPWatermarkBG:SetScale( 0.42, 0 )
	CPWatermarkBG:setImage( RegisterMaterial( "zm_tix_arcane_spinner" ), 0 )
	CPWatermarkBG:SetBlendMode( BLEND_MODE.addWithAlpha )
	CPWatermarkBG:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -256, _1080p * 256, _1080p * -256, _1080p * 256 )
	self:addElement( CPWatermarkBG )
	self.CPWatermarkBG = CPWatermarkBG
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CPWatermarkBG:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.CPWatermarkBG:SetZRotation( 0, 0 )
				end,
				function ()
					return self.CPWatermarkBG:SetZRotation( -359, 40000 )
				end
			}
		} )
		self._sequences.Rotate = function ()
			CPWatermarkBG:AnimateLoop( "Rotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	ACTIONS.AnimateSequence( self, "Rotate" )
	return self
end

MenuBuilder.registerType( "CPMenuWatermark", CPMenuWatermark )
LockTable( _M )
