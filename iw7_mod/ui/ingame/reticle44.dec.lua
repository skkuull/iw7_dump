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

function Reticle44( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle44"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local StarRingS = nil
	
	StarRingS = LUI.UIImage.new()
	StarRingS.id = "StarRingS"
	StarRingS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	StarRingS:SetAlpha( 0.4, 0 )
	StarRingS:SetScale( -0.03, 0 )
	StarRingS:setImage( RegisterMaterial( "hud_reticle_44" ), 0 )
	StarRingS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 29, _1080p * -29, _1080p * 29 )
	self:addElement( StarRingS )
	self.StarRingS = StarRingS
	
	local StarRing = nil
	
	StarRing = LUI.UIImage.new()
	StarRing.id = "StarRing"
	StarRing:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	StarRing:SetAlpha( 0.8, 0 )
	StarRing:setImage( RegisterMaterial( "hud_reticle_44" ), 0 )
	StarRing:SetBlendMode( BLEND_MODE.addWithAlpha )
	StarRing:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -29, _1080p * 29, _1080p * -29, _1080p * 29 )
	self:addElement( StarRing )
	self.StarRing = StarRing
	
	local CrosshairS = nil
	
	CrosshairS = LUI.UIImage.new()
	CrosshairS.id = "CrosshairS"
	CrosshairS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	CrosshairS:SetAlpha( 0.6, 0 )
	CrosshairS:SetZRotation( 45, 0 )
	CrosshairS:SetScale( -0.05, 0 )
	CrosshairS:setImage( RegisterMaterial( "hud_reticle_44b" ), 0 )
	CrosshairS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( CrosshairS )
	self.CrosshairS = CrosshairS
	
	local Crosshair = nil
	
	Crosshair = LUI.UIImage.new()
	Crosshair.id = "Crosshair"
	Crosshair:SetAlpha( 0.4, 0 )
	Crosshair:SetZRotation( 45, 0 )
	Crosshair:setImage( RegisterMaterial( "hud_reticle_44b" ), 0 )
	Crosshair:SetBlendMode( BLEND_MODE.addWithAlpha )
	Crosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( Crosshair )
	self.Crosshair = Crosshair
	
	local CircleS = nil
	
	CircleS = LUI.UIImage.new()
	CircleS.id = "CircleS"
	CircleS:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	CircleS:SetAlpha( 0.6, 0 )
	CircleS:SetScale( -0.06, 0 )
	CircleS:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	CircleS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( CircleS )
	self.CircleS = CircleS
	
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Circle:SetAlpha( 0.6, 0 )
	Circle:SetScale( -0.25, 0 )
	Circle:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	Circle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Circle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( Circle )
	self.Circle = Circle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrosshairS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.CrosshairS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 52, _1080p * -52, _1080p * 52, 39 )
				end,
				function ()
					return self.CrosshairS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19, 160, LUI.EASING.inCubic )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Crosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -52, _1080p * 52, _1080p * -52, _1080p * 52, 39 )
				end,
				function ()
					return self.Crosshair:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19, 160, LUI.EASING.inCubic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			CrosshairS:AnimateSequence( "OnFire" )
			Crosshair:AnimateSequence( "OnFire" )
		end
		
		StarRingS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.StarRingS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		StarRing:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.StarRing:SetAlpha( 0.8, 60 )
				end
			}
		} )
		CrosshairS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CrosshairS:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0.4, 60 )
				end
			}
		} )
		CircleS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleS:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Circle:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			StarRingS:AnimateSequence( "ADSIN" )
			StarRing:AnimateSequence( "ADSIN" )
			CrosshairS:AnimateSequence( "ADSIN" )
			Crosshair:AnimateSequence( "ADSIN" )
			CircleS:AnimateSequence( "ADSIN" )
			Circle:AnimateSequence( "ADSIN" )
		end
		
		StarRingS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.StarRingS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		StarRing:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.StarRing:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.StarRing:SetAlpha( 0.3, 60 )
				end
			}
		} )
		CrosshairS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CrosshairS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Crosshair:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Crosshair:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Crosshair:SetAlpha( 0.3, 60 )
				end
			}
		} )
		CircleS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CircleS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Circle:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Circle:SetAlpha( 0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			StarRingS:AnimateLoop( "ADSOUT" )
			StarRing:AnimateLoop( "ADSOUT" )
			CrosshairS:AnimateLoop( "ADSOUT" )
			Crosshair:AnimateLoop( "ADSOUT" )
			CircleS:AnimateLoop( "ADSOUT" )
			Circle:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle44", Reticle44 )
LockTable( _M )
