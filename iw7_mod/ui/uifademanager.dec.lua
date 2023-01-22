LUI.UIFadeManager = LUI.Class( LUI.UIElement )
LUI.UIFadeManager.init = function ( f1_arg0, f1_arg1 )
	LUI.UIElement.init( f1_arg0 )
	f1_arg0.id = "UIFadeManager"
	f1_arg0._controllerIndex = f1_arg1 or 0
end

LUI.UIFadeManager.ShouldBeVisible = function ( f2_arg0 )
	local f2_local0 = Engine.InFrontend()
	if f2_local0 then
		f2_local0 = DataSources.frontEnd.lobby.isUIFadingOut:GetValue( f2_arg0._controllerIndex )
	end
	return Engine.IsMultiplayer() and f2_local1 and Engine.InLobby()
end

LUI.UIFadeManager.InitLayer = function ( f3_arg0 )
	f3_arg0.fadeWidget = MenuBuilder.BuildRegisteredType( "ScreenFade", {
		controllerIndex = f3_arg0._controllerIndex,
		fadeUI = true
	} )
	f3_arg0:addElement( f3_arg0.fadeWidget )
end

LUI.UIFadeManager.ClearLayer = function ( f4_arg0, f4_arg1 )
	f4_arg0:closeChildren()
end

