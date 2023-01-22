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

function ReticleVREpic( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 303 * _1080p, 0, 156 * _1080p )
	self.id = "ReticleVREpic"
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
	FrameR:SetRGBFromInt( 4768255, 0 )
	FrameR:setImage( RegisterMaterial( "hud_reticle_vr_frame" ), 0 )
	FrameR:SetAnchorsAndPosition( 1, 0, 1, 0, 0, _1080p * 36, _1080p * -140, _1080p * 12 )
	self:addElement( FrameR )
	self.FrameR = FrameR
	
	local FrameL = nil
	
	FrameL = LUI.UIImage.new()
	FrameL.id = "FrameL"
	FrameL:SetRGBFromInt( 4768255, 0 )
	FrameL:SetYRotation( -180, 0 )
	FrameL:setImage( RegisterMaterial( "hud_reticle_vr_frame" ), 0 )
	FrameL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -36, 0, _1080p * -140, _1080p * 12 )
	self:addElement( FrameL )
	self.FrameL = FrameL
	
	local CrossR = nil
	
	CrossR = LUI.UIImage.new()
	CrossR.id = "CrossR"
	CrossR:SetRGBFromInt( 4768255, 0 )
	CrossR:SetAlpha( 0.8, 0 )
	CrossR:SetYRotation( 180, 0 )
	CrossR:setImage( RegisterMaterial( "hud_reticle_vr_crosshair" ), 0 )
	CrossR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 12, _1080p * 69, _1080p * -8, _1080p * 8 )
	self:addElement( CrossR )
	self.CrossR = CrossR
	
	local CrossL = nil
	
	CrossL = LUI.UIImage.new()
	CrossL.id = "CrossL"
	CrossL:SetRGBFromInt( 4768255, 0 )
	CrossL:SetAlpha( 0.8, 0 )
	CrossL:setImage( RegisterMaterial( "hud_reticle_vr_crosshair" ), 0 )
	CrossL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -69, _1080p * -12, _1080p * -8, _1080p * 8 )
	self:addElement( CrossL )
	self.CrossL = CrossL
	
	local RetiS = nil
	
	RetiS = LUI.UIImage.new()
	RetiS.id = "RetiS"
	RetiS:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	RetiS:SetAlpha( 0.8, 0 )
	RetiS:SetZRotation( 45, 0 )
	RetiS:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	RetiS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10 )
	self:addElement( RetiS )
	self.RetiS = RetiS
	
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetRGBFromInt( 65529, 0 )
	Ret:SetAlpha( 0.8, 0 )
	Ret:SetZRotation( 45, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_roundedsquare" ), 0 )
	Ret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( Ret )
	self.Ret = Ret
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		FrameR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FrameR:SetAlpha( 1, 60 )
				end
			}
		} )
		FrameL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.FrameL:SetAlpha( 1, 60 )
				end
			}
		} )
		CrossR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CrossR:SetAlpha( 0.8, 60 )
				end
			}
		} )
		CrossL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CrossL:SetAlpha( 0.8, 60 )
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
		Ret:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Ret:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			FrameR:AnimateSequence( "ADSIN" )
			FrameL:AnimateSequence( "ADSIN" )
			CrossR:AnimateSequence( "ADSIN" )
			CrossL:AnimateSequence( "ADSIN" )
			RetiS:AnimateSequence( "ADSIN" )
			Ret:AnimateSequence( "ADSIN" )
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
		CrossR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CrossR:SetAlpha( 0, 60 )
				end
			}
		} )
		CrossL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CrossL:SetAlpha( 0, 60 )
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
		Ret:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Ret:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			FrameR:AnimateSequence( "ADSOUT" )
			FrameL:AnimateSequence( "ADSOUT" )
			CrossR:AnimateSequence( "ADSOUT" )
			CrossL:AnimateSequence( "ADSOUT" )
			RetiS:AnimateSequence( "ADSOUT" )
			Ret:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleVREpic", ReticleVREpic )
LockTable( _M )
