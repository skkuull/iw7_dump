LUI.ContextualMenu = LUI.Class( LUI.UIVerticalList )
LUI.ContextualMenu.init = function ( f1_arg0, f1_arg1, f1_arg2 )
	LUI.ContextualMenu.super.init( f1_arg0, f1_arg1, f1_arg2 )
	assert( f1_arg2 )
	assert( f1_arg2.buttonsDataSource )
	assert( f1_arg2.controllerIndex )
	assert( f1_arg2.ownerButton )
	f1_arg0.id = "ContextualMenu_" .. f1_arg2.ownerButton.id
	for f1_local0 = 1, f1_arg2.buttonsDataSource:GetCountValue( f1_arg2.controllerIndex ), 1 do
		local f1_local3 = MenuBuilder.BuildRegisteredType( "ContextualButton", {
			controllerIndex = f1_arg2.controllerIndex
		} )
		f1_local3.id = "contextualButton" .. f1_local0
		local f1_local4 = assert
		local f1_local5 = f1_arg2.buttonsDataSource:GetDataSourceAtIndex( f1_local0, f1_arg2.controllerIndex )
		f1_local4( f1_local5.buttonDataSource )
		f1_local5 = f1_local3
		f1_local4 = f1_local3.SetDataSource
		local f1_local6 = f1_arg2.buttonsDataSource:GetDataSourceAtIndex( f1_local0, f1_arg2.controllerIndex )
		f1_local4( f1_local5, f1_local6.buttonDataSource, f1_arg2.controllerIndex )
		f1_local3.navigation = {}
		f1_local3.navigation.left = f1_arg2.ownerButton
		f1_arg0:addElement( f1_local3 )
	end
end

