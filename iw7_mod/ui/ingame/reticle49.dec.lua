local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
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

function Reticle49( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 55 * _1080p, 0, 55 * _1080p )
	self.id = "Reticle49"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local LongLineShadowR = nil
	
	LongLineShadowR = LUI.UIImage.new()
	LongLineShadowR.id = "LongLineShadowR"
	LongLineShadowR:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LongLineShadowR:SetAlpha( 0.2, 0 )
	LongLineShadowR:SetZRotation( 45, 0 )
	LongLineShadowR:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LongLineShadowR:SetUseAA( true )
	LongLineShadowR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -18, _1080p * -4, _1080p * -12, _1080p * -8 )
	self:addElement( LongLineShadowR )
	self.LongLineShadowR = LongLineShadowR
	
	local LongLineR = nil
	
	LongLineR = LUI.UIImage.new()
	LongLineR.id = "LongLineR"
	LongLineR:SetAlpha( 0.4, 0 )
	LongLineR:SetZRotation( 45, 0 )
	LongLineR:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LongLineR:SetUseAA( true )
	LongLineR:SetBlendMode( BLEND_MODE.addWithAlpha )
	LongLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -18, _1080p * -4, _1080p * -12, _1080p * -8 )
	self:addElement( LongLineR )
	self.LongLineR = LongLineR
	
	local LongLineShadowL = nil
	
	LongLineShadowL = LUI.UIImage.new()
	LongLineShadowL.id = "LongLineShadowL"
	LongLineShadowL:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LongLineShadowL:SetAlpha( 0.2, 0 )
	LongLineShadowL:SetZRotation( -45, 0 )
	LongLineShadowL:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LongLineShadowL:SetUseAA( true )
	LongLineShadowL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 4, _1080p * 18, _1080p * -12, _1080p * -8 )
	self:addElement( LongLineShadowL )
	self.LongLineShadowL = LongLineShadowL
	
	local LongLineL = nil
	
	LongLineL = LUI.UIImage.new()
	LongLineL.id = "LongLineL"
	LongLineL:SetAlpha( 0.4, 0 )
	LongLineL:SetZRotation( -45, 0 )
	LongLineL:setImage( RegisterMaterial( "hud_reticle_notch" ), 0 )
	LongLineL:SetUseAA( true )
	LongLineL:SetBlendMode( BLEND_MODE.addWithAlpha )
	LongLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 4, _1080p * 18, _1080p * -12, _1080p * -8 )
	self:addElement( LongLineL )
	self.LongLineL = LongLineL
	
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0.5, 0 )
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	DotBase.DotShadow:SetAlpha( 0.6, 0 )
	DotBase.Dot:SetScale( 0.2, 0 )
	DotBase.DotHighlight:SetAlpha( 0.4, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	local UpRS = nil
	
	UpRS = LUI.UIImage.new()
	UpRS.id = "UpRS"
	UpRS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	UpRS:SetAlpha( 0.2, 0 )
	UpRS:SetZRotation( 180, 0 )
	UpRS:setImage( RegisterMaterial( "hud_reticle_49" ), 0 )
	UpRS:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * -6, _1080p * 5, _1080p * 17 )
	self:addElement( UpRS )
	self.UpRS = UpRS
	
	local UpLS = nil
	
	UpLS = LUI.UIImage.new()
	UpLS.id = "UpLS"
	UpLS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	UpLS:SetAlpha( 0.2, 0 )
	UpLS:SetZRotation( -90, 0 )
	UpLS:setImage( RegisterMaterial( "hud_reticle_49" ), 0 )
	UpLS:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 18, _1080p * 5, _1080p * 17 )
	self:addElement( UpLS )
	self.UpLS = UpLS
	
	local UpR = nil
	
	UpR = LUI.UIImage.new()
	UpR.id = "UpR"
	UpR:SetAlpha( 0.4, 0 )
	UpR:SetZRotation( 180, 0 )
	UpR:setImage( RegisterMaterial( "hud_reticle_49" ), 0 )
	UpR:SetBlendMode( BLEND_MODE.addWithAlpha )
	UpR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * -6, _1080p * 5, _1080p * 17 )
	self:addElement( UpR )
	self.UpR = UpR
	
	local UpL = nil
	
	UpL = LUI.UIImage.new()
	UpL.id = "UpL"
	UpL:SetAlpha( 0.4, 0 )
	UpL:SetZRotation( -90, 0 )
	UpL:setImage( RegisterMaterial( "hud_reticle_49" ), 0 )
	UpL:SetBlendMode( BLEND_MODE.addWithAlpha )
	UpL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 18, _1080p * 5, _1080p * 17 )
	self:addElement( UpL )
	self.UpL = UpL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		LongLineShadowR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLineShadowR:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -26.5, _1080p * -16.5, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		LongLineR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLineR:SetRGBFromTable( SWATCHES.Reticles.Red, 60 )
				end
			},
			{
				function ()
					return self.LongLineR:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.LongLineR:SetZRotation( -45, 100 )
				end
			},
			{
				function ()
					return self.LongLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -26.5, _1080p * -16.5, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		LongLineShadowL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLineShadowL:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetZRotation( 45, 100 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 16.5, _1080p * 26.5, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		LongLineL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.LongLineL:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.LongLineL:SetRGBFromTable( SWATCHES.Reticles.Red, 60 )
				end
			},
			{
				function ()
					return self.LongLineL:SetZRotation( 45, 100 )
				end
			},
			{
				function ()
					return self.LongLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 16.5, _1080p * 26.5, _1080p * -23, _1080p * -19, 100 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Highlight, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Red, 100 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3, _1080p * 3, _1080p * -3, _1080p * 3, 100 )
				end
			}
		} )
		UpRS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.UpRS:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 60 )
				end
			},
			{
				function ()
					return self.UpRS:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.UpRS:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -27.5, _1080p * -16.5, _1080p * 15, _1080p * 26, 100 )
				end
			}
		} )
		UpLS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.UpLS:SetRGBFromTable( SWATCHES.Reticles.DarkRed, 60 )
				end
			},
			{
				function ()
					return self.UpLS:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.UpLS:SetZRotation( -90, 100 )
				end
			},
			{
				function ()
					return self.UpLS:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 27.5, _1080p * 15, _1080p * 26, 100 )
				end
			}
		} )
		UpR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.UpR:SetRGBFromTable( SWATCHES.Reticles.Red, 60 )
				end
			},
			{
				function ()
					return self.UpR:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.UpR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -27.5, _1080p * -16.5, _1080p * 15, _1080p * 26, 100 )
				end
			}
		} )
		UpL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.UpL:SetRGBFromTable( SWATCHES.Reticles.Red, 60 )
				end
			},
			{
				function ()
					return self.UpL:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.UpL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 16.5, _1080p * 27.5, _1080p * 15, _1080p * 26, 100 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			LongLineShadowR:AnimateSequence( "ADSIN" )
			LongLineR:AnimateSequence( "ADSIN" )
			LongLineShadowL:AnimateSequence( "ADSIN" )
			LongLineL:AnimateSequence( "ADSIN" )
			DotBase:AnimateSequence( "ADSIN" )
			UpRS:AnimateSequence( "ADSIN" )
			UpLS:AnimateSequence( "ADSIN" )
			UpR:AnimateSequence( "ADSIN" )
			UpL:AnimateSequence( "ADSIN" )
		end
		
		LongLineShadowR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLineShadowR:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetZRotation( 45, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -18, _1080p * -4, _1080p * -12, _1080p * -8, 59 )
				end
			}
		} )
		LongLineR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLineR:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LongLineR:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.LongLineR:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.LongLineR:SetZRotation( 45, 60 )
				end
			},
			{
				function ()
					return self.LongLineR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -18, _1080p * -4, _1080p * -12, _1080p * -8, 59 )
				end
			}
		} )
		LongLineShadowL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLineShadowL:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetZRotation( -45, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.LongLineShadowL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 4, _1080p * 18, _1080p * -12, _1080p * -8, 59 )
				end
			}
		} )
		LongLineL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.LongLineL:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.LongLineL:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.LongLineL:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.LongLineL:SetZRotation( -45, 60 )
				end
			},
			{
				function ()
					return self.LongLineL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * 4, _1080p * 18, _1080p * -12, _1080p * -8, 59 )
				end
			}
		} )
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.DotBase:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.DotBase:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -2, _1080p * 2, _1080p * -2, _1080p * 2, 59 )
				end
			}
		} )
		UpRS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.UpRS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.UpRS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.UpRS:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * -6, _1080p * 5, _1080p * 17, 59 )
				end
			}
		} )
		UpLS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.UpLS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 60 )
				end
			},
			{
				function ()
					return self.UpLS:SetZRotation( -90, 60 )
				end
			},
			{
				function ()
					return self.UpLS:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.UpLS:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 18, _1080p * 5, _1080p * 17, 59 )
				end
			}
		} )
		UpR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.UpR:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.UpR:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.UpR:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.UpR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -18, _1080p * -6, _1080p * 5, _1080p * 17, 59 )
				end
			}
		} )
		UpL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.UpL:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.UpL:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.UpL:SetRGBFromInt( 16777215, 60 )
				end
			},
			{
				function ()
					return self.UpL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 6, _1080p * 18, _1080p * 5, _1080p * 17, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			LongLineShadowR:AnimateLoop( "ADSOUT" )
			LongLineR:AnimateLoop( "ADSOUT" )
			LongLineShadowL:AnimateLoop( "ADSOUT" )
			LongLineL:AnimateLoop( "ADSOUT" )
			DotBase:AnimateLoop( "ADSOUT" )
			UpRS:AnimateLoop( "ADSOUT" )
			UpLS:AnimateLoop( "ADSOUT" )
			UpR:AnimateLoop( "ADSOUT" )
			UpL:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle49", Reticle49 )
LockTable( _M )
