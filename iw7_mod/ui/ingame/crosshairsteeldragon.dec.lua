local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function CrosshairSteelDragon( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "CrosshairSteelDragon"
	self._animationSets = {}
	self._sequences = {}
	local f1_local1 = controller and controller.controllerIndex
	if not f1_local1 and not Engine.InFrontend() then
		f1_local1 = self:getRootController()
	end
	assert( f1_local1 )
	local f1_local2 = self
	local CrosshairSteelDragonBase = nil
	
	CrosshairSteelDragonBase = MenuBuilder.BuildRegisteredType( "CrosshairSteelDragonBase", {
		controllerIndex = f1_local1
	} )
	CrosshairSteelDragonBase.id = "CrosshairSteelDragonBase"
	CrosshairSteelDragonBase:SetAnchors( 0.5, 0.5, 0.5, 0.5, 0 )
	CrosshairSteelDragonBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f2_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f2_local0 ~= nil then
			CrosshairSteelDragonBase:SetLeft( _1080p * Multiply( f2_local0, -1 ), 0 )
		end
	end )
	CrosshairSteelDragonBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f3_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f3_local0 ~= nil then
			CrosshairSteelDragonBase:SetRight( _1080p * Multiply( f3_local0, 1 ), 0 )
		end
	end )
	CrosshairSteelDragonBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f4_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f4_local0 ~= nil then
			CrosshairSteelDragonBase:SetTop( _1080p * Multiply( f4_local0, -1 ), 0 )
		end
	end )
	CrosshairSteelDragonBase:SubscribeToModel( DataSources.inGame.player.currentWeapon.crosshairRadius:GetModel( f1_local1 ), function ()
		local f5_local0 = DataSources.inGame.player.currentWeapon.crosshairRadius:GetValue( f1_local1 )
		if f5_local0 ~= nil then
			CrosshairSteelDragonBase:SetBottom( _1080p * Multiply( f5_local0, 1 ), 0 )
		end
	end )
	CrosshairSteelDragonBase:BindColorToModel( DataSources.inGame.player.currentWeapon.crosshairColor:GetModel( f1_local1 ) )
	self:addElement( CrosshairSteelDragonBase )
	self.CrosshairSteelDragonBase = CrosshairSteelDragonBase
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		CrosshairSteelDragonBase:RegisterAnimationSequence( "NotInRange", {
			{
				function ()
					return self.CrosshairSteelDragonBase:SetScale( 0, 100 )
				end
			}
		} )
		self._sequences.NotInRange = function ()
			CrosshairSteelDragonBase:AnimateSequence( "NotInRange" )
		end
		
		CrosshairSteelDragonBase:RegisterAnimationSequence( "InRange", {
			{
				function ()
					return self.CrosshairSteelDragonBase:SetScale( 0, 0 )
				end,
				function ()
					return self.CrosshairSteelDragonBase:SetScale( -0.2, 100, LUI.EASING.outSine )
				end,
				function ()
					return self.CrosshairSteelDragonBase:SetScale( -0.1, 200, LUI.EASING.inSine )
				end
			}
		} )
		self._sequences.InRange = function ()
			CrosshairSteelDragonBase:AnimateSequence( "InRange" )
		end
		
		CrosshairSteelDragonBase:RegisterAnimationSequence( "OnFire", {
			{
				function ()
					return self.CrosshairSteelDragonBase:SetScale( 0.08, 0 )
				end,
				function ()
					return self.CrosshairSteelDragonBase:SetScale( 0, 100, LUI.EASING.outQuintic )
				end
			}
		} )
		self._sequences.OnFire = function ()
			CrosshairSteelDragonBase:AnimateSequence( "OnFire" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetModel( f1_local1 ), function ()
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) == true then
			ACTIONS.AnimateSequence( self, "InRange" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CrosshairSteelDragonBase",
				sequenceName = "YesX",
				elementPath = "CrosshairSteelDragonBase"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CrosshairSteelDragonBase",
				sequenceName = "Whirlygig",
				elementPath = "CrosshairSteelDragonBase"
			} )
		end
		if DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) ~= nil and DataSources.inGame.player.currentWeapon.isAimingAtEnemy:GetValue( f1_local1 ) == false then
			ACTIONS.AnimateSequence( self, "NotInRange" )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CrosshairSteelDragonBase",
				sequenceName = "NoX",
				elementPath = "CrosshairSteelDragonBase"
			} )
			ACTIONS.AnimateSequenceByElement( self, {
				elementName = "CrosshairSteelDragonBase",
				sequenceName = "StopWhirlygig",
				elementPath = "CrosshairSteelDragonBase"
			} )
		end
	end )
	self:SubscribeToModel( DataSources.inGame.player.currentWeapon.shotCounter:GetModel( f1_local1 ), function ()
		ACTIONS.AnimateSequence( self, "OnFire" )
	end )
	ACTIONS.AnimateSequenceByElement( self, {
		elementName = "ReticleSteelDragonFramePart",
		sequenceName = "Spin",
		elementPath = "CrosshairSteelDragonBase.ReticleSteelDragonFramePart"
	} )
	return self
end

MenuBuilder.registerType( "CrosshairSteelDragon", CrosshairSteelDragon )
LockTable( _M )
