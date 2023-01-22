local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.75
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if f1_arg0.isVisible ~= true and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.Back:SetHorSkewFactor( 7 )
			f1_arg0.Back:SetVertSkewFactor( 7 )
			f1_arg0.BackS:SetHorSkewFactor( 7 )
			f1_arg0.BackS:SetVertSkewFactor( 7 )
			f1_arg0.Prongs:SetHorSkewFactor( 7 )
			f1_arg0.Prongs:SetVertSkewFactor( 7 )
			f1_arg0.ProngsS:SetHorSkewFactor( 7 )
			f1_arg0.ProngsS:SetVertSkewFactor( 7 )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible ~= false and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.Back:SetHorSkewFactor( 0 )
			f1_arg0.Back:SetVertSkewFactor( 0 )
			f1_arg0.BackS:SetHorSkewFactor( 0 )
			f1_arg0.BackS:SetVertSkewFactor( 0 )
			f1_arg0.Prongs:SetHorSkewFactor( 0 )
			f1_arg0.Prongs:SetVertSkewFactor( 0 )
			f1_arg0.ProngsS:SetHorSkewFactor( 0 )
			f1_arg0.ProngsS:SetVertSkewFactor( 0 )
			f1_arg0.isVisible = false
		end
	end )
end

function Reticle14( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "Reticle14"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ProngsS = nil
	
	ProngsS = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 0,
		vertSkewFactor = 0,
		controllerIndex = f3_local1
	} )
	ProngsS.id = "ProngsS"
	ProngsS:SetAlpha( 0.4, 0 )
	ProngsS:setImage( RegisterMaterial( "hud_reticle_14b" ), 0 )
	ProngsS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -67, _1080p * 25 )
	self:addElement( ProngsS )
	self.ProngsS = ProngsS
	
	local Prongs = nil
	
	Prongs = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 0,
		vertSkewFactor = 0,
		controllerIndex = f3_local1
	} )
	Prongs.id = "Prongs"
	Prongs:SetAlpha( 0.8, 0 )
	Prongs:setImage( RegisterMaterial( "hud_reticle_14b" ), 0 )
	Prongs:SetBlendMode( BLEND_MODE.addWithAlpha )
	Prongs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -88, _1080p * 40 )
	self:addElement( Prongs )
	self.Prongs = Prongs
	
	local BackS = nil
	
	BackS = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 0,
		vertSkewFactor = 0,
		controllerIndex = f3_local1
	} )
	BackS.id = "BackS"
	BackS:SetRGBFromInt( 10066329, 0 )
	BackS:SetAlpha( 0.4, 0 )
	BackS:setImage( RegisterMaterial( "hud_reticle_14" ), 0 )
	BackS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -24, _1080p * 68 )
	self:addElement( BackS )
	self.BackS = BackS
	
	local Back = nil
	
	Back = MenuBuilder.BuildRegisteredType( "ScopeReticleParallaxer", {
		horSkewFactor = 0,
		vertSkewFactor = 0,
		controllerIndex = f3_local1
	} )
	Back.id = "Back"
	Back:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	Back:SetAlpha( 0.6, 0 )
	Back:setImage( RegisterMaterial( "hud_reticle_14" ), 0 )
	Back:SetBlendMode( BLEND_MODE.addWithAlpha )
	Back:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -29, _1080p * 99 )
	self:addElement( Back )
	self.Back = Back
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromInt( 39168, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	DotBase.DotHighlight:SetRGBFromInt( 13958912, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ProngsS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ProngsS:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.ProngsS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -88, _1080p * 40, 50 )
				end
			}
		} )
		Prongs:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Prongs:SetAlpha( 0.6, 50 )
				end
			},
			{
				function ()
					return self.Prongs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -88, _1080p * 40, 50 )
				end
			}
		} )
		BackS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BackS:SetAlpha( 0.6, 50 )
				end
			},
			{
				function ()
					return self.BackS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -29, _1080p * 99, 50 )
				end
			}
		} )
		Back:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Back:SetAlpha( 0.6, 50 )
				end
			},
			{
				function ()
					return self.Back:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -29, _1080p * 99, 50 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ProngsS:AnimateSequence( "ADSIN" )
			Prongs:AnimateSequence( "ADSIN" )
			BackS:AnimateSequence( "ADSIN" )
			Back:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		ProngsS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ProngsS:SetAlpha( 0.2, 50 )
				end
			},
			{
				function ()
					return self.ProngsS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -67, _1080p * 25, 50 )
				end
			}
		} )
		Prongs:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Prongs:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Prongs:SetAlpha( 0.4, 50 )
				end
			},
			{
				function ()
					return self.Prongs:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -67, _1080p * 25, 50 )
				end
			}
		} )
		BackS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BackS:SetAlpha( 0.2, 50 )
				end
			},
			{
				function ()
					return self.BackS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -24, _1080p * 68, 50 )
				end
			}
		} )
		Back:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Back:SetAlpha( 0.2, 50 )
				end
			},
			{
				function ()
					return self.Back:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -46, _1080p * 46, _1080p * -24, _1080p * 68, 50 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.4, 50 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ProngsS:AnimateLoop( "ADSOUT" )
			Prongs:AnimateLoop( "ADSOUT" )
			BackS:AnimateLoop( "ADSOUT" )
			Back:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle14", Reticle14 )
LockTable( _M )
