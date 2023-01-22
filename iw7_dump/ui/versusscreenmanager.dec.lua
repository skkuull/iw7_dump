LUI.VersusScreenManager = LUI.Class( LUI.UIElement )
LUI.VersusScreenManager.init = function ( f1_arg0 )
	LUI.UIElement.init( f1_arg0, {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true
	} )
	f1_arg0.id = "VersusScreenManager"
end

LUI.VersusScreenManager.ShouldBeVisible = function ( f2_arg0 )
	local f2_local0 = Engine.IsMultiplayer()
	if f2_local0 then
		if not Game.IsInitialized() then
			f2_local0 = not LUI.PostGameManager.IsPostGame()
		else
			f2_local0 = false
		end
	end
	return f2_local0
end

LUI.VersusScreenManager.InitLayer = function ( f3_arg0 )
	if CONDITIONS.IsSplitscreen() then
		Engine.MakeRootFullscreen()
	end
	f3_arg0:addElement( MenuBuilder.BuildRegisteredType( "Versus" ) )
end

LUI.VersusScreenManager.ClearLayer = function ( f4_arg0, f4_arg1 )
	if CONDITIONS.IsSplitscreen() then
		Engine.MakeRootSplitscreen()
	end
	Engine.NotifyServer( "versus_done", 1 )
	f4_arg0:closeChildren()
end

LUI.VersusScreenManager.ProcessInputEvent = function ( f5_arg0, f5_arg1 )
	local f5_local0 = false
	local f5_local1 = f5_arg0.m_eventHandlers[f5_arg1.name]
	if f5_local1 then
		f5_local0 = f5_local1( f5_arg0, f5_arg1 )
	end
	if (f5_arg1.qualifier == "dpad" or f5_arg1.button == "primary" or f5_arg1.button == "start") and not f5_local0 then
		f5_local0 = LUI.VersusScreenManager.super.processEvent( f5_arg0, f5_arg1 )
	end
	return f5_local0
end

LUI.VersusScreenManager.processEvent = function ( f6_arg0, f6_arg1 )
	if f6_arg1.name == "gamepad_button" and not f6_arg1.down then
		return 
	elseif IsInputEvent( f6_arg1.name ) then
		return f6_arg0:ProcessInputEvent( f6_arg1 )
	else
		return LUI.VersusScreenManager.super.processEvent( f6_arg0, f6_arg1 )
	end
end

