local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0 )
	assert( f1_arg0 )
	f1_arg0:SetAlpha( 0, 0 )
	f1_arg0:SetScale( 1, 0 )
	local f1_local0 = f1_arg0:Wait( 100 )
	f1_local0.onComplete = function ()
		f1_arg0:SetAlpha( 1, 200, LUI.EASING.outBack )
		f1_arg0:SetScale( 0, 200, LUI.EASING.outBack )
	end
	
end

f0_local1 = function ( f3_arg0 )
	assert( f3_arg0.DoubleXP )
	if Cac.IsDoubleXPActive() then
		f0_local0( f3_arg0.DoubleXP )
	else
		f3_arg0.DoubleXP:SetAlpha( 0, 0 )
	end
end

f0_local2 = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = LUI.DataSourceInGlobalModel.new( "alwaysLoaded.activeParty.members.count" )
	f4_arg0:SubscribeToModel( f4_local0:GetModel( f4_arg1 ), function ()
		f0_local1( f4_arg0 )
	end )
	assert( f4_arg0.DoubleWeaponXP )
	if Cac.IsDoubleWeaponXPActive() then
		f0_local0( f4_arg0.DoubleWeaponXP )
	else
		f4_arg0.DoubleWeaponXP:close()
		f4_arg0.DoubleWeaponXP = nil
	end
	assert( f4_arg0.DoubleMissionTeamXP )
	if Engine.IsAliensMode() then
		f4_arg0.DoubleMissionTeamXP:close()
		f4_arg0.DoubleMissionTeamXP = nil
	elseif Cac.IsDoubleMissionTeamXPActive() then
		f0_local0( f4_arg0.DoubleMissionTeamXP )
	else
		f4_arg0.DoubleMissionTeamXP:close()
		f4_arg0.DoubleMissionTeamXP = nil
	end
	assert( f4_arg0.DoubleKey )
	if Cac.IsDoubleKeyActive() then
		f0_local0( f4_arg0.DoubleKey )
	else
		f4_arg0.DoubleKey:close()
		f4_arg0.DoubleKey = nil
	end
end

function DoubleXPNotifications( menu, controller )
	local self = LUI.UIHorizontalStackedLayout.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 512 * _1080p, 0, 128 * _1080p )
	self.id = "DoubleXPNotifications"
	local f6_local1 = controller and controller.controllerIndex
	if not f6_local1 and not Engine.InFrontend() then
		f6_local1 = self:getRootController()
	end
	assert( f6_local1 )
	local f6_local2 = self
	local DoubleXP = nil
	
	DoubleXP = LUI.UIImage.new()
	DoubleXP.id = "DoubleXP"
	DoubleXP:setImage( RegisterMaterial( "icon_iw7_xp" ), 0 )
	DoubleXP:SetUseAA( true )
	DoubleXP:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 128, 0, _1080p * 128 )
	self:addElement( DoubleXP )
	self.DoubleXP = DoubleXP
	
	local DoubleWeaponXP = nil
	
	DoubleWeaponXP = LUI.UIImage.new()
	DoubleWeaponXP.id = "DoubleWeaponXP"
	DoubleWeaponXP:setImage( RegisterMaterial( "icon_iw7_xp_weapon" ), 0 )
	DoubleWeaponXP:SetUseAA( true )
	DoubleWeaponXP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 128, _1080p * 256, 0, _1080p * 128 )
	self:addElement( DoubleWeaponXP )
	self.DoubleWeaponXP = DoubleWeaponXP
	
	local DoubleMissionTeamXP = nil
	
	DoubleMissionTeamXP = LUI.UIImage.new()
	DoubleMissionTeamXP.id = "DoubleMissionTeamXP"
	DoubleMissionTeamXP:setImage( RegisterMaterial( "icon_iw7_xp_teams" ), 0 )
	DoubleMissionTeamXP:SetUseAA( true )
	DoubleMissionTeamXP:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 256, _1080p * 384, 0, _1080p * 128 )
	self:addElement( DoubleMissionTeamXP )
	self.DoubleMissionTeamXP = DoubleMissionTeamXP
	
	local DoubleKey = nil
	
	DoubleKey = LUI.UIImage.new()
	DoubleKey.id = "DoubleKey"
	DoubleKey:setImage( RegisterMaterial( "icon_iw7_xk" ), 0 )
	DoubleKey:SetUseAA( true )
	DoubleKey:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 384, _1080p * 512, 0, _1080p * 128 )
	self:addElement( DoubleKey )
	self.DoubleKey = DoubleKey
	
	f0_local2( self, f6_local1, controller )
	return self
end

MenuBuilder.registerType( "DoubleXPNotifications", DoubleXPNotifications )
LockTable( _M )
