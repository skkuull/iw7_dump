LUI.HostMigrationManager = LUI.Class( LUI.UIElement )
LUI.HostMigrationManager.init = function ( f1_arg0, f1_arg1 )
	if not f1_arg1 then
		f1_arg1 = {
			left = 0,
			right = 0,
			top = 0,
			bottom = 0,
			leftAnchor = true,
			rightAnchor = true,
			topAnchor = true,
			bottomAnchor = true
		}
	end
	LUI.UIElement.init( f1_arg0, f1_arg1 )
	f1_arg0.id = "HostMigrationManager"
end

LUI.HostMigrationManager.ShouldBeVisible = function ( f2_arg0 )
	return Engine.IsMultiplayer() and Game.IsHostMigrating()
end

LUI.HostMigrationManager.InitLayer = function ( f3_arg0 )
	if not f3_arg0.display then
		f3_arg0.display = MenuBuilder.BuildRegisteredType( "HostMigration" )
		f3_arg0:addElement( f3_arg0.display )
	end
end

LUI.HostMigrationManager.ClearLayer = function ( f4_arg0, f4_arg1 )
	if f4_arg0.display then
		f4_arg0.display:close()
		f4_arg0.display = nil
	end
end

