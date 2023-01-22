local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function ReticleHipRail( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 32 * _1080p, 0, 32 * _1080p )
	self.id = "ReticleHipRail"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local BottomTic = nil
	
	BottomTic = LUI.UIImage.new()
	BottomTic.id = "BottomTic"
	BottomTic:SetZRotation( 180, 0 )
	BottomTic:setImage( RegisterMaterial( "hud_reticle_hip_tic" ), 0 )
	BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 16, _1080p * 32 )
	BottomTic:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( BottomTic )
	self.BottomTic = BottomTic
	
	local LeftTic = nil
	
	LeftTic = LUI.UIImage.new()
	LeftTic.id = "LeftTic"
	LeftTic:SetZRotation( 45, 0 )
	LeftTic:setImage( RegisterMaterial( "hud_reticle_hip_tic" ), 0 )
	LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * -20.5, _1080p * -30, _1080p * -14 )
	LeftTic:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( LeftTic )
	self.LeftTic = LeftTic
	
	local RightTic = nil
	
	RightTic = LUI.UIImage.new()
	RightTic.id = "RightTic"
	RightTic:SetZRotation( -45, 0 )
	RightTic:setImage( RegisterMaterial( "hud_reticle_hip_tic" ), 0 )
	RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20.5, _1080p * 23.5, _1080p * -30, _1080p * -14 )
	RightTic:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( RightTic )
	self.RightTic = RightTic
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		BottomTic:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.BottomTic:SetScale( 0, 0 )
				end,
				function ()
					return self.BottomTic:SetScale( 0.4, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.BottomTic:SetScale( 0, 140, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 16, _1080p * 32, 0 )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 43, _1080p * 59, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 16, _1080p * 32, 139, LUI.EASING.inBack )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 3, _1080p * 19, 49, LUI.EASING.outBack )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 16, _1080p * 32, 149, LUI.EASING.outBack )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 14, _1080p * 30, 40, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.BottomTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -1.5, _1080p * 1.5, _1080p * 16, _1080p * 32, 69, LUI.EASING.outQuadratic )
				end
			}
		} )
		LeftTic:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.LeftTic:SetScale( 0, 0 )
				end,
				function ()
					return self.LeftTic:SetScale( 0.4, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.LeftTic:SetScale( 0, 140, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * -20.5, _1080p * -30, _1080p * -14, 0 )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -49.5, _1080p * -46.5, _1080p * -56, _1080p * -40, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * -20.5, _1080p * -30, _1080p * -14, 139, LUI.EASING.inBack )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11.5, _1080p * -8.5, _1080p * -18, _1080p * -2, 49, LUI.EASING.outBack )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * -20.5, _1080p * -30, _1080p * -14, 149, LUI.EASING.outBack )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -21.5, _1080p * -18.5, _1080p * -28, _1080p * -12, 40, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.LeftTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -23.5, _1080p * -20.5, _1080p * -30, _1080p * -14, 69, LUI.EASING.outQuadratic )
				end
			}
		} )
		RightTic:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.RightTic:SetScale( 0, 0 )
				end,
				function ()
					return self.RightTic:SetScale( 0.4, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.RightTic:SetScale( 0, 140, LUI.EASING.inBack )
				end
			},
			{
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20.5, _1080p * 23.5, _1080p * -30, _1080p * -14, 0 )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 46.5, _1080p * 49.5, _1080p * -56, _1080p * -40, 50, LUI.EASING.outSine )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20.5, _1080p * 23.5, _1080p * -30, _1080p * -14, 139, LUI.EASING.inBack )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 9, _1080p * 12, _1080p * -18, _1080p * -2, 49, LUI.EASING.outBack )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20.5, _1080p * 23.5, _1080p * -30, _1080p * -14, 149, LUI.EASING.outBack )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 18.5, _1080p * 21.5, _1080p * -28, _1080p * -12, 40, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.RightTic:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 20.5, _1080p * 23.5, _1080p * -30, _1080p * -14, 69, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			BottomTic:AnimateSequence( "OnFire" )
			LeftTic:AnimateSequence( "OnFire" )
			RightTic:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	return self
end

MenuBuilder.registerType( "ReticleHipRail", ReticleHipRail )
LockTable( _M )
