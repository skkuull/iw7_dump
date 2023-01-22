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

function ReticleGaussCFrame( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 105 * _1080p, 0, 54 * _1080p )
	self.id = "ReticleGaussCFrame"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local BarL = nil
	
	BarL = LUI.UIImage.new()
	BarL.id = "BarL"
	BarL:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	BarL:SetAlpha( 0.4, 0 )
	BarL:SetXRotation( -25, 0 )
	BarL:SetYRotation( 33, 0 )
	BarL:setImage( RegisterMaterial( "hud_reticle_gauss_frame" ), 0 )
	BarL:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 19, _1080p * 26, _1080p * -5, _1080p * -15 )
	self:addElement( BarL )
	self.BarL = BarL
	
	local BarR = nil
	
	BarR = LUI.UIImage.new()
	BarR.id = "BarR"
	BarR:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	BarR:SetAlpha( 0.4, 0 )
	BarR:SetXRotation( -25, 0 )
	BarR:SetYRotation( 122, 0 )
	BarR:setImage( RegisterMaterial( "hud_reticle_gauss_frame" ), 0 )
	BarR:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -38, _1080p * -31, _1080p * -5, _1080p * -15 )
	self:addElement( BarR )
	self.BarR = BarR
	
	local CenterFluff = nil
	
	CenterFluff = LUI.UIImage.new()
	CenterFluff.id = "CenterFluff"
	CenterFluff:SetRGBFromTable( SWATCHES.Reticles.VibrantTeal, 0 )
	CenterFluff:SetAlpha( 0.4, 0 )
	CenterFluff:setImage( RegisterMaterial( "hud_reticle_ripper" ), 0 )
	CenterFluff:SetUMin( 0.21, 0 )
	CenterFluff:SetUMax( 0.51, 0 )
	CenterFluff:SetVMin( 0.6, 0 )
	CenterFluff:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -10.04, _1080p * 10.04, _1080p * -20, _1080p * 1 )
	self:addElement( CenterFluff )
	self.CenterFluff = CenterFluff
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BarL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BarL:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetXRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetYRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 4, _1080p * 12, 0, 0, 0 )
				end
			}
		} )
		BarR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.BarR:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetXRotation( 0, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetYRotation( 180, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -12, _1080p * -4, 0, 0, 0 )
				end
			}
		} )
		CenterFluff:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CenterFluff:SetAlpha( 0.6, 0 )
				end
			},
			{
				function ()
					return self.CenterFluff:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -14, _1080p * 14, _1080p * -4, _1080p * 17, 0 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			BarL:AnimateSequence( "ADSIN" )
			BarR:AnimateSequence( "ADSIN" )
			CenterFluff:AnimateSequence( "ADSIN" )
		end
		
		BarL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BarL:SetXRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetYRotation( 33, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.BarL:SetAnchorsAndPosition( 0, 1, 0, 0, _1080p * 19, _1080p * 26, _1080p * -5, _1080p * -15, 0 )
				end
			}
		} )
		BarR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.BarR:SetXRotation( -25, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetYRotation( 122, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.BarR:SetAnchorsAndPosition( 1, 0, 0, 0, _1080p * -38, _1080p * -31, _1080p * -5, _1080p * -15, 0 )
				end
			}
		} )
		CenterFluff:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CenterFluff:SetAlpha( 0.4, 0 )
				end
			},
			{
				function ()
					return self.CenterFluff:SetAnchorsAndPosition( 0.5, 0.5, 1, 0, _1080p * -10.04, _1080p * 10.04, _1080p * -20, _1080p * 1, 0 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			BarL:AnimateSequence( "ADSOUT" )
			BarR:AnimateSequence( "ADSOUT" )
			CenterFluff:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleGaussCFrame", ReticleGaussCFrame )
LockTable( _M )
