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

function Reticle46( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle46"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local AccentS = nil
	
	AccentS = LUI.UIImage.new()
	AccentS.id = "AccentS"
	AccentS:SetRGBFromTable( SWATCHES.Reticles.DarkBrown, 0 )
	AccentS:SetAlpha( 0.4, 0 )
	AccentS:SetScale( 0.1, 0 )
	AccentS:setImage( RegisterMaterial( "hud_reticle_atomizer2" ), 0 )
	AccentS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -8, _1080p * 8 )
	self:addElement( AccentS )
	self.AccentS = AccentS
	
	local Accents = nil
	
	Accents = LUI.UIImage.new()
	Accents.id = "Accents"
	Accents:SetRGBFromTable( SWATCHES.Reticles.Orange, 0 )
	Accents:SetAlpha( 0.6, 0 )
	Accents:setImage( RegisterMaterial( "hud_reticle_atomizer2" ), 0 )
	Accents:SetBlendMode( BLEND_MODE.addWithAlpha )
	Accents:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * 8, _1080p * -7.5, _1080p * 7.5 )
	self:addElement( Accents )
	self.Accents = Accents
	
	local Hand = nil
	
	Hand = LUI.UIImage.new()
	Hand.id = "Hand"
	Hand:SetAlpha( 0.8, 0 )
	Hand:setImage( RegisterMaterial( "hud_reticle_46" ), 0 )
	Hand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27.4, _1080p * 23.4, _1080p * -0.5, _1080p * 95.5 )
	self:addElement( Hand )
	self.Hand = Hand
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Hand:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.Hand:setImage( RegisterMaterial( "hud_reticle_46b" ), 30 )
				end,
				function ()
					return self.Hand:setImage( RegisterMaterial( "hud_reticle_46" ), 270 )
				end
			},
			{
				function ()
					return self.Hand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27.4, _1080p * 23.4, _1080p * -0.5, _1080p * 95.5, 230 )
				end,
				function ()
					return self.Hand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27.4, _1080p * 23.4, _1080p * 3.5, _1080p * 95.5, 70 )
				end,
				function ()
					return self.Hand:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -27.4, _1080p * 23.4, _1080p * -0.5, _1080p * 95.5, 69 )
				end
			}
		} )
		self._sequences.OnFire = function ()
			Hand:AnimateSequence( "OnFire" )
		end
		
		AccentS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.AccentS:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Accents:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Accents:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Hand:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Hand:SetAlpha( 0.8, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			AccentS:AnimateSequence( "ADSIN" )
			Accents:AnimateSequence( "ADSIN" )
			Hand:AnimateSequence( "ADSIN" )
		end
		
		AccentS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.AccentS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Accents:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Accents:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Accents:SetAlpha( 0.4, 60 )
				end
			}
		} )
		Hand:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Hand:SetAlpha( 0, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			AccentS:AnimateLoop( "ADSOUT" )
			Accents:AnimateLoop( "ADSOUT" )
			Hand:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f3_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle46", Reticle46 )
LockTable( _M )
