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

function Reticle02( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 55 * _1080p, 0, 20 * _1080p )
	self.id = "Reticle02"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DotBase = nil
	
	DotBase = MenuBuilder.BuildRegisteredType( "DotBase", {
		controllerIndex = f3_local1
	} )
	DotBase.id = "DotBase"
	DotBase:SetAlpha( 0.6, 0 )
	DotBase.DotShadow:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	DotBase.Dot:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	DotBase.DotHighlight:SetRGBFromTable( SWATCHES.Reticles.Periwinkle, 0 )
	DotBase.DotHighlight:SetAlpha( 0, 0 )
	DotBase:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4.5, _1080p * 4.5, _1080p * -4.5, _1080p * 4.5 )
	self:addElement( DotBase )
	self.DotBase = DotBase
	
	local circleRightS = nil
	
	circleRightS = LUI.UIImage.new()
	circleRightS.id = "circleRightS"
	circleRightS:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	circleRightS:SetAlpha( 0.2, 0 )
	circleRightS:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	circleRightS:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -10, _1080p * -2, _1080p * -4, _1080p * 4 )
	self:addElement( circleRightS )
	self.circleRightS = circleRightS
	
	local circleLeftS = nil
	
	circleLeftS = LUI.UIImage.new()
	circleLeftS.id = "circleLeftS"
	circleLeftS:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	circleLeftS:SetAlpha( 0.2, 0 )
	circleLeftS:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	circleLeftS:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 2, _1080p * 10, _1080p * -4, _1080p * 4 )
	self:addElement( circleLeftS )
	self.circleLeftS = circleLeftS
	
	local circleLeft = nil
	
	circleLeft = LUI.UIImage.new()
	circleLeft.id = "circleLeft"
	circleLeft:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	circleLeft:SetAlpha( 0.6, 0 )
	circleLeft:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	circleLeft:SetBlendMode( BLEND_MODE.addWithAlpha )
	circleLeft:SetAnchorsAndPosition( 0, 1, 0.5, 0.5, _1080p * 3, _1080p * 9, _1080p * -3, _1080p * 3 )
	self:addElement( circleLeft )
	self.circleLeft = circleLeft
	
	local circleRight = nil
	
	circleRight = LUI.UIImage.new()
	circleRight.id = "circleRight"
	circleRight:SetRGBFromTable( SWATCHES.Reticles.Blue, 0 )
	circleRight:SetAlpha( 0.6, 0 )
	circleRight:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	circleRight:SetBlendMode( BLEND_MODE.addWithAlpha )
	circleRight:SetAnchorsAndPosition( 1, 0, 0.5, 0.5, _1080p * -9, _1080p * -3, _1080p * -3, _1080p * 3 )
	self:addElement( circleRight )
	self.circleRight = circleRight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DotBase:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotBase:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.DotBase:SetAlpha( 0.4, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetAlpha( 0, 60 )
				end
			}
		} )
		circleLeft:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.circleLeft:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.circleLeft:SetAlpha( 0.4, 60 )
				end
			}
		} )
		circleRight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.circleRight:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.circleRight:SetAlpha( 0.4, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			DotBase:AnimateLoop( "ADSOUT" )
			circleLeft:AnimateLoop( "ADSOUT" )
			circleRight:AnimateLoop( "ADSOUT" )
		end
		
		DotBase:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotBase:SetAlpha( 1, 60 )
				end
			},
			{
				function ()
					return self.DotBase.DotHighlight:SetAlpha( 0.6, 60 )
				end
			},
			{
				function ()
					return self.DotBase.Dot:SetRGBFromInt( 2490623, 60 )
				end
			}
		} )
		circleLeft:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.circleLeft:SetAlpha( 0.6, 60 )
				end
			}
		} )
		circleRight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.circleRight:SetAlpha( 0.6, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			DotBase:AnimateSequence( "ADSIN" )
			circleLeft:AnimateSequence( "ADSIN" )
			circleRight:AnimateSequence( "ADSIN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle02", Reticle02 )
LockTable( _M )
