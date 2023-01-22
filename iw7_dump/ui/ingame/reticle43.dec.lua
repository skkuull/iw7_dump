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

function Reticle43( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle43"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local HeartS = nil
	
	HeartS = LUI.UIImage.new()
	HeartS.id = "HeartS"
	HeartS:SetRGBFromInt( 15023443, 0 )
	HeartS:SetAlpha( 0.2, 0 )
	HeartS:setImage( RegisterMaterial( "hud_reticle_43" ), 0 )
	HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60 )
	self:addElement( HeartS )
	self.HeartS = HeartS
	
	local Heart = nil
	
	Heart = LUI.UIImage.new()
	Heart.id = "Heart"
	Heart:SetRGBFromInt( 16761572, 0 )
	Heart:SetAlpha( 0.6, 0 )
	Heart:setImage( RegisterMaterial( "hud_reticle_43" ), 0 )
	Heart:SetBlendMode( BLEND_MODE.addWithAlpha )
	Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60 )
	self:addElement( Heart )
	self.Heart = Heart
	
	local RedDot = nil
	
	RedDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f3_local1
	} )
	RedDot.id = "RedDot"
	RedDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -3.5, _1080p * 3.5, _1080p * -3.5, _1080p * 3.5 )
	self:addElement( RedDot )
	self.RedDot = RedDot
	
	local Drip = nil
	
	Drip = LUI.UIImage.new()
	Drip.id = "Drip"
	Drip:SetAlpha( 0.3, 0 )
	Drip:SetScale( -0.2, 0 )
	Drip:setImage( RegisterMaterial( "hud_reticle_43b" ), 0 )
	Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 8.5, _1080p * 15.5, _1080p * 29, _1080p * 43 )
	self:addElement( Drip )
	self.Drip = Drip
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		HeartS:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 0 )
				end,
				function ()
					return self.HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 200 )
				end,
				function ()
					return self.HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 200, LUI.EASING.inOutBack )
				end,
				function ()
					return self.HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.HeartS:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 500 )
				end
			}
		} )
		Heart:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 0 )
				end,
				function ()
					return self.Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 200 )
				end,
				function ()
					return self.Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -64, _1080p * 64, _1080p * -64, _1080p * 64, 200, LUI.EASING.inOutBack )
				end,
				function ()
					return self.Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 200, LUI.EASING.outBack )
				end,
				function ()
					return self.Heart:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -60, _1080p * 60, _1080p * -60, _1080p * 60, 500 )
				end
			}
		} )
		Drip:RegisterAnimationSequence( "Pulse", {
			{
				function ()
					return self.Drip:SetAlpha( 0, 0 )
				end,
				function ()
					return self.Drip:SetAlpha( 0.2, 1100 )
				end,
				function ()
					return self.Drip:SetAlpha( 0.2, 200 )
				end,
				function ()
					return self.Drip:SetAlpha( 0.2, 400 )
				end,
				function ()
					return self.Drip:SetAlpha( 0, 1600 )
				end
			},
			{
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6.5, _1080p * 11.5, _1080p * 22, _1080p * 30, 0 )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6.5, _1080p * 11.5, _1080p * 22, _1080p * 30, 1100 )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6.5, _1080p * 11.5, _1080p * 22, _1080p * 30, 199 )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 7.5, _1080p * 12.5, _1080p * 23, _1080p * 31, 210, LUI.EASING.inOutBack )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 12.5, _1080p * 17.5, _1080p * 31.5, 190 )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6.25, _1080p * 13, _1080p * 180.5, _1080p * 195.5, 500, LUI.EASING.inQuartic )
				end,
				function ()
					return self.Drip:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6.25, _1080p * 13, _1080p * 180.5, _1080p * 195.5, 1099 )
				end
			}
		} )
		self._sequences.Pulse = function ()
			HeartS:AnimateLoop( "Pulse" )
			Heart:AnimateLoop( "Pulse" )
			Drip:AnimateLoop( "Pulse" )
		end
		
		HeartS:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.HeartS:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.HeartS:SetAlpha( 0.2, 60 )
				end
			}
		} )
		Heart:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Heart:SetScale( 0, 60 )
				end
			},
			{
				function ()
					return self.Heart:SetAlpha( 0.6, 60 )
				end
			}
		} )
		Drip:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Drip:SetScale( -0.2, 60 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			HeartS:AnimateSequence( "ADSIN" )
			Heart:AnimateSequence( "ADSIN" )
			Drip:AnimateSequence( "ADSIN" )
		end
		
		HeartS:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.HeartS:SetAlpha( 0.1, 0 )
				end,
				function ()
					return self.HeartS:SetAlpha( 0.15, 60 )
				end
			},
			{
				function ()
					return self.HeartS:SetScale( -0.4, 60 )
				end
			}
		} )
		Heart:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Heart:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Heart:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Heart:SetScale( -0.4, 60 )
				end
			}
		} )
		Drip:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Drip:SetScale( -1, 60 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			HeartS:AnimateLoop( "ADSOUT" )
			Heart:AnimateLoop( "ADSOUT" )
			Drip:AnimateLoop( "ADSOUT" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	PostLoadFunc( self, f3_local1, controller )
	ACTIONS.AnimateSequence( self, "Pulse" )
	return self
end

MenuBuilder.registerType( "Reticle43", Reticle43 )
LockTable( _M )
