local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local weaponRotationArea = LUI.UIModelRotationArea.new( {
		type = LUI.UIModelRotationArea.Types.Weapon
	} )
	weaponRotationArea.id = "weaponRotationArea"
	weaponRotationArea:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	f1_arg0:addElement( weaponRotationArea )
	f1_arg0.weaponRotationArea = weaponRotationArea
	
	f1_arg0.weaponRotationArea:SetModelIndex( 0 )
end

function WeaponRotator( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 100 * _1080p, 0, 100 * _1080p )
	self.id = "WeaponRotator"
	local f2_local1 = controller and controller.controllerIndex
	if not f2_local1 and not Engine.InFrontend() then
		f2_local1 = self:getRootController()
	end
	assert( f2_local1 )
	local f2_local2 = self
	f0_local0( self, f2_local1, controller )
	return self
end

MenuBuilder.registerType( "WeaponRotator", WeaponRotator )
LockTable( _M )
