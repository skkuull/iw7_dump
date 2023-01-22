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

function Reticle37( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle37"
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
	ImageS:setImage( RegisterMaterial( "hud_reticle_37" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48 )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.6, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_37" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -48, _1080p * 48, _1080p * -48, _1080p * 48 )
	self:addElement( Image )
	self.Image = Image
	
	local Star = nil
	
	Star = LUI.UIImage.new()
	Star.id = "Star"
	Star:SetAlpha( 0.4, 0 )
	Star:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	Star:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -6, _1080p * 6, _1080p * -6, _1080p * 6 )
	self:addElement( Star )
	self.Star = Star
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ImageS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ImageS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ImageS:SetScale( 0, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Image:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0, 60 )
				end
			}
		} )
		Star:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Star:SetAlpha( 0.4, 60 )
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
			ImageS:AnimateSequence( "ADSIN" )
			Image:AnimateSequence( "ADSIN" )
			Star:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
		end
		
		ImageS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ImageS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ImageS:SetScale( -0.5, 60 )
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
					return self.Image:SetScale( -0.5, 60 )
				end
			}
		} )
		Star:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Star:SetAlpha( 0.2, 60 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ImageS:AnimateLoop( "ADSOUT" )
			Image:AnimateLoop( "ADSOUT" )
			Star:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
		end
		
		ImageS:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.ImageS:SetZRotation( 0, 0 )
				end,
				function ()
					return self.ImageS:SetZRotation( 360, 1000 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "Rotate", {
			{
				function ()
					return self.Image:SetZRotation( 10, 0 )
				end,
				function ()
					return self.Image:SetZRotation( 370, 1000 )
				end
			}
		} )
		self._sequences.Rotate = function ()
			ImageS:AnimateLoop( "Rotate" )
			Image:AnimateLoop( "Rotate" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Rotate" )
	return self
end

MenuBuilder.registerType( "Reticle37", Reticle37 )
LockTable( _M )
