LUI.UIWeaponModel = LUI.Class( LUI.UIElement )
LUI.UIWeaponModel.init = function ( f1_arg0, f1_arg1 )
	LUI.UIWeaponModel.super.init( f1_arg0 )
	assert( f1_arg1 )
	assert( f1_arg1.controllerIndex )
	assert( f1_arg1.clientWeaponIndex )
	assert( f1_arg1.basePosition )
	f1_arg0._clientWeaponIndex = f1_arg1.clientWeaponIndex
	f1_arg0:SetupWeaponModel( {
		base2DPosition = f1_arg1.basePosition,
		unitsPerPixel = 0.03
	} )
	f1_arg0:SubscribeToModelThroughElement( f1_arg0, "ref", LUI.UIWeaponModel.GetDataSourceSetFunction( f1_arg0, f1_arg1.controllerIndex ) )
end

LUI.UIWeaponModel.GetDataSourceSetFunction = function ( f2_arg0, f2_arg1 )
	return function ()
		local f3_local0 = f2_arg0:GetDataSource()
		assert( f3_local0 )
		assert( f3_local0.ref )
		f2_arg0:SetWeaponModel( Cac.GetCompleteWeaponModelName( f3_local0.baseWeaponRef:GetValue( f2_arg1 ), f3_local0.ref:GetValue( f2_arg1 ), f3_local0.quality:GetValue( f2_arg1 ), f3_local0.variantID:GetValue( f2_arg1 ), Cac.CamoNoneValue ) )
	end
	
end

LUI.UIWeaponModel.SetWeaponModel = function ( f4_arg0, f4_arg1 )
	assert( f4_arg0._clientWeaponIndex )
	local f4_local0 = f4_arg0._clientWeaponIndex
	f4_arg0:SetWeaponIndex( f4_local0 )
	FrontEndScene.SetWeaponModel( f4_local0, f4_arg1 )
	local f4_local1, f4_local2, f4_local3, f4_local4, f4_local5, f4_local6, f4_local7, f4_local8, f4_local9 = FrontEndScene.GetWeaponModelOffset( f4_arg1 )
	f4_arg0:SetWeaponOffset( f4_local1, f4_local2, f4_local3 )
	ClientWeapon.SetWeaponRotationCenter( f4_local0, f4_local4, f4_local5, f4_local6 )
	ClientWeapon.SetWeaponVisible( f4_local0, true )
	ClientWeapon.SetWeaponDefaultAngles( f4_local0, f4_local7, f4_local8, f4_local9 )
end

LUI.UIWeaponModel.id = "UIWeaponModel"
