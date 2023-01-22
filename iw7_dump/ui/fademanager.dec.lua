LUI.FadeManager = LUI.Class( LUI.UIElement )
LUI.FadeManager.init = function ( f1_arg0, f1_arg1 )
	LUI.UIElement.init( f1_arg0 )
	f1_arg0.id = "FadeManager"
	f1_arg0._controllerIndex = f1_arg1 or 0
end

LUI.FadeManager.ShouldBeVisible = function ( f2_arg0 )
	if Engine.InFrontend() then
		return Engine.IsFrontEndLevelInitialized()
	else
		return Game.GetOmnvar( "ui_post_game_fade" ) > 0
	end
end

LUI.FadeManager.InitLayer = function ( f3_arg0 )
	f3_arg0.fadeWidget = MenuBuilder.BuildRegisteredType( "ScreenFade", {
		controllerIndex = f3_arg0._controllerIndex
	} )
	f3_arg0:addElement( f3_arg0.fadeWidget )
end

LUI.FadeManager.ClearLayer = function ( f4_arg0, f4_arg1 )
	f4_arg0:closeChildren()
end

