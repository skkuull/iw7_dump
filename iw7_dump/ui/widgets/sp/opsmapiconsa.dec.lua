local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OpsMapIconSA( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "OpsMapIconSA"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Outline = nil
	
	Outline = LUI.UIImage.new()
	Outline.id = "Outline"
	Outline:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	Outline:setImage( RegisterMaterial( "ops_map_icon_triangle_outline" ), 0 )
	Outline:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64.5, _1080p * 63.5 )
	self:addElement( Outline )
	self.Outline = Outline
	
	local Inner = nil
	
	Inner = LUI.UIImage.new()
	Inner.id = "Inner"
	Inner:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	Inner:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -15, _1080p * 49 )
	self:addElement( Inner )
	self.Inner = Inner
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Inner:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Inner:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Inner:SetZRotation( -180, 700, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Inner:SetZRotation( -180, 500 )
				end,
				function ()
					return self.Inner:SetZRotation( -360, 700, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Inner:SetZRotation( -360, 500 )
				end
			},
			{
				function ()
					return self.Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -16, _1080p * 53, 0 )
				end,
				function ()
					return self.Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -15, _1080p * 51, 699, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -15, _1080p * 51, 500 )
				end,
				function ()
					return self.Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -16, _1080p * 53, 699, LUI.EASING.inOutQuadratic )
				end,
				function ()
					return self.Inner:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -34, _1080p * 34, _1080p * -16, _1080p * 53, 500 )
				end
			}
		} )
		self._sequences.Animate = function ()
			Inner:AnimateLoop( "Animate" )
		end
		
		Outline:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Outline:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		Inner:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Inner:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		self._sequences.Completed = function ()
			Outline:AnimateSequence( "Completed" )
			Inner:AnimateSequence( "Completed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "OpsMapIconSA", OpsMapIconSA )
LockTable( _M )
