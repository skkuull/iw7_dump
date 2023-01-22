local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle01( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p )
	self.id = "Reticle01"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TrapTriShadow = nil
	
	TrapTriShadow = LUI.UIImage.new()
	TrapTriShadow.id = "TrapTriShadow"
	TrapTriShadow:SetRGBFromInt( 36963, 0 )
	TrapTriShadow:SetAlpha( 0.4, 0 )
	TrapTriShadow:setImage( RegisterMaterial( "hud_reticle_trapezoid_triangle" ), 0 )
	TrapTriShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 29, _1080p * -29, _1080p * 29 )
	self:addElement( TrapTriShadow )
	self.TrapTriShadow = TrapTriShadow
	
	local TrapTri = nil
	
	TrapTri = LUI.UIImage.new()
	TrapTri.id = "TrapTri"
	TrapTri:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	TrapTri:SetAlpha( 0.6, 0 )
	TrapTri:setImage( RegisterMaterial( "hud_reticle_trapezoid_triangle" ), 0 )
	TrapTri:SetBlendMode( BLEND_MODE.addWithAlpha )
	TrapTri:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 29, _1080p * -29, _1080p * 29 )
	self:addElement( TrapTri )
	self.TrapTri = TrapTri
	
	local Reticle01Base = nil
	
	Reticle01Base = MenuBuilder.BuildRegisteredType( "Reticle01Base", {
		controllerIndex = f3_local1
	} )
	Reticle01Base.id = "Reticle01Base"
	Reticle01Base:SetRGBFromInt( 9961216, 0 )
	Reticle01Base:SetAlpha( 0.6, 0 )
	Reticle01Base:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 5 )
	self:addElement( Reticle01Base )
	self.Reticle01Base = Reticle01Base
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TrapTriShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TrapTriShadow:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.TrapTriShadow:SetScale( -0.02, 60 )
				end
			}
		} )
		TrapTri:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TrapTri:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.TrapTri:SetScale( 0, 60 )
				end
			}
		} )
		Reticle01Base:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle01Base:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.Reticle01Base:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			TrapTriShadow:AnimateSequence( "ADSIN" )
			TrapTri:AnimateSequence( "ADSIN" )
			Reticle01Base:AnimateSequence( "ADSIN" )
		end
		
		TrapTriShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TrapTriShadow:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.TrapTriShadow:SetScale( -0.15, 60 )
				end
			}
		} )
		TrapTri:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TrapTri:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.TrapTri:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.TrapTri:SetScale( -0.15, 60 )
				end
			}
		} )
		Reticle01Base:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle01Base:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.Reticle01Base:SetScale( -0.15, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			TrapTriShadow:AnimateSequence( "ADSOUT" )
			TrapTri:AnimateSequence( "ADSOUT" )
			Reticle01Base:AnimateSequence( "ADSOUT" )
		end
		
		TrapTriShadow:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TrapTriShadow:SetScale( 0.25, 0 )
				end,
				function ()
					return self.TrapTriShadow:SetScale( -0.03, 70 )
				end
			}
		} )
		TrapTri:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TrapTri:SetScale( 0.3, 0 )
				end,
				function ()
					return self.TrapTri:SetScale( 0, 70 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			TrapTriShadow:AnimateSequence( "OnFire" )
			TrapTri:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
		ACTIONS.AnimateSequenceByElement( self, {
			elementName = "Reticle01Base",
			sequenceName = "OnFire",
			elementPath = "Reticle01Base"
		} )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle01", Reticle01 )
LockTable( _M )
