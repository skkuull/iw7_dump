local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	local f1_local0 = DataSources.inGame.player.currentWeapon.charge
	f1_arg0:SubscribeToModel( f1_local0:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = f1_local0:GetValue( f1_arg1 )
		if f2_local0 ~= nil then
			if f2_local0 >= 1 then
				ACTIONS.AnimateSequence( f1_arg0, "FullyCharged" )
				ACTIONS.AnimateSequence( f1_arg0, "FullyChargedLoop" )
			else
				ACTIONS.AnimateSequence( f1_arg0, "NotCharged" )
			end
		end
	end )
end

function ReticleGaussLChargeMeter( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 275 * _1080p, 0, 275 * _1080p )
	self.id = "ReticleGaussLChargeMeter"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Backing = nil
	
	Backing = LUI.UIImage.new()
	Backing.id = "Backing"
	Backing:SetRGBFromInt( 0, 0 )
	Backing:SetAlpha( 0.2, 0 )
	Backing:setImage( RegisterMaterial( "hud_reticle_gauss_ring_backing" ), 0 )
	self:addElement( Backing )
	self.Backing = Backing
	
	local LeftRing = nil
	
	LeftRing = MenuBuilder.BuildRegisteredType( "ReticleGaussLBase", {
		controllerIndex = f3_local1
	} )
	LeftRing.id = "LeftRing"
	LeftRing:SetRGBFromInt( 15028736, 0 )
	LeftRing:SetScale( 0.01, 0 )
	LeftRing:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( LeftRing )
	self.LeftRing = LeftRing
	
	local RightRing = nil
	
	RightRing = MenuBuilder.BuildRegisteredType( "ReticleGaussLBase", {
		controllerIndex = f3_local1
	} )
	RightRing.id = "RightRing"
	RightRing:SetRGBFromInt( 15028736, 0 )
	RightRing:SetYRotation( 180, 0 )
	RightRing:SetScale( 0.01, 0 )
	RightRing:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( RightRing )
	self.RightRing = RightRing
	
	local ChargeRing = nil
	
	ChargeRing = LUI.UIImage.new()
	ChargeRing.id = "ChargeRing"
	ChargeRing:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	ChargeRing:SetAlpha( 0.2, 0 )
	ChargeRing:setImage( RegisterMaterial( "hud_reticle_gauss_ring_backing" ), 0 )
	self:addElement( ChargeRing )
	self.ChargeRing = ChargeRing
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LeftRing:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.LeftRing:SetRGBFromInt( 15028736, 60 )
				end
			},
			{
				function ()
					return self.LeftRing:SetAlpha( 1, 60 )
				end
			}
		} )
		RightRing:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.RightRing:SetRGBFromInt( 15028736, 60 )
				end
			},
			{
				function ()
					return self.RightRing:SetAlpha( 1, 60 )
				end
			}
		} )
		ChargeRing:RegisterAnimationSequence( "NotCharged", {
			{
				function ()
					return self.ChargeRing:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.NotCharged = function ()
			LeftRing:AnimateSequence( "NotCharged" )
			RightRing:AnimateSequence( "NotCharged" )
			ChargeRing:AnimateSequence( "NotCharged" )
		end
		
		LeftRing:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.LeftRing:SetRGBFromInt( 15028736, 0 )
				end,
				function ()
					return self.LeftRing:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		RightRing:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.RightRing:SetRGBFromInt( 15028736, 0 )
				end,
				function ()
					return self.RightRing:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 100, LUI.EASING.inQuadratic )
				end
			}
		} )
		ChargeRing:RegisterAnimationSequence( "FullyCharged", {
			{
				function ()
					return self.ChargeRing:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.ChargeRing:SetAlpha( 0.2, 40 )
				end,
				function ()
					return self.ChargeRing:SetAlpha( 0.8, 40 )
				end,
				function ()
					return self.ChargeRing:SetAlpha( 0.2, 40 )
				end,
				function ()
					return self.ChargeRing:SetAlpha( 0.8, 40 )
				end,
				function ()
					return self.ChargeRing:SetAlpha( 0.2, 200, LUI.EASING.outSine )
				end
			}
		} )
		self._sequences.FullyCharged = function ()
			LeftRing:AnimateSequence( "FullyCharged" )
			RightRing:AnimateSequence( "FullyCharged" )
			ChargeRing:AnimateSequence( "FullyCharged" )
		end
		
		LeftRing:RegisterAnimationSequence( "FullyChargedLoop", {
			{
				function ()
					return self.LeftRing:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.LeftRing:SetAlpha( 1, 200 )
				end,
				function ()
					return self.LeftRing:SetAlpha( 0.6, 200 )
				end
			}
		} )
		RightRing:RegisterAnimationSequence( "FullyChargedLoop", {
			{
				function ()
					return self.RightRing:SetAlpha( 0.6, 0 )
				end,
				function ()
					return self.RightRing:SetAlpha( 1, 200 )
				end,
				function ()
					return self.RightRing:SetAlpha( 0.6, 200 )
				end
			}
		} )
		self._sequences.FullyChargedLoop = function ()
			LeftRing:AnimateLoop( "FullyChargedLoop" )
			RightRing:AnimateLoop( "FullyChargedLoop" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleGaussLChargeMeter", ReticleGaussLChargeMeter )
LockTable( _M )
