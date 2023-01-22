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

function Reticle04( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle04"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Cross = nil
	
	Cross = LUI.UIImage.new()
	Cross.id = "Cross"
	Cross:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Cross:SetAlpha( 0.8, 0 )
	Cross:setImage( RegisterMaterial( "hud_reticle_trapezoid_cross" ), 0 )
	Cross:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * 28, _1080p * -28, _1080p * 28 )
	self:addElement( Cross )
	self.Cross = Cross
	
	local CrossH = nil
	
	CrossH = LUI.UIImage.new()
	CrossH.id = "CrossH"
	CrossH:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	CrossH:SetAlpha( 0.2, 0 )
	CrossH:setImage( RegisterMaterial( "hud_reticle_trapezoid_cross" ), 0 )
	CrossH:SetBlendMode( BLEND_MODE.addWithAlpha )
	CrossH:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * 28, _1080p * -28, _1080p * 28 )
	self:addElement( CrossH )
	self.CrossH = CrossH
	
	local CircleShadow = nil
	
	CircleShadow = LUI.UIImage.new()
	CircleShadow.id = "CircleShadow"
	CircleShadow:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	CircleShadow:SetAlpha( 0.6, 0 )
	CircleShadow:SetScale( 0.32, 0 )
	CircleShadow:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	CircleShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( CircleShadow )
	self.CircleShadow = CircleShadow
	
	local Circle = nil
	
	Circle = LUI.UIImage.new()
	Circle.id = "Circle"
	Circle:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Circle:SetAlpha( 0.4, 0 )
	Circle:setImage( RegisterMaterial( "hud_reticle_circle_outline_small" ), 0 )
	Circle:SetBlendMode( BLEND_MODE.addWithAlpha )
	Circle:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.4, _1080p * 3.4, _1080p * -3.4, _1080p * 3.4 )
	self:addElement( Circle )
	self.Circle = Circle
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Cross:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Cross:SetAlpha( 0.2, 60 )
				end
			}
		} )
		CrossH:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CrossH:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.CrossH:SetAlpha( 0.2, 60 )
				end
			}
		} )
		CircleShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CircleShadow:SetAlpha( 0.3, 60 )
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
			Cross:AnimateLoop( "ADSOUT" )
			CrossH:AnimateLoop( "ADSOUT" )
			CircleShadow:AnimateLoop( "ADSOUT" )
			Circle:AnimateLoop( "ADSOUT" )
		end
		
		Cross:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Cross:SetAlpha( 0.4, 60 )
				end
			}
		} )
		CrossH:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CrossH:SetAlpha( 0.2, 60 )
				end
			}
		} )
		CircleShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CircleShadow:SetAlpha( 0.7, 60 )
				end
			}
		} )
		Circle:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Circle:SetAlpha( 0.3, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Cross:AnimateSequence( "ADSIN" )
			CrossH:AnimateSequence( "ADSIN" )
			CircleShadow:AnimateSequence( "ADSIN" )
			Circle:AnimateSequence( "ADSIN" )
		end
		
		Cross:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Cross:SetZRotation( 0, 0 )
				end,
				function ()
					return self.Cross:SetZRotation( -90, 70 )
				end,
				function ()
					return self.Cross:SetZRotation( -180, 630, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.Cross:SetScale( 1, 0 )
				end,
				function ()
					return self.Cross:SetScale( 1, 70 )
				end,
				function ()
					return self.Cross:SetScale( 0, 630, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.Cross:SetAlpha( 0.2, 0 )
				end
			}
		} )
		CrossH:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.CrossH:SetZRotation( 0, 0 )
				end,
				function ()
					return self.CrossH:SetZRotation( -90, 70 )
				end,
				function ()
					return self.CrossH:SetZRotation( -180, 630, LUI.EASING.outCubic )
				end
			},
			{
				function ()
					return self.CrossH:SetScale( 1, 0 )
				end,
				function ()
					return self.CrossH:SetScale( 1, 70 )
				end,
				function ()
					return self.CrossH:SetScale( 0, 630, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Cross:AnimateSequence( "OnFire" )
			CrossH:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle04", Reticle04 )
LockTable( _M )
