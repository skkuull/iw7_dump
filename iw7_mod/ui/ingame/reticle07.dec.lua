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

function Reticle07( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "Reticle07"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local SquareShadow = nil
	
	SquareShadow = LUI.UIImage.new()
	SquareShadow.id = "SquareShadow"
	SquareShadow:SetRGBFromInt( 13729280, 0 )
	SquareShadow:SetAlpha( 0.2, 0 )
	SquareShadow:SetScale( 0.01, 0 )
	SquareShadow:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	SquareShadow:SetUseAA( true )
	SquareShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -17, _1080p * 17 )
	self:addElement( SquareShadow )
	self.SquareShadow = SquareShadow
	
	local SquareHighlight = nil
	
	SquareHighlight = LUI.UIImage.new()
	SquareHighlight.id = "SquareHighlight"
	SquareHighlight:SetRGBFromInt( 13729280, 0 )
	SquareHighlight:SetAlpha( 0.2, 0 )
	SquareHighlight:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	SquareHighlight:SetUseAA( true )
	SquareHighlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	SquareHighlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -17, _1080p * 17, _1080p * -17, _1080p * 17 )
	self:addElement( SquareHighlight )
	self.SquareHighlight = SquareHighlight
	
	local Glow = nil
	
	Glow = LUI.UIImage.new()
	Glow.id = "Glow"
	Glow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Glow:SetAlpha( 0.1, 0 )
	Glow:setImage( RegisterMaterial( "hud_reticle_radial_glow" ), 0 )
	Glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( Glow )
	self.Glow = Glow
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		SquareShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.SquareShadow:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.SquareShadow:SetScale( -0.29, 60 )
				end
			}
		} )
		SquareHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.SquareHighlight:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.SquareHighlight:SetScale( -0.3, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			SquareShadow:AnimateSequence( "ADSIN" )
			SquareHighlight:AnimateSequence( "ADSIN" )
		end
		
		SquareShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.SquareShadow:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.SquareShadow:SetAlpha( 0.15, 60 )
				end
			},
			{
				function ()
					return self.SquareShadow:SetScale( 0.2, 60 )
				end
			}
		} )
		SquareHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.SquareHighlight:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.SquareHighlight:SetAlpha( 0.15, 60 )
				end
			},
			{
				function ()
					return self.SquareHighlight:SetScale( 0.1, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			SquareShadow:AnimateLoop( "ADSOUT" )
			SquareHighlight:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle07", Reticle07 )
LockTable( _M )
