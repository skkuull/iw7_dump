local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr08( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleSnpr08"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:setImage( RegisterMaterial( "hud_reticle_sniper16" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -150.5, _1080p * 151, _1080p * -150.5, _1080p * 151 )
	Image:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Image )
	self.Image = Image
	
	local Box = nil
	
	Box = LUI.UIImage.new()
	Box.id = "Box"
	Box:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	Box:SetZRotation( 45, 0 )
	Box:setImage( RegisterMaterial( "hud_reticle_sniper16b" ), 0 )
	Box:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	Box:SubscribeToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.adsPercent:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			Box:SetAlpha( Lerp( f2_local0, 0, 0.6 ), 0 )
		end
	end )
	self:addElement( Box )
	self.Box = Box
	
	local TopDot = nil
	
	TopDot = LUI.UIImage.new()
	TopDot.id = "TopDot"
	TopDot:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	TopDot:setImage( RegisterMaterial( "hud_outlined_dot_reticle" ), 0 )
	TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -5, _1080p * -1 )
	TopDot:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TopDot )
	self.TopDot = TopDot
	
	local TopDotCopy0 = nil
	
	TopDotCopy0 = LUI.UIImage.new()
	TopDotCopy0.id = "TopDotCopy0"
	TopDotCopy0:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	TopDotCopy0:setImage( RegisterMaterial( "hud_outlined_dot_reticle" ), 0 )
	TopDotCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 1, _1080p * 5 )
	TopDotCopy0:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TopDotCopy0 )
	self.TopDotCopy0 = TopDotCopy0
	
	local TopDotCopy1 = nil
	
	TopDotCopy1 = LUI.UIImage.new()
	TopDotCopy1.id = "TopDotCopy1"
	TopDotCopy1:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	TopDotCopy1:setImage( RegisterMaterial( "hud_outlined_dot_reticle" ), 0 )
	TopDotCopy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 5, _1080p * -2, _1080p * 2 )
	TopDotCopy1:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TopDotCopy1 )
	self.TopDotCopy1 = TopDotCopy1
	
	local TopDotCopy2 = nil
	
	TopDotCopy2 = LUI.UIImage.new()
	TopDotCopy2.id = "TopDotCopy2"
	TopDotCopy2:SetRGBFromTable( SWATCHES.Reticles.Red, 0 )
	TopDotCopy2:setImage( RegisterMaterial( "hud_outlined_dot_reticle" ), 0 )
	TopDotCopy2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * -1, _1080p * -2, _1080p * 2 )
	TopDotCopy2:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( TopDotCopy2 )
	self.TopDotCopy2 = TopDotCopy2
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Box:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Box:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -10, _1080p * 10, _1080p * -10, _1080p * 10, 0 )
				end,
				function ()
					return self.Box:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		TopDot:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -15, _1080p * -11, 0 )
				end,
				function ()
					return self.TopDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -5, _1080p * -1, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		TopDotCopy0:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TopDotCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 11, _1080p * 15, 0 )
				end,
				function ()
					return self.TopDotCopy0:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * 1, _1080p * 5, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		TopDotCopy1:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TopDotCopy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 11, _1080p * 15, _1080p * -1.75, _1080p * 2.25, 0 )
				end,
				function ()
					return self.TopDotCopy1:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 1, _1080p * 5, _1080p * -2, _1080p * 2, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		TopDotCopy2:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TopDotCopy2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * -11, _1080p * -1.75, _1080p * 2.25, 0 )
				end,
				function ()
					return self.TopDotCopy2:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -5, _1080p * -1, _1080p * -2, _1080p * 2, 300, LUI.EASING.inQuadratic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Box:AnimateSequence( "OnFire" )
			TopDot:AnimateSequence( "OnFire" )
			TopDotCopy0:AnimateSequence( "OnFire" )
			TopDotCopy1:AnimateSequence( "OnFire" )
			TopDotCopy2:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleSnpr08", ReticleSnpr08 )
LockTable( _M )
