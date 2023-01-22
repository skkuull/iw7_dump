local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
	local f1_local1 = DataSources.inGame.player.currentWeapon.adsPercent
	f1_arg0:SubscribeToModel( f1_local1:GetModel( f1_arg1 ), function ( f2_arg0 )
		local f2_local0 = DataModel.GetModelValue( f2_arg0 )
		if not f1_arg0.isVisible and f1_local0 <= f2_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
			f1_arg0.isVisible = true
		elseif f1_arg0.isVisible and f2_local0 < f1_local0 then
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
			f1_arg0.isVisible = false
		end
	end )
	local f1_local2 = f1_local1:GetValue( f1_arg1 )
	if f1_local2 then
		if f1_local0 <= f1_local2 then
			f1_arg0.isVisible = true
			ACTIONS.AnimateSequence( f1_arg0, "ADSIN" )
		else
			f1_arg0.isVisible = false
			ACTIONS.AnimateSequence( f1_arg0, "ADSOUT" )
		end
	end
end

function ReticleHybridZoomed( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 300 * _1080p, 0, 250 * _1080p )
	self.id = "ReticleHybridZoomed"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local glowS = nil
	
	glowS = LUI.UIImage.new()
	glowS.id = "glowS"
	glowS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	glowS:SetAlpha( 0, 0 )
	glowS:SetScale( -0.1, 0 )
	glowS:setImage( RegisterMaterial( "hud_reticle_full_circle" ), 0 )
	glowS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9.96, _1080p * 9.96, _1080p * -9.96, _1080p * 9.96 )
	self:addElement( glowS )
	self.glowS = glowS
	
	local glow = nil
	
	glow = LUI.UIImage.new()
	glow.id = "glow"
	glow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	glow:SetAlpha( 0, 0 )
	glow:setImage( RegisterMaterial( "hud_reticle_full_circle" ), 0 )
	glow:SetBlendMode( BLEND_MODE.addWithAlpha )
	glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9 )
	self:addElement( glow )
	self.glow = glow
	
	local ZoomS2 = nil
	
	ZoomS2 = LUI.UIImage.new()
	ZoomS2.id = "ZoomS2"
	ZoomS2:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ZoomS2:SetAlpha( 0.4, 0 )
	ZoomS2:SetZRotation( 180, 0 )
	ZoomS2:SetScale( -0.02, 0 )
	ZoomS2:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	ZoomS2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9 )
	self:addElement( ZoomS2 )
	self.ZoomS2 = ZoomS2
	
	local ZoomS = nil
	
	ZoomS = LUI.UIImage.new()
	ZoomS.id = "ZoomS"
	ZoomS:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	ZoomS:SetAlpha( 0.4, 0 )
	ZoomS:SetZRotation( 180, 0 )
	ZoomS:SetScale( 0.04, 0 )
	ZoomS:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	ZoomS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9 )
	self:addElement( ZoomS )
	self.ZoomS = ZoomS
	
	local Zoom = nil
	
	Zoom = LUI.UIImage.new()
	Zoom.id = "Zoom"
	Zoom:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Zoom:SetAlpha( 0.8, 0 )
	Zoom:SetZRotation( 180, 0 )
	Zoom:setImage( RegisterMaterial( "hud_reticle_circle_notch_dot" ), 0 )
	Zoom:SetBlendMode( BLEND_MODE.addWithAlpha )
	Zoom:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9 )
	self:addElement( Zoom )
	self.Zoom = Zoom
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase.DotHighlight:SetAlpha( 0.4, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * -1.5, _1080p * 1.5 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ZoomS2:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ZoomS2:SetAlpha( 0.4, 60 )
				end
			}
		} )
		ZoomS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ZoomS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Zoom:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Zoom:SetAlpha( 0.8, 60 )
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
			ZoomS2:AnimateSequence( "ADSIN" )
			ZoomS:AnimateSequence( "ADSIN" )
			Zoom:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		glowS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.glowS:SetAlpha( 0, 60 )
				end
			}
		} )
		ZoomS2:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ZoomS2:SetAlpha( 0, 60 )
				end
			}
		} )
		ZoomS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ZoomS:SetAlpha( 0, 60 )
				end
			}
		} )
		Zoom:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Zoom:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Zoom:SetAlpha( 0.2, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.2, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			glowS:AnimateLoop( "ADSOUT" )
			ZoomS2:AnimateLoop( "ADSOUT" )
			ZoomS:AnimateLoop( "ADSOUT" )
			Zoom:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
		glowS:RegisterAnimationSequence( "PerceptionOn", {
			{
				function ()
					return self.glowS:SetAlpha( 0.4, 100 )
				end
			},
			{
				function ()
					return self.glowS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5.6, _1080p * 5.6, _1080p * -5.6, _1080p * 5.6, 100 )
				end
			}
		} )
		glow:RegisterAnimationSequence( "PerceptionOn", {
			{
				function ()
					return self.glow:SetAlpha( 0.6, 100 )
				end
			},
			{
				function ()
					return self.glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * 5, _1080p * -5, _1080p * 5, 100 )
				end
			}
		} )
		self._sequences.PerceptionOn = function ()
			glowS:AnimateSequence( "PerceptionOn" )
			glow:AnimateSequence( "PerceptionOn" )
		end
		
		glowS:RegisterAnimationSequence( "PerceptionOff", {
			{
				function ()
					return self.glowS:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.glowS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9.96, _1080p * 9.96, _1080p * -9.96, _1080p * 9.96, 100 )
				end
			}
		} )
		glow:RegisterAnimationSequence( "PerceptionOff", {
			{
				function ()
					return self.glow:SetAlpha( 0, 100 )
				end
			},
			{
				function ()
					return self.glow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9, 100 )
				end
			}
		} )
		self._sequences.PerceptionOff = function ()
			glowS:AnimateSequence( "PerceptionOff" )
			glow:AnimateSequence( "PerceptionOff" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "PerceptionOff" )
		end
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "PerceptionOn" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleHybridZoomed", ReticleHybridZoomed )
LockTable( _M )
