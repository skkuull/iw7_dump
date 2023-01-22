function menu_xboxlive_partyended()
	local f1_local0 = {
		title = Engine.Localize( "@MENU_NOTICE" ),
		message = Engine.Localize( Engine.GetDvarString( "partyend_reason" ) )
	}
	local f1_local1 = Engine.GetLastErrorCode()
	if string.len( f1_local1 ) > 0 then
		f1_local0.statusMessage = Engine.Localize( "MENU_COM_ERROR_STRING_WITH_ERROR_CODE", f1_local1 )
	end
	Engine.ClearLastErrorCode()
	f1_local0.action = function ()
		Engine.ClearError()
	end
	
	local f1_local2 = MenuBuilder.BuildRegisteredType( "PopupOK", f1_local0 )
	f1_local2.id = "menu_xboxlive_partyended"
	return f1_local2
end

MenuBuilder.registerType( "menu_xboxlive_partyended", menu_xboxlive_partyended )
