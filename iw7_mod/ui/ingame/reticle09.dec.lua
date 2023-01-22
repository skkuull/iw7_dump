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

function Reticle09( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 128 * _1080p, 0, 128 * _1080p )
	self.id = "Reticle09"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local ImageS = nil
	
	ImageS = LUI.UIImage.new()
	ImageS.id = "ImageS"
	ImageS:SetAlpha( 0.2, 0 )
	ImageS:setImage( RegisterMaterial( "hud_reticle_9" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -52, _1080p * 58 )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.4, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_9" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -52, _1080p * 58 )
	self:addElement( Image )
	self.Image = Image
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ImageS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -67, _1080p * 67, _1080p * -64, _1080p * 70, 0 )
				end,
				function ()
					return self.ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -52, _1080p * 58, 200, LUI.EASING.outQuadratic )
				end
			}
		} )
		Image:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -55, _1080p * 55, _1080p * -52, _1080p * 58, 200 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			ImageS:AnimateSequence( "OnFire" )
			Image:AnimateSequence( "OnFire" )
		end
		
		ImageS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ImageS:SetScale( 0.02, 60 )
				end
			},
			{
				function ()
					return self.ImageS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Image:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.Image:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ImageS:AnimateSequence( "ADSIN" )
			Image:AnimateSequence( "ADSIN" )
		end
		
		ImageS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ImageS:SetScale( -0.3, 60 )
				end
			},
			{
				function ()
					return self.ImageS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Image:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.Image:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Image:SetScale( -0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ImageS:AnimateLoop( "ADSOUT" )
			Image:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle09", Reticle09 )
LockTable( _M )
