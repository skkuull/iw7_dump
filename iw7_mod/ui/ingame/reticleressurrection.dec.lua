local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
	f1_arg0:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
end

function ReticleRessurrection( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "ReticleRessurrection"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleRessurrectionBase = nil
	
	ReticleRessurrectionBase = MenuBuilder.BuildRegisteredType( "ReticleRessurrectionBase", {
		controllerIndex = f3_local1
	} )
	ReticleRessurrectionBase.id = "ReticleRessurrectionBase"
	ReticleRessurrectionBase:SetAlpha( 0.5, 0 )
	ReticleRessurrectionBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55.82, _1080p * 55.82, _1080p * -49, _1080p * 49 )
	self:addElement( ReticleRessurrectionBase )
	self.ReticleRessurrectionBase = ReticleRessurrectionBase
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0.4, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -5, _1080p * 1 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleRessurrectionBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleRessurrectionBase:SetRGBFromTable( SWATCHES.Reticles.Red, 80 )
				end
			},
			{
				function ()
					return self.ReticleRessurrectionBase:SetAlpha( 0.8, 80 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.LightRed, 80 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Red, 80 )
				end
			},
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Red, 80 )
				end
			},
			{
				function ()
					return self.DotBase:SetAlpha( 0.8, 80 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetScale( 0.25, 80 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3, 79 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleRessurrectionBase:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		ReticleRessurrectionBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleRessurrectionBase:SetAlpha( 0.6, 40 )
				end,
				function ()
					return self.ReticleRessurrectionBase:SetAlpha( 0.4, 40 )
				end
			},
			{
				function ()
					return self.ReticleRessurrectionBase:SetRGBFromTable( SWATCHES.Reticles.White, 80 )
				end
			},
			{
				function ()
					return self.ReticleRessurrectionBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55.82, _1080p * 55.82, _1080p * -49, _1080p * 49, 79 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.6, 40 )
				end,
				function ()
					return self.DotBase:SetAlpha( 0.4, 40 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.White, 80 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.White, 80 )
				end
			},
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 80 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetScale( -0.55, 80 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -5, _1080p * 1, 79 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleRessurrectionBase:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRessurrection", ReticleRessurrection )
LockTable( _M )
