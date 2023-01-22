local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CrosshairSteelDragonBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 256 * _1080p, 0, 256 * _1080p )
	self.id = "CrosshairSteelDragonBase"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Ring = nil
	
	Ring = LUI.UIImage.new()
	Ring.id = "Ring"
	Ring:setImage( RegisterMaterial( "hud_reticle_steeldragon_r" ), 0 )
	self:addElement( Ring )
	self.Ring = Ring
	
	local Line1 = nil
	
	Line1 = LUI.UIImage.new()
	Line1.id = "Line1"
	Line1:SetZRotation( 30, 0 )
	Line1:SetScale( -0.1, 0 )
	Line1:setImage( RegisterMaterial( "hud_reticle_steeldragon_l" ), 0 )
	Line1:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 4, _1080p * -9, _1080p * 7 )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local Line2 = nil
	
	Line2 = LUI.UIImage.new()
	Line2.id = "Line2"
	Line2:SetZRotation( -30, 0 )
	Line2:SetScale( -0.1, 0 )
	Line2:setImage( RegisterMaterial( "hud_reticle_steeldragon_l" ), 0 )
	Line2:SetAnchorsAndPosition( 0.5, 0.5, 0, 0, _1080p * -5, _1080p * 4, _1080p * -9, _1080p * 7 )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local ReticleSteelDragonFramePart = nil
	
	ReticleSteelDragonFramePart = MenuBuilder.BuildRegisteredType( "ReticleSteelDragonFramePart", {
		controllerIndex = f1_local1
	} )
	ReticleSteelDragonFramePart.id = "ReticleSteelDragonFramePart"
	ReticleSteelDragonFramePart:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( ReticleSteelDragonFramePart )
	self.ReticleSteelDragonFramePart = ReticleSteelDragonFramePart
	
	local Dot = nil
	
	Dot = LUI.UIImage.new()
	Dot.id = "Dot"
	Dot:setImage( RegisterMaterial( "hud_outlined_dot" ), 0 )
	Dot:SetUseAA( true )
	Dot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( Dot )
	self.Dot = Dot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Line1:RegisterAnimationSequence( "YesX", {
			{
				function ()
					return self.Line1:SetAlpha( 1, 60 )
				end
			}
		} )
		Line2:RegisterAnimationSequence( "YesX", {
			{
				function ()
					return self.Line2:SetAlpha( 1, 60 )
				end
			}
		} )
		ReticleSteelDragonFramePart:RegisterAnimationSequence( "YesX", {
			{
				function ()
					return self.ReticleSteelDragonFramePart:SetScale( 0, 60 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "YesX", {
			{
				function ()
					return self.Dot:SetScale( 0.4, 60 )
				end
			}
		} )
		self._sequences.YesX = function ()
			Line1:AnimateSequence( "YesX" )
			Line2:AnimateSequence( "YesX" )
			ReticleSteelDragonFramePart:AnimateSequence( "YesX" )
			Dot:AnimateSequence( "YesX" )
		end
		
		Line1:RegisterAnimationSequence( "NoX", {
			{
				function ()
					return self.Line1:SetAlpha( 0, 60 )
				end
			}
		} )
		Line2:RegisterAnimationSequence( "NoX", {
			{
				function ()
					return self.Line2:SetAlpha( 0, 60 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "NoX", {
			{
				function ()
					return self.Dot:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.NoX = function ()
			Line1:AnimateSequence( "NoX" )
			Line2:AnimateSequence( "NoX" )
			Dot:AnimateSequence( "NoX" )
		end
		
		ReticleSteelDragonFramePart:RegisterAnimationSequence( "Whirlygig", {
			{
				function ()
					return self.ReticleSteelDragonFramePart:SetZRotation( -1, 0 )
				end,
				function ()
					return self.ReticleSteelDragonFramePart:SetZRotation( -180, 1000 )
				end
			}
		} )
		self._sequences.Whirlygig = function ()
			ReticleSteelDragonFramePart:AnimateLoop( "Whirlygig" )
		end
		
		ReticleSteelDragonFramePart:RegisterAnimationSequence( "StopWhirlygig", {
			{
				function ()
					return self.ReticleSteelDragonFramePart:SetZRotation( 0, 60 )
				end
			}
		} )
		self._sequences.StopWhirlygig = function ()
			ReticleSteelDragonFramePart:AnimateSequence( "StopWhirlygig" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "CrosshairSteelDragonBase", CrosshairSteelDragonBase )
LockTable( _M )
