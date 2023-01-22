local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Reticle40b:SetBlendMode( BLEND_MODE.addWithAlpha )
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

function Reticle40( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle40"
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
	ImageS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	ImageS:SetAlpha( 0.4, 0 )
	ImageS:setImage( RegisterMaterial( "hud_reticle_40" ), 0 )
	ImageS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( ImageS )
	self.ImageS = ImageS
	
	local Image = nil
	
	Image = LUI.UIImage.new()
	Image.id = "Image"
	Image:SetAlpha( 0.6, 0 )
	Image:setImage( RegisterMaterial( "hud_reticle_40" ), 0 )
	Image:SetBlendMode( BLEND_MODE.addWithAlpha )
	Image:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -19, _1080p * 19, _1080p * -19, _1080p * 19 )
	self:addElement( Image )
	self.Image = Image
	
	local Reticle40bS = nil
	
	Reticle40bS = MenuBuilder.BuildRegisteredType( "Reticle40b", {
		controllerIndex = f3_local1
	} )
	Reticle40bS.id = "Reticle40bS"
	Reticle40bS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	Reticle40bS:SetAlpha( 0.4, 0 )
	Reticle40bS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * 31, _1080p * -9, _1080p * 9 )
	self:addElement( Reticle40bS )
	self.Reticle40bS = Reticle40bS
	
	local Reticle40b = nil
	
	Reticle40b = MenuBuilder.BuildRegisteredType( "Reticle40b", {
		controllerIndex = f3_local1
	} )
	Reticle40b.id = "Reticle40b"
	Reticle40b:SetAlpha( 0.6, 0 )
	Reticle40b:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * 31, _1080p * -9, _1080p * 9 )
	self:addElement( Reticle40b )
	self.Reticle40b = Reticle40b
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		ImageS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.ImageS:SetAlpha( 0.4, 60 )
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
					return self.Image:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.Image:SetScale( 0, 60 )
				end
			}
		} )
		Reticle40bS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle40bS:SetScale( 0.03, 60 )
				end
			},
			{
				function ()
					return self.Reticle40bS:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Reticle40bS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * 31, _1080p * -9, _1080p * 9, 59 )
				end
			}
		} )
		Reticle40b:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Reticle40b:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.Reticle40b:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			ImageS:AnimateSequence( "ADSIN" )
			Image:AnimateSequence( "ADSIN" )
			Reticle40bS:AnimateSequence( "ADSIN" )
			Reticle40b:AnimateSequence( "ADSIN" )
		end
		
		ImageS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.ImageS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.ImageS:SetScale( -0.3, 60 )
				end
			}
		} )
		Image:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Image:SetAlpha( 0.2, 0 )
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
		Reticle40bS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle40bS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.Reticle40bS:SetScale( -0.28, 60 )
				end
			}
		} )
		Reticle40b:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Reticle40b:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Reticle40b:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.Reticle40b:SetScale( -0.3, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			ImageS:AnimateLoop( "ADSOUT" )
			Image:AnimateLoop( "ADSOUT" )
			Reticle40bS:AnimateLoop( "ADSOUT" )
			Reticle40b:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle40", Reticle40 )
LockTable( _M )
