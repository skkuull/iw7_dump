local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function LineConveyor( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 2 * _1080p )
	self.id = "LineConveyor"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Lines = nil
	
	Lines = LUI.UIImage.new()
	Lines.id = "Lines"
	Lines:setImage( RegisterMaterial( "hud_reticle_line_conveyor" ), 0 )
	Lines:SetVMin( 0.84, 0 )
	Lines:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, _1080p * -0.5, _1080p * 0.5 )
	self:addElement( Lines )
	self.Lines = Lines
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Lines:RegisterAnimationSequence( "Cycle", {
			{
				function ()
					return self.Lines:SetVMin( 0.87, 0 )
				end,
				function ()
					return self.Lines:SetVMin( 0.87, 100 )
				end,
				function ()
					return self.Lines:SetVMin( 0.76, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.76, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.65, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.65, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.52, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.52, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.4, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.4, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.26, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.26, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.14, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.14, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.02, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.02, 90 )
				end
			},
			{
				function ()
					return self.Lines:SetVMax( 1, 0 )
				end,
				function ()
					return self.Lines:SetVMax( 1, 100 )
				end,
				function ()
					return self.Lines:SetVMax( 0.86, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.86, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.74, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.74, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.61, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.61, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.48, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.48, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.36, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.36, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.24, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.24, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.1, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.1, 90 )
				end
			}
		} )
		self._sequences.Cycle = function ()
			Lines:AnimateLoop( "Cycle" )
		end
		
		Lines:RegisterAnimationSequence( "Cycle2", {
			{
				function ()
					return self.Lines:SetVMin( 0.1, 0 )
				end,
				function ()
					return self.Lines:SetVMin( 0.12, 100 )
				end,
				function ()
					return self.Lines:SetVMin( 0.88, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.88, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.77, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.77, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.64, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.64, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.52, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.52, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.39, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.39, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.26, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.26, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.14, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.14, 90 )
				end,
				function ()
					return self.Lines:SetVMin( 0.02, 10 )
				end,
				function ()
					return self.Lines:SetVMin( 0.02, 90 )
				end
			},
			{
				function ()
					return self.Lines:SetVMax( 0.09, 0 )
				end,
				function ()
					return self.Lines:SetVMax( 0.07, 100 )
				end,
				function ()
					return self.Lines:SetVMax( 1, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 1, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.86, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.86, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.74, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.74, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.6, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.6, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.48, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.48, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.36, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.36, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.24, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.24, 90 )
				end,
				function ()
					return self.Lines:SetVMax( 0.11, 10 )
				end,
				function ()
					return self.Lines:SetVMax( 0.11, 90 )
				end
			}
		} )
		self._sequences.Cycle2 = function ()
			Lines:AnimateLoop( "Cycle2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "LineConveyor", LineConveyor )
LockTable( _M )
