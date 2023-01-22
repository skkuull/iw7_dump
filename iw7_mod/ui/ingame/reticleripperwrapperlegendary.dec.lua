local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticleRipperWrapperLegendary( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "ReticleRipperWrapperLegendary"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ReticleCircleQuadTickTeal = nil
	
	ReticleCircleQuadTickTeal = MenuBuilder.BuildRegisteredType( "ReticleCircleQuadTickTeal", {
		controllerIndex = f3_local1
	} )
	ReticleCircleQuadTickTeal.id = "ReticleCircleQuadTickTeal"
	ReticleCircleQuadTickTeal:SetScale( -0.2, 0 )
	ReticleCircleQuadTickTeal:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -41, _1080p * 23 )
	self:addElement( ReticleCircleQuadTickTeal )
	self.ReticleCircleQuadTickTeal = ReticleCircleQuadTickTeal
	
	local ScreenShadow = nil
	
	ScreenShadow = LUI.UIImage.new()
	ScreenShadow.id = "ScreenShadow"
	ScreenShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ScreenShadow:SetXRotation( -8, 0 )
	ScreenShadow:SetScale( 0.02, 0 )
	ScreenShadow:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	ScreenShadow:SetUseAA( true )
	ScreenShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, _1080p * -1.95, _1080p * 101.96 )
	ScreenShadow:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f4_local0 ~= nil then
			ScreenShadow:SetAlpha( Lerp( f4_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( ScreenShadow )
	self.ScreenShadow = ScreenShadow
	
	local Screen = nil
	
	Screen = LUI.UIImage.new()
	Screen.id = "Screen"
	Screen:SetRGBFromInt( 3932047, 0 )
	Screen:SetXRotation( -8, 0 )
	Screen:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	Screen:SetUseAA( true )
	Screen:SetBlendMode( BLEND_MODE.addWithAlpha )
	Screen:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -42, _1080p * 42, _1080p * -3, _1080p * 103 )
	Screen:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f3_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f3_local1 )
		if f5_local0 ~= nil then
			Screen:SetAlpha( Lerp( f5_local0, 0, 0.8 ), 0 )
		end
	end )
	self:addElement( Screen )
	self.Screen = Screen
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ReticleCircleQuadTickTeal:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ReticleCircleQuadTickTeal:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTickTeal:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -32, _1080p * 32, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ReticleCircleQuadTickTeal:AnimateSequence( "ADSIN" )
		end
		
		ReticleCircleQuadTickTeal:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ReticleCircleQuadTickTeal:SetScale( -0.2, 60 )
				end
			},
			{
				function ()
					return self.ReticleCircleQuadTickTeal:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -41, _1080p * 23, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ReticleCircleQuadTickTeal:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleRipperWrapperLegendary", ReticleRipperWrapperLegendary )
LockTable( _M )
