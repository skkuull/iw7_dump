local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1 )
	f1_arg0.FrameL:SetParallaxMotionAmount( ReticleParallaxAmount.vrFrame )
	f1_arg0.FrameR:SetParallaxMotionAmount( ReticleParallaxAmount.vrFrame )
	local f1_local0 = 0.75
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

function ReticleVRBase( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 85 * _1080p, 0, 105 * _1080p )
	self.id = "ReticleVRBase"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local FrameR = nil
	
	FrameR = LUI.UIImage.new()
	FrameR.id = "FrameR"
	FrameR:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	FrameR:SetAlpha( 0.8, 0 )
	FrameR:setImage( RegisterMaterial( "hud_reticle_vr_frame" ), 0 )
	FrameR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -4, _1080p * 36, _1080p * -93, _1080p * 51 )
	self:addElement( FrameR )
	self.FrameR = FrameR
	
	local FrameL = nil
	
	FrameL = LUI.UIImage.new()
	FrameL.id = "FrameL"
	FrameL:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	FrameL:SetAlpha( 0.8, 0 )
	FrameL:SetYRotation( -180, 0 )
	FrameL:setImage( RegisterMaterial( "hud_reticle_vr_frame" ), 0 )
	FrameL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -36, _1080p * 4, _1080p * -93, _1080p * 51 )
	self:addElement( FrameL )
	self.FrameL = FrameL
	
	local AccR = nil
	
	AccR = LUI.UIImage.new()
	AccR.id = "AccR"
	AccR:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	AccR:SetAlpha( 0.6, 0 )
	AccR:SetYRotation( 180, 0 )
	AccR:setImage( RegisterMaterial( "hud_reticle_vr_accent" ), 0 )
	AccR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, 0, _1080p * 32, _1080p * -1, _1080p * 13 )
	self:addElement( AccR )
	self.AccR = AccR
	
	local AccL = nil
	
	AccL = LUI.UIImage.new()
	AccL.id = "AccL"
	AccL:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	AccL:SetAlpha( 0.6, 0 )
	AccL:setImage( RegisterMaterial( "hud_reticle_vr_accent" ), 0 )
	AccL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, 0, _1080p * -1, _1080p * 13 )
	self:addElement( AccL )
	self.AccL = AccL
	
	local RetiS = nil
	
	RetiS = LUI.UIImage.new()
	RetiS.id = "RetiS"
	RetiS:SetRGBFromInt( 2712657, 0 )
	RetiS:SetAlpha( 0.8, 0 )
	RetiS:SetZRotation( 45, 0 )
	RetiS:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	RetiS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -9, _1080p * 9, _1080p * -9, _1080p * 9 )
	self:addElement( RetiS )
	self.RetiS = RetiS
	
	local Reti = nil
	
	Reti = LUI.UIImage.new()
	Reti.id = "Reti"
	Reti:SetRGBFromTable( SWATCHES.Reticles.BrightGreen, 0 )
	Reti:SetZRotation( 45, 0 )
	Reti:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	Reti:SetBlendMode( BLEND_MODE.addWithAlpha )
	Reti:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( Reti )
	self.Reti = Reti
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FrameR:SetAlpha( 0.8, 60 )
				end
			}
		} )
		FrameL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FrameL:SetAlpha( 0.8, 60 )
				end
			}
		} )
		AccR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.AccR:SetAlpha( 0.6, 60 )
				end
			}
		} )
		AccL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.AccL:SetAlpha( 0.6, 60 )
				end
			}
		} )
		RetiS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RetiS:SetAlpha( 0.8, 60 )
				end
			}
		} )
		Reti:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reti:SetAlpha( 1, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			FrameR:AnimateSequence( "ADSIN" )
			FrameL:AnimateSequence( "ADSIN" )
			AccR:AnimateSequence( "ADSIN" )
			AccL:AnimateSequence( "ADSIN" )
			RetiS:AnimateSequence( "ADSIN" )
			Reti:AnimateSequence( "ADSIN" )
		end
		
		FrameR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.FrameR:SetAlpha( 0, 60 )
				end
			}
		} )
		FrameL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.FrameL:SetAlpha( 0, 60 )
				end
			}
		} )
		AccR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.AccR:SetAlpha( 0, 60 )
				end
			}
		} )
		AccL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.AccL:SetAlpha( 0, 60 )
				end
			}
		} )
		RetiS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RetiS:SetAlpha( 0, 60 )
				end
			}
		} )
		Reti:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reti:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			FrameR:AnimateSequence( "ADSOUT" )
			FrameL:AnimateSequence( "ADSOUT" )
			AccR:AnimateSequence( "ADSOUT" )
			AccL:AnimateSequence( "ADSOUT" )
			RetiS:AnimateSequence( "ADSOUT" )
			Reti:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleVRBase", ReticleVRBase )
LockTable( _M )
