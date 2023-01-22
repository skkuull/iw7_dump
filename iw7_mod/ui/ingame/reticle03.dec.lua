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

function Reticle03( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "Reticle03"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local TieRShadow = nil
	
	TieRShadow = LUI.UIImage.new()
	TieRShadow.id = "TieRShadow"
	TieRShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	TieRShadow:SetAlpha( 0.3, 0 )
	TieRShadow:SetZRotation( 90, 0 )
	TieRShadow:setImage( RegisterMaterial( "hud_reticle_trapezoid" ), 0 )
	TieRShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2.5, _1080p * 33.5, _1080p * -2, _1080p * 2 )
	self:addElement( TieRShadow )
	self.TieRShadow = TieRShadow
	
	local TieLShadow = nil
	
	TieLShadow = LUI.UIImage.new()
	TieLShadow.id = "TieLShadow"
	TieLShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	TieLShadow:SetAlpha( 0.3, 0 )
	TieLShadow:SetZRotation( -90, 0 )
	TieLShadow:setImage( RegisterMaterial( "hud_reticle_trapezoid" ), 0 )
	TieLShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -33.5, _1080p * 2.5, _1080p * -2, _1080p * 2 )
	self:addElement( TieLShadow )
	self.TieLShadow = TieLShadow
	
	local TieL = nil
	
	TieL = LUI.UIImage.new()
	TieL.id = "TieL"
	TieL:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	TieL:SetAlpha( 0.6, 0 )
	TieL:SetZRotation( -90, 0 )
	TieL:setImage( RegisterMaterial( "hud_reticle_trapezoid" ), 0 )
	TieL:SetBlendMode( BLEND_MODE.addWithAlpha )
	TieL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31.5, _1080p * 1.5, _1080p * -1, _1080p * 1 )
	self:addElement( TieL )
	self.TieL = TieL
	
	local TieR = nil
	
	TieR = LUI.UIImage.new()
	TieR.id = "TieR"
	TieR:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	TieR:SetAlpha( 0.6, 0 )
	TieR:SetZRotation( 90, 0 )
	TieR:setImage( RegisterMaterial( "hud_reticle_trapezoid" ), 0 )
	TieR:SetBlendMode( BLEND_MODE.addWithAlpha )
	TieR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 31.5, _1080p * -1, _1080p * 1 )
	self:addElement( TieR )
	self.TieR = TieR
	
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
		
		TieRShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TieRShadow:SetAlpha( 0.6, 60 )
				end
			}
		} )
		TieLShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TieLShadow:SetAlpha( 0.6, 60 )
				end
			}
		} )
		TieL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TieL:SetAlpha( 0.8, 60 )
				end
			}
		} )
		TieR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.TieR:SetAlpha( 0.8, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			TieRShadow:AnimateSequence( "ADSIN" )
			TieLShadow:AnimateSequence( "ADSIN" )
			TieL:AnimateSequence( "ADSIN" )
			TieR:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		TieRShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TieRShadow:SetAlpha( 0.1, 60 )
				end
			}
		} )
		TieLShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TieLShadow:SetAlpha( 0.1, 60 )
				end
			}
		} )
		TieL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TieL:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.TieL:SetAlpha( 0.2, 60 )
				end
			}
		} )
		TieR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.TieR:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.TieR:SetAlpha( 0.2, 60 )
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
			TieRShadow:AnimateLoop( "ADSOUT" )
			TieLShadow:AnimateLoop( "ADSOUT" )
			TieL:AnimateLoop( "ADSOUT" )
			TieR:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle03", Reticle03 )
LockTable( _M )
