local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function OpsMapIconJA( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 1 * _1080p, 0, 1 * _1080p )
	self.id = "OpsMapIconJA"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Tri1 = nil
	
	Tri1 = LUI.UIImage.new()
	Tri1.id = "Tri1"
	Tri1:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	Tri1:SetZRotation( 180, 0 )
	Tri1:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	Tri1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 4, _1080p * -56, _1080p * 8 )
	self:addElement( Tri1 )
	self.Tri1 = Tri1
	
	local Tri2 = nil
	
	Tri2 = LUI.UIImage.new()
	Tri2.id = "Tri2"
	Tri2:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	Tri2:SetZRotation( 180, 0 )
	Tri2:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	Tri2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 60, _1080p * -56, _1080p * 8 )
	self:addElement( Tri2 )
	self.Tri2 = Tri2
	
	local Tri3 = nil
	
	Tri3 = LUI.UIImage.new()
	Tri3.id = "Tri3"
	Tri3:SetRGBFromTable( SWATCHES.OpsMap.SideMission, 0 )
	Tri3:SetZRotation( 180, 0 )
	Tri3:setImage( RegisterMaterial( "ops_map_icon_triangle" ), 0 )
	Tri3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56 )
	self:addElement( Tri3 )
	self.Tri3 = Tri3
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Tri1:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Tri1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 4, _1080p * -56, _1080p * 8, 0 )
				end,
				function ()
					return self.Tri1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 4, _1080p * -56, _1080p * 8, 500 )
				end,
				function ()
					return self.Tri1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33, _1080p * 31, _1080p * -56, _1080p * 8, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Tri1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 60, _1080p * -56, _1080p * 8, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Tri2:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Tri2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 60, _1080p * -56, _1080p * 8, 0 )
				end,
				function ()
					return self.Tri2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 60, _1080p * -56, _1080p * 8, 500 )
				end,
				function ()
					return self.Tri2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 60, _1080p * -8, _1080p * 56, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Tri2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Tri3:RegisterAnimationSequence( "Animate", {
			{
				function ()
					return self.Tri3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56, 0 )
				end,
				function ()
					return self.Tri3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -8, _1080p * 56, 500 )
				end,
				function ()
					return self.Tri3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -61, _1080p * 3, _1080p * -8, _1080p * 56, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Tri3:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 4, _1080p * -56, _1080p * 8, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.Animate = function ()
			Tri1:AnimateLoop( "Animate" )
			Tri2:AnimateLoop( "Animate" )
			Tri3:AnimateLoop( "Animate" )
		end
		
		Tri1:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Tri1:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		Tri2:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Tri2:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		Tri3:RegisterAnimationSequence( "Completed", {
			{
				function ()
					return self.Tri3:SetRGBFromInt( 15856113, 0 )
				end
			}
		} )
		self._sequences.Completed = function ()
			Tri1:AnimateSequence( "Completed" )
			Tri2:AnimateSequence( "Completed" )
			Tri3:AnimateSequence( "Completed" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "OpsMapIconJA", OpsMapIconJA )
LockTable( _M )
