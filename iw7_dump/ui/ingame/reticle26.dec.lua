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

function Reticle26( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 64 * _1080p, 0, 64 * _1080p )
	self.id = "Reticle26"
	self._animationSets = {}
	self._sequences = {}
	local f3_local1 = controller and controller.controllerIndex
	if not f3_local1 and not Engine.InFrontend() then
		f3_local1 = self:getRootController()
	end
	assert( f3_local1 )
	local f3_local2 = self
	local Skull = nil
	
	Skull = LUI.UIImage.new()
	Skull.id = "Skull"
	Skull:SetAlpha( 0.3, 0 )
	Skull:setImage( RegisterMaterial( "hud_reticle_26" ), 0 )
	Skull:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -42, _1080p * 22 )
	self:addElement( Skull )
	self.Skull = Skull
	
	local GleamL = nil
	
	GleamL = LUI.UIImage.new()
	GleamL.id = "GleamL"
	GleamL:SetAlpha( 0, 0 )
	GleamL:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	GleamL:SetBlendMode( BLEND_MODE.addWithAlpha )
	GleamL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -11, _1080p * -5, _1080p * -26, _1080p * -20 )
	self:addElement( GleamL )
	self.GleamL = GleamL
	
	local GleamR = nil
	
	GleamR = LUI.UIImage.new()
	GleamR.id = "GleamR"
	GleamR:SetAlpha( 0, 0 )
	GleamR:setImage( RegisterMaterial( "hud_reticle_21b" ), 0 )
	GleamR:SetBlendMode( BLEND_MODE.addWithAlpha )
	GleamR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 6, _1080p * 12, _1080p * -26, _1080p * -20 )
	self:addElement( GleamR )
	self.GleamR = GleamR
	
	local RedDot = nil
	
	RedDot = MenuBuilder.BuildRegisteredType( "RedDot", {
		controllerIndex = f3_local1
	} )
	RedDot.id = "RedDot"
	RedDot:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -4, _1080p * 4, _1080p * -4, _1080p * 4 )
	self:addElement( RedDot )
	self.RedDot = RedDot
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Skull:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.Skull:SetAlpha( 0.2, 0 )
				end,
				function ()
					return self.Skull:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Skull:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -20, _1080p * 20, _1080p * -20, _1080p * 20, 59 )
				end
			}
		} )
		GleamL:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GleamL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -8, _1080p * -2, _1080p * -11, _1080p * -5, 59 )
				end
			}
		} )
		GleamR:RegisterAnimationSequence( "ADSOUT", {
			{
				function ()
					return self.GleamR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 2.5, _1080p * 8.5, _1080p * -11, _1080p * -5, 59 )
				end
			}
		} )
		self._sequences.ADSOUT = function ()
			Skull:AnimateLoop( "ADSOUT" )
			GleamL:AnimateLoop( "ADSOUT" )
			GleamR:AnimateLoop( "ADSOUT" )
		end
		
		GleamL:RegisterAnimationSequence( "AimEnemy", {
			{
				function ()
					return self.GleamL:SetZRotation( 0, 0 )
				end,
				function ()
					return self.GleamL:SetZRotation( -180, 300, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.GleamL:SetAlpha( 1, 50 )
				end
			}
		} )
		GleamR:RegisterAnimationSequence( "AimEnemy", {
			{
				function ()
					return self.GleamR:SetZRotation( 0, 0 )
				end,
				function ()
					return self.GleamR:SetZRotation( -180, 300, LUI.EASING.inOutQuadratic )
				end
			},
			{
				function ()
					return self.GleamR:SetAlpha( 1, 50 )
				end
			}
		} )
		self._sequences.AimEnemy = function ()
			GleamL:AnimateSequence( "AimEnemy" )
			GleamR:AnimateSequence( "AimEnemy" )
		end
		
		GleamL:RegisterAnimationSequence( "AimNeutral", {
			{
				function ()
					return self.GleamL:SetAlpha( 0, 100 )
				end
			}
		} )
		GleamR:RegisterAnimationSequence( "AimNeutral", {
			{
				function ()
					return self.GleamR:SetAlpha( 0, 100 )
				end
			}
		} )
		self._sequences.AimNeutral = function ()
			GleamL:AnimateSequence( "AimNeutral" )
			GleamR:AnimateSequence( "AimNeutral" )
		end
		
		Skull:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.Skull:SetAlpha( 0.3, 60 )
				end
			},
			{
				function ()
					return self.Skull:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -32, _1080p * 32, _1080p * -42, _1080p * 22, 59 )
				end
			}
		} )
		GleamL:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GleamL:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * -12, _1080p * -4, _1080p * -27, _1080p * -19, 59 )
				end
			}
		} )
		GleamR:RegisterAnimationSequence( "ADSIN", {
			{
				function ()
					return self.GleamR:SetAnchorsAndPosition( 0.5, 0.5, 0.5, 0.5, _1080p * 5, _1080p * 13, _1080p * -27, _1080p * -19, 59 )
				end
			}
		} )
		self._sequences.ADSIN = function ()
			Skull:AnimateSequence( "ADSIN" )
			GleamL:AnimateSequence( "ADSIN" )
			GleamR:AnimateSequence( "ADSIN" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetModel( f3_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) == true then
			ACTIONS.AnimateSequence( self, "AimEnemy" )
		end
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f3_local1 ) == false then
			ACTIONS.AnimateSequence( self, "AimNeutral" )
		end
	end )
	PostLoadFunc( self, f3_local1, controller )
	return self
end

MenuBuilder.registerType( "Reticle26", Reticle26 )
LockTable( _M )
