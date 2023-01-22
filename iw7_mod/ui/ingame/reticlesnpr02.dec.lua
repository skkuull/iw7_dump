local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleSnpr02( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleSnpr02"
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
	Image:setImage( RegisterMaterial( "hud_reticle_sniper10" ), 0 )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -128, _1080p * 128, _1080p * -64, _1080p * 64 )
	Image:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( Image )
	self.Image = Image
	
	local CrossR = nil
	
	CrossR = LUI.UIImage.new()
	CrossR.id = "CrossR"
	CrossR:SetZRotation( 180, 0 )
	CrossR:setImage( RegisterMaterial( "hud_reticle_sniper10b" ), 0 )
	CrossR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 71, _1080p * -26, _1080p * 26 )
	CrossR:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( CrossR )
	self.CrossR = CrossR
	
	local CrossL = nil
	
	CrossL = LUI.UIImage.new()
	CrossL.id = "CrossL"
	CrossL:setImage( RegisterMaterial( "hud_reticle_sniper10b" ), 0 )
	CrossL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -71, _1080p * -19, _1080p * -26, _1080p * 26 )
	CrossL:BindAlphaToModel( DataSources.inGame.player.currentWeapon.adsPercent:GetModel( f1_local1 ) )
	self:addElement( CrossL )
	self.CrossL = CrossL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrossR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.CrossR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 69, _1080p * 121, _1080p * -26, _1080p * 26, 0 )
				end,
				function ()
					return self.CrossR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 19, _1080p * 71, _1080p * -26, _1080p * 26, 389, LUI.EASING.outCubic )
				end
			}
		} )
		CrossL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.CrossL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -121, _1080p * -69, _1080p * -26, _1080p * 26, 0 )
				end,
				function ()
					return self.CrossL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -71, _1080p * -19, _1080p * -26, _1080p * 26, 389, LUI.EASING.outCubic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			CrossR:AnimateSequence( "OnFire" )
			CrossL:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	Image:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleSnpr02", ReticleSnpr02 )
LockTable( _M )
