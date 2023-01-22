LUI.UIRoot = LUI.Class( LUI.UIElement )
local f0_local0 = {
	POST_GAME = 0,
	HOST_MIGRATION = 1
}
LUI.UIRoot.TryAddMouseCursor = function ( f1_arg0 )
	if Engine.UsesMouseCursor() and not f1_arg0.cursor then
		f1_arg0.cursor = LUI.UIMouseCursor.new( {
			material = RegisterMaterial( "ui_cursor" )
		} )
		f1_arg0:addElement( f1_arg0.cursor )
	end
end

LUI.UIRoot.RemoveMouseCursor = function ( f2_arg0 )
	if f2_arg0.cursor then
		f2_arg0.cursor:close()
		f2_arg0.cursor = nil
	end
end

LUI.UIRoot.BlockButtonInput = function ( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 then
		f3_arg0.m_blockButtonInput = true
	else
		f3_arg0.m_blockButtonInput = false
	end
end

LUI.UIRoot.IsButtonInputBlocked = function ( f4_arg0 )
	return f4_arg0.m_blockButtonInput
end

LUI.UIRoot.PixelsToUnits = function ( f5_arg0, f5_arg1, f5_arg2 )
	return f5_arg0:RootPixelsToUnits( f5_arg1, f5_arg2 )
end

local f0_local1 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = false
	if f6_arg0.flowManager and not f6_arg0.flowManager:IsStackEmpty() then
		f6_local0 = true
	elseif f6_arg0.binkSkipPromptLayer and f6_arg0.binkSkipPromptLayer:ShouldBeVisible() then
		f6_local0 = true
	elseif f6_arg0.versusScreenManager and f6_arg0.versusScreenManager:ShouldBeVisible() then
		f6_local0 = true
	elseif f6_arg0.scoreboardLayer and f6_arg0.scoreboardLayer:ShouldBeVisible() and f6_arg0.scoreboardLayer:TrapsInput( f6_arg1 ) then
		f6_local0 = true
	elseif f6_arg0.codcasterLayer and f6_arg0.codcasterLayer.ShouldBeVisible() and f6_arg0.codcasterLayer:TrapsInput( f6_arg1 ) then
		f6_local0 = true
	end
	if f6_local0 then
		table.insert( f6_arg0.inputQueue, f6_arg1 )
		if #f6_arg0.inputQueue > 4 then
			table.remove( f6_arg0.inputQueue, 1 )
		end
	end
	return f6_local0
end

LUI.UIRoot.QueueMouseInput = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4, f7_arg5, f7_arg6, f7_arg7 )
	return f0_local1( f7_arg0, {
		name = f7_arg3,
		rootName = f7_arg2,
		controller = f7_arg1,
		button = f7_arg4,
		down = f7_arg5,
		x = f7_arg6,
		y = f7_arg7
	} )
end

LUI.UIRoot.QueueInput = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	return f0_local1( f8_arg0, {
		name = "gamepad_button",
		controller = f8_arg1,
		button = f8_arg3,
		qualifier = f8_arg4,
		down = f8_arg2
	} )
end

LUI.UIRoot.ProcessQueue = function ( f9_arg0, f9_arg1 )
	local f9_local0 = #f9_arg1
	if 8 < f9_local0 then
		DebugPrint( "LUI WARNING: Processing " .. f9_local0 .. " global events in one frame." )
	end
	local f9_local1 = nil
	for f9_local2 = 1, f9_local0, 1 do
		local f9_local5 = f9_local2
		f9_local1 = f9_arg1[1]
		table.remove( f9_arg1, 1 )
		LUI.UIRoot.ProcessEventNow( f9_arg0, f9_local1 )
	end
end

LUI.UIRoot.ProcessEvents = function ( f10_arg0 )
	LUI.UITimer.DispatchEventsFromQueue( f10_arg0 )
	f10_arg0:ProcessQueue( f10_arg0.eventQueue )
end

LUI.UIRoot.ProcessInputs = function ( f11_arg0 )
	f11_arg0:ProcessQueue( f11_arg0.inputQueue )
end

LUI.UIRoot.ProcessEvent = function ( f12_arg0, f12_arg1 )
	if f12_arg1.immediate == true then
		return LUI.UIRoot.ProcessEventNow( f12_arg0, f12_arg1 )
	else
		table.insert( f12_arg0.eventQueue, f12_arg1 )
		return false
	end
end

LUI.UIRoot.ProcessEventNow = function ( f13_arg0, f13_arg1 )
	if not f13_arg0.debugPrintIgnoreEvents[f13_arg1.name] and Engine.GetDvarBool( "lui_print_events" ) then
		DebugPrint( "Processing event " .. f13_arg1.name )
		if f13_arg1.name == "gamepad_button" then
			DebugPrint( "button " .. f13_arg1.button )
		end
	end
	if f13_arg0.m_blockButtonInput and (f13_arg1.name == "gamepad_button" or f13_arg1.name == "mouseup") then
		DebugPrint( "Blocking Button input for " .. f13_arg1.button .. "  because m_ignoreButtonInput is true" )
		return false
	elseif f13_arg0.cursor and IsMouseEvent( f13_arg1.name ) then
		f13_arg1.root = f13_arg0
		f13_arg0.cursor:processEvent( f13_arg1 )
	end
	if f13_arg1.target and f13_arg1.target ~= f13_arg0 then
		return f13_arg1.target:processEvent( f13_arg1 )
	elseif IsInputEvent( f13_arg1.name ) then
		if AnyActiveMenusInStack( f13_arg0 ) then
			return f13_arg0.flowManager:processEvent( f13_arg1 )
		elseif f13_arg0.binkSkipPromptLayer and f13_arg0.binkSkipPromptLayer:ShouldBeVisible() then
			return f13_arg0.binkSkipPromptLayer:processEvent( f13_arg1 )
		elseif f13_arg0.versusScreenManager and f13_arg0.versusScreenManager:ShouldBeVisible() then
			return f13_arg0.versusScreenManager:processEvent( f13_arg1 )
		elseif f13_arg0.codcasterLayer and f13_arg0.codcasterLayer.ShouldBeVisible() then
			if not f13_arg0.codcasterLayer:processEvent( f13_arg1 ) and f13_arg0.scoreboardLayer then
				return f13_arg0.scoreboardLayer:processEvent( f13_arg1 )
			end
		elseif f13_arg0.scoreboardLayer then
			return f13_arg0.scoreboardLayer:processEvent( f13_arg1 )
		end
	end
	return LUI.UIElement.processEvent( f13_arg0, f13_arg1 )
end

LUI.UIRoot.AddLayer = function ( f14_arg0, f14_arg1, f14_arg2 )
	assert( f14_arg1.id )
	assert( f14_arg1.InitLayer )
	assert( f14_arg1.ShouldBeVisible )
	assert( f14_arg1.ClearLayer )
	table.insert( f14_arg0.layers, f14_arg1 )
	f14_arg1.options = f14_arg2 or {}
	if f14_arg1.options.exclusive then
		assert( f14_arg1.options.priority )
	end
	f14_arg1.layerEnabled = false
	f14_arg0:addElement( f14_arg1 )
	return f14_arg1
end

LUI.UIRoot.UpdateLayers = function ( f15_arg0 )
	local f15_local0 = nil
	for f15_local4, f15_local5 in pairs( f15_arg0.layers ) do
		if f15_local5:ShouldBeVisible() and f15_local5.options.exclusive and (f15_local0 == nil or f15_local0.options.priority < f15_local5.options.priority) then
			f15_local0 = f15_local5
		end
	end
	for f15_local4, f15_local5 in pairs( f15_arg0.layers ) do
		local f15_local6 = f15_local5:ShouldBeVisible()
		if f15_local6 then
			if f15_local0 ~= nil and f15_local0 ~= f15_local5 then
				f15_local6 = false
			else
				f15_local6 = true
			end
		end
		if f15_local5.layerEnabled ~= f15_local6 then
			if f15_local6 then
				f15_local5:InitLayer()
			else
				f15_local5:ClearLayer()
			end
			f15_local5.layerEnabled = f15_local6
		end
		if f15_local5.layerEnabled and f15_local5.Frame then
			f15_local5:Frame()
		end
	end
end

LUI.UIRoot.HandleErrors = function ( f16_arg0 )
	local f16_local0 = Engine.GetDvarString( "com_errorMessage" )
	if f16_local0 and #f16_local0 > 0 then
		if CONDITIONS.IsTrialLicense() and Engine.GetDvarBool( "showUpsellDialog" ) then
			LUI.FlowManager.RequestPopupMenu( nil, "ShowUpsellDialogPopup", true, f16_arg0._controllerIndex, false, {
				controllerIndex = f16_arg0._controllerIndex
			} )
		elseif not LUI.FlowManager.IsInStack( "error_popmenu" ) then
			LUI.FlowManager.RequestPopupMenu( nil, "error_popmenu" )
		end
	end
	local f16_local1 = false
	local f16_local2 = LUI.FlowManager.IsInStack( "controllerremoved_popmenu" )
	if f16_arg0._controllerIndex == nil then
		for f16_local3 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.IsControllerMissing( f16_local3 ) then
				f16_local1 = true
			end
		end
	else
		f16_local1 = Engine.IsControllerMissing( f16_arg0._controllerIndex )
	end
	if f16_local1 and not f16_local2 then
		LUI.FlowManager.RequestPopupMenu( nil, "controllerremoved_popmenu", false, false, false, {}, nil, true )
	elseif f16_local2 and not f16_local1 then
		LUI.FlowManager.RequestLeaveMenuByName( "controllerremoved_popmenu", true )
	end
	local f16_local3 = Engine.IsWaitingForTransientFiles()
	local f16_local4 = LUI.FlowManager.IsInStack( "WaitingForTransientsPopMenu" )
	if f16_local3 and not f16_local4 then
		LUI.FlowManager.RequestPopupMenu( nil, "WaitingForTransientsPopMenu", false, false, false, {}, nil, true )
	elseif f16_local4 and not f16_local3 then
		LUI.FlowManager.RequestLeaveMenuByName( "WaitingForTransientsPopMenu", true )
	end
end

LUI.UIRoot.CheckForControllerConnected = function ( f17_arg0 )
	if Engine.GetDvarBool( "ui_autodetectGamepad" ) and Engine.GetDvarBool( "ui_autodetectGamepadDone" ) then
		if LUI.FlowManager.IsInStack( "controller_initial_popup" ) or Engine.IsGamepadEnabled() == 1 then
			return 
		end
		local f17_local0 = false
		local f17_local1 = LUI.FlowManager.IsInStack( "controller_connected_popup" )
		if f17_arg0._controllerIndex == nil then
			for f17_local2 = 0, Engine.GetMaxControllerCount() - 1, 1 do
				if Engine.ShowControllerConnectedPopup( f17_local2 ) then
					f17_local0 = true
				end
			end
		else
			f17_local0 = Engine.ShowControllerConnectedPopup( f17_arg0._controllerIndex )
		end
		if f17_local0 and not f17_local1 then
			LUI.FlowManager.RequestPopupMenu( nil, "controller_connected_popup", false, false, false, {}, nil, true )
		elseif f17_local1 and not f17_local0 then
			LUI.FlowManager.RequestLeaveMenuByName( "controller_connected_popup", true )
		end
	end
end

LUI.UIRoot.Frame = function ( f18_arg0, f18_arg1 )
	if not Engine.InFrontend() and Game.IsInitialized() then
		InitInGameDataSources()
	end
	f18_arg0:ProcessEvents()
	f18_arg0:UpdateLayers()
	f18_arg0:ProcessInputs()
	f18_arg0:HandleErrors()
	if Engine.IsPC() then
		f18_arg0:CheckForControllerConnected()
	end
	return true
end

LUI.UIRoot.UpdateGameMode = function ( f19_arg0, f19_arg1 )
	CoD.UpdateGameMode( f19_arg1.currentGameMode, f19_arg1.previousGameMode )
	return true
end

LUI.UIRoot.init = function ( f20_arg0, f20_arg1, f20_arg2 )
	LUI.UIElement.init( f20_arg0, {
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false,
		left = 0,
		top = 0,
		right = 0,
		bottom = 0
	} )
	f20_arg0.id = "LUIRoot"
	f20_arg0.isaroot = true
	f20_arg0._controllerIndex = f20_arg1
	f20_arg0.name = f20_arg2
	f20_arg0.layers = {}
	f20_arg0.eventQueue = {}
	f20_arg0.inputQueue = {}
	f20_arg0.timerGroupQueues = {}
	f20_arg0.debugPrintIgnoreEvents = {
		process_events = true,
		gamepad_sticks = true,
		mousemove = true
	}
	LUI.roots[f20_arg2] = f20_arg0
	if LUI.primaryRoot == nil then
		LUI.primaryRoot = f20_arg0
	end
	f20_arg0.processEvent = LUI.UIRoot.ProcessEvent
	f20_arg0:registerEventHandler( "run_frame", LUI.UIRoot.Frame )
	f20_arg0:registerEventHandler( "update_game_mode", LUI.UIRoot.UpdateGameMode )
	f20_arg0.eventCatcher = EventCatcher.new()
	f20_arg0.eventCatcher:setupRoot( f20_arg0 )
	if Engine.InFrontend() then
		f20_arg0.fadeManager = f20_arg0:AddLayer( LUI.FadeManager.new( f20_arg0._controllerIndex ) )
	else
		f20_arg0.inWorldManager = f20_arg0:AddLayer( LUI.InWorldManager.new( f20_arg0._controllerIndex ) )
		f20_arg0.hudManager = f20_arg0:AddLayer( LUI.HudManager.new( nil, {
			root = f20_arg0
		} ) )
		if Engine.IsMultiplayer() then
			if Engine.IsCoreMode() then
				f20_arg0.versusScreenManager = f20_arg0:AddLayer( LUI.VersusScreenManager.new(), {
					exclusive = false
				} )
				f20_arg0.codcasterLayer = f20_arg0:AddLayer( LUI.CodcasterLayer.new( f20_arg0._controllerIndex ), {
					exclusive = false
				} )
				if not GameX.IsSplitscreen() then
					f20_arg0.rigBootup = f20_arg0:AddLayer( LUI.RigBootup.new( f20_arg0._controllerIndex ), {
						exclusive = false
					} )
				end
			end
			f20_arg0.postGameManager = f20_arg0:AddLayer( LUI.PostGameManager.new( f20_arg0._controllerIndex ), {
				priority = f0_local0.POST_GAME
			} )
			if Engine.IsCoreMode() then
				f20_arg0.fadeManager = f20_arg0:AddLayer( LUI.FadeManager.new( f20_arg0._controllerIndex ) )
			end
			f20_arg0.scoreboardLayer = f20_arg0:AddLayer( LUI.ScoreboardLayer.new( f20_arg0._controllerIndex ), {
				exclusive = false
			} )
			f20_arg0.hostMigrationManager = f20_arg0:AddLayer( LUI.HostMigrationManager.new(), {
				exclusive = true,
				priority = f0_local0.HOST_MIGRATION
			} )
		end
		if Engine.IsSingleplayer() then
			f20_arg0.binkSkipPromptLayer = f20_arg0:AddLayer( LUI.BinkSkipPromptLayer.new( f20_arg0._controllerIndex ), {
				exclusive = false
			} )
		end
	end
	f20_arg0.flowManager = f20_arg0:AddLayer( LUI.FlowManager.new( nil, {
		root = f20_arg0
	} ) )
	if Engine.IsSingleplayer() and not Engine.InFrontend() then
		f20_arg0.subtitlesLayer = f20_arg0:AddLayer( LUI.SubtitlesLayer.new( f20_arg0._controllerIndex ), {
			exclusive = false
		} )
	end
	if Engine.IsPS4() and not Engine.InFrontend() then
		f20_arg0.ps4LightbarManager = f20_arg0:AddLayer( LUI.PS4LightbarManager.new( f20_arg0._controllerIndex ) )
	end
	if Engine.InFrontend() and Engine.IsMultiplayer() then
		f20_arg0.uiFadeManager = f20_arg0:AddLayer( LUI.UIFadeManager.new( f20_arg0._controllerIndex ) )
	end
	if Engine.IsAliensMode() and not Engine.InFrontend() then
		f20_arg0.fullscreenBink = f20_arg0:AddLayer( LUI.FullscreenBinkLayer.new( f20_arg0._controllerIndex ) )
		if not GameX.IsSplitscreen() and Engine.GetDvarString( "ui_mapname" ) == "cp_town" then
			f20_arg0.townIntro = f20_arg0:AddLayer( LUI.TownIntro.new( f20_arg0._controllerIndex ), {
				exclusive = false
			} )
		end
	end
	local f20_local0 = MenuBuilder.BuildRegisteredType( "BuildNumberText" )
	if Engine.InFrontend() then
		f20_arg0:addElement( f20_local0 )
	elseif Engine.IsCoreMode() and not IsSystemLink() and not Engine.GetDvarBool( "killswitch_matchID" ) then
		f20_arg0:addElement( MenuBuilder.BuildRegisteredType( "MatchID" ) )
	end
	DataSources.debug.buildAndServerTextVisible = LUI.DataSourceInGlobalModel.new( "cg.debug.buildAndServerTextVisible" )
	f20_arg0:SubscribeToModel( DataSources.debug.buildAndServerTextVisible:GetModel( 0 ), function ( f21_arg0 )
		if DataModel.GetModelValue( f21_arg0 ) then
			if Engine.InFrontend() then
				f20_local0:animateToState( "visible" )
			end
		elseif Engine.InFrontend() then
			f20_local0:animateToState( "default" )
		end
	end )
	if not Engine.IsConsoleGame() then
		local self = LUI.UIElement.new()
		self:SetAlignment( LUI.Alignment.Right )
		self:SetRGBFromTable( SWATCHES.genericButton.highlight, 0 )
		self:SetAnchorsAndPosition( 1, 0, 0, 1, _1080p * -510, _1080p * -10, _1080p * 10, _1080p * 48 )
		self:SetFont( FONTS.GetFont( FONTS.MainMedium.File ) )
		self:SetFontSize( 38 * _1080p )
		self:SetWordWrap( false )
		self:SetupFPSCounter()
		self.id = "FPSCounter"
		f20_arg0:addElement( self )
	end
	Main()
end

LUI.UIRoot.GetControllerIndex = function ( f22_arg0 )
	return f22_arg0._controllerIndex
end

LUI.UIRoot.GetRootFromName = function ( f23_arg0 )
	local f23_local0 = LUI.roots[f23_arg0]
	assert( f23_local0 )
	return f23_local0
end

LUI.UIRoot.GetRootForControllerIndex = function ( f24_arg0 )
	for f24_local3, f24_local4 in pairs( LUI.roots ) do
		if f24_local4._controllerIndex == f24_arg0 then
			return f24_local4
		end
	end
	assert( LUI.primaryRoot )
	return LUI.primaryRoot
end

