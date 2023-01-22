local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function Reticle40b( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 16 * _1080p )
	self.id = "Reticle40b"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local TR = nil
	
	TR = LUI.UIImage.new()
	TR.id = "TR"
	TR:setImage( RegisterMaterial( "hud_reticle_40b" ), 0 )
	TR:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -22, _1080p * -1, _1080p * 2, _1080p * 8 )
	self:addElement( TR )
	self.TR = TR
	
	local BR = nil
	
	BR = LUI.UIImage.new()
	BR.id = "BR"
	BR:setImage( RegisterMaterial( "hud_reticle_40b" ), 0 )
	BR:SetAnchorsAndPosition( 1, 0, 1, 0, _1080p * -12, _1080p * 6, _1080p * -8, _1080p * -2 )
	self:addElement( BR )
	self.BR = BR
	
	local TL = nil
	
	TL = LUI.UIImage.new()
	TL.id = "TL"
	TL:SetXRotation( 180, 0 )
	TL:SetZRotation( 180, 0 )
	TL:setImage( RegisterMaterial( "hud_reticle_40b" ), 0 )
	TL:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 1, _1080p * 22, _1080p * 2, _1080p * 8 )
	self:addElement( TL )
	self.TL = TL
	
	local BL = nil
	
	BL = LUI.UIImage.new()
	BL.id = "BL"
	BL:SetXRotation( 180, 0 )
	BL:SetZRotation( 180, 0 )
	BL:setImage( RegisterMaterial( "hud_reticle_40b" ), 0 )
	BL:SetAnchorsAndPosition( 0, 1, 1, 0, _1080p * -6, _1080p * 12, _1080p * -8, _1080p * -2 )
	self:addElement( BL )
	self.BL = BL
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		TR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 40, _1080p * -6, 0, 109 )
				end,
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 40, _1080p * -6, 0, 40 )
				end,
				function ()
					return self.TR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 31, _1080p * -6, 0, 89, LUI.EASING.inQuartic )
				end
			}
		} )
		BR:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 38, 0, _1080p * 6, 109 )
				end,
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20, _1080p * 38, 0, _1080p * 6, 129 )
				end,
				function ()
					return self.BR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 10, _1080p * 28, 0, _1080p * 6, 109, LUI.EASING.inQuartic )
				end
			}
		} )
		TL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * -20, _1080p * -6, 0, 109 )
				end,
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -40, _1080p * -20, _1080p * -6, 0, 40 )
				end,
				function ()
					return self.TL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -31, _1080p * -10, _1080p * -6, 0, 89, LUI.EASING.inQuartic )
				end
			}
		} )
		BL:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * -20, 0, _1080p * 6, 109 )
				end,
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -38, _1080p * -20, 0, _1080p * 6, 129 )
				end,
				function ()
					return self.BL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -28, _1080p * -10, 0, _1080p * 6, 109, LUI.EASING.inQuartic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			TR:AnimateSequence( "OnFire" )
			BR:AnimateSequence( "OnFire" )
			TL:AnimateSequence( "OnFire" )
			BL:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "Reticle40b", Reticle40b )
LockTable( _M )
