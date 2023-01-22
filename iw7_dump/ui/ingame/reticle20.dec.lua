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

function Reticle20( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle20"
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
	ImageS:SetAlpha( 0.4, 0 )
	ImageS:setImage( RegisterMaterial( "hud_reticle_20" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -65, _1080p * 63 )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.6, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_20" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -65, _1080p * 63 )
	self:addElement( Image )
	self.Image = Image
	
	local Hilt = nil
	
	Hilt = LUI.UIImage.new()
	Hilt.id = "Hilt"
	Hilt:SetRGBFromInt( 6185847, 0 )
	Hilt:setImage( RegisterMaterial( "hud_reticle_20b" ), 0 )
	Hilt:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -67, _1080p * 67, _1080p * -68, _1080p * 66 )
	self:addElement( Hilt )
	self.Hilt = Hilt
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ImageS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ImageS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Image:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Hilt:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Hilt:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ImageS:AnimateSequence( "ADSIN" )
			Image:AnimateSequence( "ADSIN" )
			Hilt:AnimateSequence( "ADSIN" )
		end
		
		ImageS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ImageS:SetAlpha( 0, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Image:SetAlpha( 0, 60 )
				end
			}
		} )
		Hilt:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Hilt:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ImageS:AnimateSequence( "ADSOUT" )
			Image:AnimateSequence( "ADSOUT" )
			Hilt:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle20", Reticle20 )
LockTable( _M )
