local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function PostLoadFunc( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.Dot:SetBlendMode( BLEND_MODE.addWithAlpha )
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

function RedDot( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 10 * _1080p, 0, 10 * _1080p )
	self.id = "RedDot"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local DotShadow = nil
	
	DotShadow = LUI.UIImage.new()
	DotShadow.id = "DotShadow"
	DotShadow:SetRGBFromInt( 16711694, 0 )
	DotShadow:SetAlpha( 0, 0 )
	DotShadow:SetScale( 0.25, 0 )
	DotShadow:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	self:addElement( DotShadow )
	self.DotShadow = DotShadow
	
	local Dot = nil
	
	Dot = LUI.UIImage.new()
	Dot.id = "Dot"
	Dot:SetRGBFromInt( 16711699, 0 )
	Dot:SetAlpha( 0, 0 )
	Dot:SetScale( 0.25, 0 )
	Dot:setImage( RegisterMaterial( "hud_reticle_faded_dot" ), 0 )
	Dot:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	self:addElement( Dot )
	self.Dot = Dot
	
	local DotHighlight = nil
	
	DotHighlight = LUI.UIImage.new()
	DotHighlight.id = "DotHighlight"
	DotHighlight:SetRGBFromInt( 16776661, 0 )
	DotHighlight:SetAlpha( 0, 0 )
	DotHighlight:SetScale( -0.55, 0 )
	DotHighlight:setImage( RegisterMaterial( "hud_reticle_circle_fill" ), 0 )
	self:addElement( DotHighlight )
	self.DotHighlight = DotHighlight
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		DotShadow:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotShadow:SetAlpha( 0.4, 30 )
				end
			},
			{
				function ()
					return self.DotShadow:SetScale( 0.25, 30 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Dot:SetAlpha( 1, 30 )
				end
			}
		} )
		DotHighlight:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.DotHighlight:SetAlpha( 0.6, 30 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			DotShadow:AnimateSequence( "ADSIN" )
			Dot:AnimateSequence( "ADSIN" )
			DotHighlight:AnimateSequence( "ADSIN" )
		end
		
		DotShadow:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotShadow:SetAlpha( 0.3, 0 )
				end,
				function ()
					return self.DotShadow:SetAlpha( 0, 30 )
				end
			}
		} )
		Dot:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Dot:SetAlpha( 1, 0 )
				end,
				function ()
					return self.Dot:SetAlpha( 0, 30 )
				end
			}
		} )
		DotHighlight:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.DotHighlight:SetAlpha( 0.5, 0 )
				end,
				function ()
					return self.DotHighlight:SetAlpha( 0, 30 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			DotShadow:AnimateSequence( "ADSOUT" )
			Dot:AnimateSequence( "ADSOUT" )
			DotHighlight:AnimateSequence( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "RedDot", RedDot )
LockTable( _M )
