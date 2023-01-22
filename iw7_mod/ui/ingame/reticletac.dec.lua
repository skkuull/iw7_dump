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

function ReticleTac( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 2 * _1080p, 0, 2 * _1080p )
	self.id = "ReticleTac"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Flow = nil
	
	Flow = LUI.UIImage.new()
	Flow.id = "Flow"
	Flow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	Flow:SetAlpha( 0.2, 0 )
	Flow:setImage( RegisterMaterial( "hud_reticle_radial_glow" ), 0 )
	Flow:SetBlendMode( BLEND_MODE.addWithAlpha )
	Flow:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * -11, _1080p * 13, _1080p * -11, _1080p * 13 )
	self:addElement( Flow )
	self.Flow = Flow
	
	local RetOS = nil
	
	RetOS = LUI.UIImage.new()
	RetOS.id = "RetOS"
	RetOS:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	RetOS:SetAlpha( 0.2, 0 )
	RetOS:SetZRotation( 135, 0 )
	RetOS:SetScale( -0.1, 0 )
	RetOS:setImage( RegisterMaterial( "hud_reticle_ring_mini" ), 0 )
	RetOS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( RetOS )
	self.RetOS = RetOS
	
	local RetO = nil
	
	RetO = LUI.UIImage.new()
	RetO.id = "RetO"
	RetO:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	RetO:SetAlpha( 0.1, 0 )
	RetO:SetZRotation( 135, 0 )
	RetO:SetScale( -0.1, 0 )
	RetO:setImage( RegisterMaterial( "hud_reticle_ring_mini" ), 0 )
	RetO:SetBlendMode( BLEND_MODE.addWithAlpha )
	RetO:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( RetO )
	self.RetO = RetO
	
	local RetS = nil
	
	RetS = LUI.UIImage.new()
	RetS.id = "RetS"
	RetS:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	RetS:SetAlpha( 0.2, 0 )
	RetS:SetZRotation( 90, 0 )
	RetS:SetScale( -0.1, 0 )
	RetS:setImage( RegisterMaterial( "hud_reticle_circle_quadtick" ), 0 )
	RetS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( RetS )
	self.RetS = RetS
	
	local Ret = nil
	
	Ret = LUI.UIImage.new()
	Ret.id = "Ret"
	Ret:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Ret:SetAlpha( 0.2, 0 )
	Ret:SetZRotation( 90, 0 )
	Ret:SetScale( -0.1, 0 )
	Ret:setImage( RegisterMaterial( "hud_reticle_circle_quadtick" ), 0 )
	Ret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Ret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * 7 )
	self:addElement( Ret )
	self.Ret = Ret
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Flow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Flow:SetScale( 0, 60 )
				end
			}
		} )
		RetOS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RetOS:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.RetOS:SetScale( 0, 60 )
				end
			}
		} )
		RetO:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RetO:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.RetO:SetScale( 0, 60 )
				end
			}
		} )
		RetS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.RetS:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.RetS:SetScale( 0, 60 )
				end
			}
		} )
		Ret:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Ret:SetAlpha( 0.8, 60 )
				end
			},
			{
				function ()
					return self.Ret:SetScale( 0, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Flow:AnimateSequence( "ADSIN" )
			RetOS:AnimateSequence( "ADSIN" )
			RetO:AnimateSequence( "ADSIN" )
			RetS:AnimateSequence( "ADSIN" )
			Ret:AnimateSequence( "ADSIN" )
		end
		
		Flow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Flow:SetScale( -0.3, 60 )
				end
			}
		} )
		RetOS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RetOS:SetScale( -0.1, 60 )
				end
			},
			{
				function ()
					return self.RetOS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		RetO:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RetO:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.RetO:SetAlpha( 0.1, 60 )
				end
			},
			{
				function ()
					return self.RetO:SetScale( -0.1, 60 )
				end
			}
		} )
		RetS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.RetS:SetScale( -0.1, 60 )
				end
			},
			{
				function ()
					return self.RetS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Ret:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Ret:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Ret:SetAlpha( 0.2, 60 )
				end
			},
			{
				function ()
					return self.Ret:SetScale( -0.1, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Flow:AnimateLoop( "ADSOUT" )
			RetOS:AnimateLoop( "ADSOUT" )
			RetO:AnimateLoop( "ADSOUT" )
			RetS:AnimateLoop( "ADSOUT" )
			Ret:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleTac", ReticleTac )
LockTable( _M )
