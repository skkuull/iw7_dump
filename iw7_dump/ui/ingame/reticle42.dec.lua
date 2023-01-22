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

function Reticle42( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle42"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DarkSwirl = nil
	
	DarkSwirl = LUI.UIImage.new()
	DarkSwirl.id = "DarkSwirl"
	DarkSwirl:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DarkSwirl:SetAlpha( 0.4, 0 )
	DarkSwirl:setImage( RegisterMaterial( "hud_reticle_42" ), 0 )
	DarkSwirl:SetBlendMode( BLEND_MODE.addWithAlpha )
	DarkSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45 )
	self:addElement( DarkSwirl )
	self.DarkSwirl = DarkSwirl
	
	local LightSwirlS = nil
	
	LightSwirlS = LUI.UIImage.new()
	LightSwirlS.id = "LightSwirlS"
	LightSwirlS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	LightSwirlS:SetAlpha( 0.4, 0 )
	LightSwirlS:SetZRotation( 67, 0 )
	LightSwirlS:setImage( RegisterMaterial( "hud_reticle_42" ), 0 )
	LightSwirlS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45 )
	self:addElement( LightSwirlS )
	self.LightSwirlS = LightSwirlS
	
	local LightSwirl = nil
	
	LightSwirl = LUI.UIImage.new()
	LightSwirl.id = "LightSwirl"
	LightSwirl:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	LightSwirl:SetAlpha( 0.4, 0 )
	LightSwirl:SetZRotation( 22, 0 )
	LightSwirl:setImage( RegisterMaterial( "hud_reticle_42" ), 0 )
	LightSwirl:SetBlendMode( BLEND_MODE.addWithAlpha )
	LightSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -45, _1080p * 45, _1080p * -45, _1080p * 45 )
	self:addElement( LightSwirl )
	self.LightSwirl = LightSwirl
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.DotShadow:SetAlpha( 1, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	DotBase.Dot:SetAlpha( 0.4, 0 )
	DotBase.Dot:SetScale( 0.5, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Yellow, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DarkSwirl:RegisterAnimationSequence( "SpinLoop", {
			{
				function ()
					return self.DarkSwirl:SetZRotation( 0, 0 )
				end,
				function ()
					return self.DarkSwirl:SetZRotation( 45, 4000 )
				end
			}
		} )
		LightSwirlS:RegisterAnimationSequence( "SpinLoop", {
			{
				function ()
					return self.LightSwirlS:SetZRotation( 22, 0 )
				end,
				function ()
					return self.LightSwirlS:SetZRotation( 67, 4000 )
				end
			}
		} )
		LightSwirl:RegisterAnimationSequence( "SpinLoop", {
			{
				function ()
					return self.LightSwirl:SetZRotation( 22, 0 )
				end,
				function ()
					return self.LightSwirl:SetZRotation( 67, 4000 )
				end
			}
		} )
		self._sequences.SpinLoop = function ()
			DarkSwirl:AnimateLoop( "SpinLoop" )
			LightSwirlS:AnimateLoop( "SpinLoop" )
			LightSwirl:AnimateLoop( "SpinLoop" )
		end
		
		DarkSwirl:RegisterAnimationSequence( "SizeLoop", {
			{
				function ()
					return self.DarkSwirl:SetScale( 0, 0 )
				end,
				function ()
					return self.DarkSwirl:SetScale( 0.16, 2500, LUI.EASING.inOutSine )
				end,
				function ()
					return self.DarkSwirl:SetScale( 0, 2500, LUI.EASING.inOutSine )
				end
			}
		} )
		self._sequences.SizeLoop = function ()
			DarkSwirl:AnimateLoop( "SizeLoop" )
		end
		
		DarkSwirl:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DarkSwirl:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.DarkSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 59 )
				end
			}
		} )
		LightSwirlS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LightSwirlS:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LightSwirlS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 59 )
				end
			}
		} )
		LightSwirl:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LightSwirl:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LightSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -53, _1080p * 53, _1080p * -53, _1080p * 53, 59 )
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
			DarkSwirl:AnimateSequence( "ADSIN" )
			LightSwirlS:AnimateSequence( "ADSIN" )
			LightSwirl:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		DarkSwirl:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DarkSwirl:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.DarkSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24, 59 )
				end
			}
		} )
		LightSwirlS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LightSwirlS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.LightSwirlS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24, 59 )
				end
			}
		} )
		LightSwirl:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LightSwirl:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.LightSwirl:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.LightSwirl:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -24, _1080p * 24, _1080p * -24, _1080p * 24, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			DarkSwirl:AnimateLoop( "ADSOUT" )
			LightSwirlS:AnimateLoop( "ADSOUT" )
			LightSwirl:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "SpinLoop" )
	ACTIONS.AnimateSequence( self, "SizeLoop" )
	return self
end

MenuBuilder.registerType( "Reticle42", Reticle42 )
LockTable( _M )
