local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Reticle01Base( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 12 * _1080p, 0, 12 * _1080p )
	self.id = "Reticle01Base"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TLineS = nil
	
	TLineS = LUI.UIImage.new()
	TLineS.id = "TLineS"
	TLineS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	TLineS:SetAlpha( 0.6, 0 )
	TLineS:SetZRotation( 90, 0 )
	TLineS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLineS:SetUseAA( true )
	TLineS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -10, _1080p * 10, _1080p * -6, 0 )
	self:addElement( TLineS )
	self.TLineS = TLineS
	
	local LLineS = nil
	
	LLineS = LUI.UIImage.new()
	LLineS.id = "LLineS"
	LLineS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	LLineS:SetAlpha( 0.6, 0 )
	LLineS:SetZRotation( 30, 0 )
	LLineS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	LLineS:SetUseAA( true )
	LLineS:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, _1080p * 5, _1080p * -1, _1080p * 5 )
	self:addElement( LLineS )
	self.LLineS = LLineS
	
	local RLineS = nil
	
	RLineS = LUI.UIImage.new()
	RLineS.id = "RLineS"
	RLineS:SetRGBFromTable( SWATCHES.Reticles.DarkContrast, 0 )
	RLineS:SetAlpha( 0.6, 0 )
	RLineS:SetZRotation( -30, 0 )
	RLineS:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	RLineS:SetUseAA( true )
	RLineS:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -5, _1080p * 15, _1080p * -1, _1080p * 5 )
	self:addElement( RLineS )
	self.RLineS = RLineS
	
	local TLine = nil
	
	TLine = LUI.UIImage.new()
	TLine.id = "TLine"
	TLine:SetAlpha( 0.6, 0 )
	TLine:SetZRotation( 90, 0 )
	TLine:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	TLine:SetUseAA( true )
	TLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	TLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -8, _1080p * 8, _1080p * -4, _1080p * -2 )
	self:addElement( TLine )
	self.TLine = TLine
	
	local LLine = nil
	
	LLine = LUI.UIImage.new()
	LLine.id = "LLine"
	LLine:SetAlpha( 0.6, 0 )
	LLine:SetZRotation( 30, 0 )
	LLine:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	LLine:SetUseAA( true )
	LLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	LLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -13, _1080p * 3, _1080p * 1, _1080p * 3 )
	self:addElement( LLine )
	self.LLine = LLine
	
	local RLine = nil
	
	RLine = LUI.UIImage.new()
	RLine.id = "RLine"
	RLine:SetAlpha( 0.6, 0 )
	RLine:SetZRotation( -30, 0 )
	RLine:setImage( RegisterMaterial( "hud_reticle_notch_rounded_short" ), 0 )
	RLine:SetUseAA( true )
	RLine:SetBlendMode( BLEND_MODE.addWithAlpha )
	RLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -3, _1080p * 13, _1080p * 1, _1080p * 3 )
	self:addElement( RLine )
	self.RLine = RLine
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TLineS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TLineS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -9, _1080p * 9, _1080p * -2, _1080p * 1, 59 )
				end,
				function ()
					return self.TLineS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -9, _1080p * 9, _1080p * -8, _1080p * -4, 140 )
				end
			}
		} )
		LLineS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.LLineS:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -11, _1080p * 7, _1080p * -1, _1080p * 2, 59 )
				end,
				function ()
					return self.LLineS:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, _1080p * 3, _1080p * 1, _1080p * 5, 140 )
				end
			}
		} )
		RLineS:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.RLineS:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -7, _1080p * 11, _1080p * -1, _1080p * 2, 59 )
				end,
				function ()
					return self.RLineS:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -3, _1080p * 15, _1080p * 1, _1080p * 5, 140 )
				end
			}
		} )
		TLine:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -7, _1080p * 7, _1080p * -1, _1080p * 1, 59 )
				end,
				function ()
					return self.TLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -7, _1080p * 7, _1080p * -7, _1080p * -5, 140 )
				end
			}
		} )
		LLine:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.LLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -8, _1080p * 6, _1080p * -1, _1080p * 1, 59 )
				end,
				function ()
					return self.LLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -13, _1080p * 1, _1080p * 2, _1080p * 4, 140 )
				end
			}
		} )
		RLine:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.RLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -6, _1080p * 8, _1080p * -1, _1080p * 1, 59 )
				end,
				function ()
					return self.RLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 13, _1080p * 2, _1080p * 4, 140 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			TLineS:AnimateSequence( "OnFire" )
			LLineS:AnimateSequence( "OnFire" )
			RLineS:AnimateSequence( "OnFire" )
			TLine:AnimateSequence( "OnFire" )
			LLine:AnimateSequence( "OnFire" )
			RLine:AnimateSequence( "OnFire" )
		end
		
		TLineS:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.TLineS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -9, _1080p * 9, _1080p * -21, _1080p * -18, 100 )
				end,
				function ()
					return self.TLineS:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -9, _1080p * 9, _1080p * -7, _1080p * -3, 100 )
				end
			}
		} )
		LLineS:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.LLineS:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -28, _1080p * -10, _1080p * 12, _1080p * 15.5, 100 )
				end,
				function ()
					return self.LLineS:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -15, _1080p * 3, _1080p * 1.5, _1080p * 5.5, 100 )
				end
			}
		} )
		RLineS:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.RLineS:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 10, _1080p * 28, _1080p * 12, _1080p * 15.5, 100 )
				end,
				function ()
					return self.RLineS:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -3, _1080p * 15, _1080p * 1.5, _1080p * 5.5, 100 )
				end
			}
		} )
		TLine:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.TLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -7, _1080p * 7, _1080p * -20, _1080p * -18.5, 100 )
				end,
				function ()
					return self.TLine:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -7, _1080p * 7, _1080p * -5.5, _1080p * -3.5, 100 )
				end
			}
		} )
		LLine:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.LLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -26, _1080p * -12, _1080p * 13, _1080p * 14.5, 100 )
				end,
				function ()
					return self.LLine:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -13, _1080p * 1, _1080p * 2.5, _1080p * 4.5, 100 )
				end
			}
		} )
		RLine:RegisterAnimationSequence( "OnFire2", {
			{
				function ()
					return self.RLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * 12, _1080p * 26, _1080p * 13, _1080p * 14.5, 100 )
				end,
				function ()
					return self.RLine:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -1, _1080p * 13, _1080p * 2.5, _1080p * 4.5, 100 )
				end
			}
		} )
		self._sequences.OnFire2 = function ()
			TLineS:AnimateSequence( "OnFire2" )
			LLineS:AnimateSequence( "OnFire2" )
			RLineS:AnimateSequence( "OnFire2" )
			TLine:AnimateSequence( "OnFire2" )
			LLine:AnimateSequence( "OnFire2" )
			RLine:AnimateSequence( "OnFire2" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	return self
end

MenuBuilder.registerType( "Reticle01Base", Reticle01Base )
LockTable( _M )
