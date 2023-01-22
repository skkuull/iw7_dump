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

function Reticle06( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 80 * _1080p )
	self.id = "Reticle06"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CrownShadow = nil
	
	CrownShadow = LUI.UIImage.new()
	CrownShadow.id = "CrownShadow"
	CrownShadow:SetRGBFromInt( 28234, 0 )
	CrownShadow:SetAlpha( 0.4, 0 )
	CrownShadow:setImage( RegisterMaterial( "hud_reticle_notch_straight" ), 0 )
	CrownShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * 22, _1080p * -40, _1080p * 40 )
	self:addElement( CrownShadow )
	self.CrownShadow = CrownShadow
	
	local Crown = nil
	
	Crown = LUI.UIImage.new()
	Crown.id = "Crown"
	Crown:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	Crown:SetAlpha( 0.6, 0 )
	Crown:setImage( RegisterMaterial( "hud_reticle_notch_straight" ), 0 )
	Crown:SetBlendMode( BLEND_MODE.addWithAlpha )
	Crown:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * 22, _1080p * -40, _1080p * 40 )
	self:addElement( Crown )
	self.Crown = Crown
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	DotBase.DotShadow:SetAlpha( 0.8, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.Dot:SetAlpha( 0.6, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DotBase.DotHighlight:SetAlpha( 0.8, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrownShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CrownShadow:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.CrownShadow:SetScale( 0, 60 )
				end
			}
		} )
		Crown:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Crown:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Crown:SetScale( 0, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			CrownShadow:AnimateSequence( "ADSIN" )
			Crown:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		CrownShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CrownShadow:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.CrownShadow:SetScale( -0.2, 60 )
				end
			}
		} )
		Crown:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Crown:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Crown:SetAlpha( 0.1, 60 )
				end
			},
			{
				function ()
					return self.Crown:SetScale( -0.2, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			CrownShadow:AnimateLoop( "ADSOUT" )
			Crown:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle06", Reticle06 )
LockTable( _M )
