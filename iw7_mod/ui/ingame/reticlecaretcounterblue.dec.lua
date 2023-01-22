local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = 0.5
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

function ReticleCaretCounterBlue( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 40 * _1080p, 0, 40 * _1080p )
	self.id = "ReticleCaretCounterBlue"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local CaretShadow = nil
	
	CaretShadow = LUI.UIImage.new()
	CaretShadow.id = "CaretShadow"
	CaretShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	CaretShadow:SetAlpha( 0.4, 0 )
	CaretShadow:SetScale( -0.5, 0 )
	CaretShadow:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	CaretShadow:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 15, _1080p * -7.5, _1080p * 15.5 )
	self:addElement( CaretShadow )
	self.CaretShadow = CaretShadow
	
	local Caret = nil
	
	Caret = LUI.UIImage.new()
	Caret.id = "Caret"
	Caret:SetRGBFromTable( SWATCHES.Reticles.AzureBlue, 0 )
	Caret:SetAlpha( 0.4, 0 )
	Caret:SetScale( -0.5, 0 )
	Caret:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	Caret:SetBlendMode( BLEND_MODE.addWithAlpha )
	Caret:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -15, _1080p * 15, _1080p * -7.5, _1080p * 15.5 )
	self:addElement( Caret )
	self.Caret = Caret
	
	local Highlight = nil
	
	Highlight = LUI.UIImage.new()
	Highlight.id = "Highlight"
	Highlight:SetRGBFromTable( SWATCHES.Reticles.LightCyan, 0 )
	Highlight:SetAlpha( 0, 0 )
	Highlight:SetScale( -0.5, 0 )
	Highlight:setImage( RegisterMaterial( "hud_reticle_caret" ), 0 )
	Highlight:SetBlendMode( BLEND_MODE.addWithAlpha )
	Highlight:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -13, _1080p * 13, _1080p * -6, _1080p * 14.5 )
	self:addElement( Highlight )
	self.Highlight = Highlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CaretShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.CaretShadow:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.CaretShadow:SetAlpha( 0.5, 80 )
				end
			}
		} )
		Caret:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Caret:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.Caret:SetAlpha( 0.8, 80 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Highlight:SetScale( 0, 80 )
				end
			},
			{
				function ()
					return self.Highlight:SetAlpha( 0.2, 80 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			CaretShadow:AnimateSequence( "ADSIN" )
			Caret:AnimateSequence( "ADSIN" )
			Highlight:AnimateSequence( "ADSIN" )
		end
		
		CaretShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.CaretShadow:SetScale( -0.5, 0 )
				end
			},
			{
				function ()
					return self.CaretShadow:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.CaretShadow:SetAlpha( 0.3, 80 )
				end
			}
		} )
		Caret:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Caret:SetScale( -0.5, 0 )
				end
			},
			{
				function ()
					return self.Caret:SetAlpha( 0.4, 0 )
				end,
				function ()
					return self.Caret:SetAlpha( 0.3, 80 )
				end
			}
		} )
		Highlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Highlight:SetScale( -0.5, 80 )
				end
			},
			{
				function ()
					return self.Highlight:SetAlpha( 0, 80 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			CaretShadow:AnimateLoop( "ADSOUT" )
			Caret:AnimateLoop( "ADSOUT" )
			Highlight:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "ReticleCaretCounterBlue", ReticleCaretCounterBlue )
LockTable( _M )
