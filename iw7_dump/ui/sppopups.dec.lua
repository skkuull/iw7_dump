local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	LUI.FlowManager.RequestPopupMenu( nil, "FakeLoadingScreenOverlay", true, 0, false, {
		onLoadCompleteFunc = function ()
			Engine.SetDvarBool( "g_specialistMode", f1_arg2 )
			Engine.SetDvarBool( "g_yoloMode", f1_arg3 )
			if f1_arg3 then
				Engine.Exec( "profile_yoloModeSave " .. 1 )
				Engine.Exec( "profile_specialistModeSave " .. 1 )
			elseif f1_arg2 then
				Engine.Exec( "profile_yoloModeSave " .. 0 )
				Engine.Exec( "profile_specialistModeSave " .. 1 )
			else
				Engine.Exec( "profile_yoloModeSave " .. 0 )
				Engine.Exec( "profile_specialistModeSave " .. 0 )
			end
			DebugPrint( "setting player 1 & 2 difficulty to " .. f1_arg0 )
			Engine.SetDvarInt( "g_gameskill", f1_arg0 )
			Engine.Exec( "profile_difficultySave " .. f1_arg0 )
			Engine.Exec( "updategamerprofile" )
			if f1_arg1 then
				f1_arg1()
			end
		end
	} )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	assert( f3_arg1.controllerIndex )
	local f3_local0 = f3_arg1 and f3_arg1.func
	local f3_local1 = f3_arg1 and f3_arg1.disableYolo ~= nil
	local f3_local2 = LUI.DataSourceFromPlayerData.new( CoD.ProgressionBlob.Gold, CoD.PlayMode.SP )
	local f3_local3 = f3_local2.spData
	local f3_local4
	if f3_local3.unlockedRealism:GetValue( f3_arg1.controllerIndex ) ~= 1 then
		f3_local4 = Engine.GetDvarBool( "mis_cheat" )
	else
		f3_local4 = true
	end
	local f3_local5
	if f3_local3.beatRealism:GetValue( f3_arg1.controllerIndex ) ~= 1 then
		f3_local5 = Engine.GetDvarBool( "mis_cheat" )
	else
		f3_local5 = true
	end
	local f3_local6 = {
		title = Engine.Localize( "@MENU_SELECT_DIFFICULTY" ),
		message = "",
		defaultFocusIndex = 2,
		buttons = {}
	}
	table.insert( f3_local6.buttons, {
		label = Engine.Localize( "@MENU_RECRUIT_CAPS" ),
		action = function ( f4_arg0 )
			f0_local0( 0, f3_local0, false, false )
		end
	} )
	table.insert( f3_local6.buttons, {
		label = Engine.Localize( "@MENU_REGULAR_CAPS" ),
		action = function ( f5_arg0 )
			f0_local0( 1, f3_local0, false, false )
		end
	} )
	table.insert( f3_local6.buttons, {
		label = Engine.Localize( "@MENU_HARDENED_CAPS" ),
		action = function ( f6_arg0 )
			f0_local0( 2, f3_local0, false, false )
		end
	} )
	table.insert( f3_local6.buttons, {
		label = Engine.Localize( "@MENU_VETERAN_CAPS" ),
		action = function ( f7_arg0 )
			f0_local0( 3, f3_local0, false, false )
		end
	} )
	local f3_local7 = f3_local4
	local f3_local8
	if f3_local7 then
		f3_local8 = Engine.Localize( "@MENU_SPECIALIST_MODE_CAPS" )
		if not f3_local8 then
		
		else
			local f3_local9
			if f3_local7 then
				f3_local9 = Engine.Localize( "@MENU_SP_SPECIALIST_DESC" )
				if not f3_local9 then
				
				else
					table.insert( f3_local6.buttons, {
						label = f3_local8,
						action = function ( f8_arg0 )
							f0_local0( 2, f3_local0, true, false )
						end,
						disabled = not f3_local7,
						buttonDescription = f3_local9
					} )
					if not f3_local1 then
						local f3_local10 = f3_local5
						local f3_local11
						if f3_local10 then
							f3_local11 = Engine.Localize( "@MENU_YOLO_MODE_CAPS" )
							if not f3_local11 then
							
							else
								local f3_local12
								if f3_local10 then
									f3_local12 = Engine.Localize( "@MENU_SP_YOLO_DESC" )
									if not f3_local12 then
									
									else
										table.insert( f3_local6.buttons, {
											label = f3_local11,
											action = function ( f9_arg0 )
												f0_local0( 2, f3_local0, true, true )
											end,
											disabled = not f3_local10,
											buttonDescription = f3_local12
										} )
									end
								end
								f3_local12 = nil
							end
						end
						f3_local11 = Engine.Localize( "@MENU_YOLO_MODE_TITLE_LOCKED" )
					end
					return MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", f3_local6 )
				end
			end
			f3_local9 = nil
		end
	end
	f3_local8 = Engine.Localize( "@MENU_SPECIALIST_MODE_TITLE_LOCKED" )
end

function OpenFirstLevel( f10_arg0, f10_arg1 )
	LUI.FlowManager.RequestLeaveMenu( f10_arg0 )
	LUI.FlowManager.RequestPopupMenu( f10_arg0, "PopupDifficultySelect", true, f10_arg1.controller, false, {
		func = function ()
			SPFrontEndUtils.MissionBasedProgressionSet( "europa", f10_arg1.controller )
			Engine.Exec( "map europa" )
		end
	} )
end

function overwrite_warning_menu()
	return {
		type = "generic_yesno_popup",
		id = "overwrite_warning_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NEWGAME" ),
			message_text = Engine.Localize( "@MENU_WARNING_CHECKPOINT_RESET" ),
			yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
			yes_action = OpenFirstLevel,
			no_text = Engine.Localize( "@MENU_NO_CAPS" ),
			no_action = MBh.LeaveMenu()
		}
	}
end

function overwrite_warning_level_select_menu()
	return {
		type = "generic_yesno_popup",
		id = "overwrite_warning_level_select_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_MISSION_SELECT" ),
			message_text = Engine.Localize( "@MENU_WARNING_CHECKPOINT_RESET" ),
			yes_text = Engine.Localize( "@MENU_YES_CAPS" ),
			yes_action = function ( f14_arg0, f14_arg1 )
				local f14_local0 = LUI.FlowManager.GetScopedData( "LevelSelectMenu" )
				assert( f14_local0.command )
				LUI.FlowManager.RequestPopupMenu( f14_arg0, "PopupDifficultySelect", true, f14_arg1.controller, false, {
					func = function ()
						SPFrontEndUtils.MissionBasedProgressionSet( f14_local0.command, f14_arg1.controller )
						Engine.PlaySound( CoD.SFX.MouseClick )
						Engine.Exec( "map " .. f14_local0.command )
					end,
					disableYolo = true
				} )
			end
			,
			no_text = Engine.Localize( "@MENU_NO_CAPS" ),
			no_action = MBh.LeaveMenu()
		}
	}
end

function popmenu_autosave_warning()
	return {
		type = "generic_confirmation_popup",
		id = "popmenu_autosave_warning_id",
		properties = {
			popup_title = Engine.Localize( "@MENU_NOTICE" ),
			message_text = Engine.Localize( "@PLATFORM_WARNING_AUTOSAVE" ),
			button_text = Engine.Localize( "@MENU_CONTINUE" ),
			confirmation_action = OpenFirstLevel
		}
	}
end

function FakeLoadingScreenOverlay( menu, controller )
	local self = LUI.UIElement.new()
	self.id = "video_root_id"
	local f17_local1 = LUI.UIImage.new( {
		material = RegisterMaterial( "cinematic" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	} )
	f17_local1.id = "bink"
	self:addElement( f17_local1 )
	self:registerEventHandler( "menu_create", function ( element, event )
		Engine.StopMusic()
		Engine.PlayMenuVideo( "default", VideoPlaybackFlags.LOOP )
	end )
	local f17_local2 = LUI.UITimer.new( nil, {
		interval = 2000,
		event = "fastfiles_loaded_poll"
	} )
	f17_local2.id = "timer"
	self:addElement( f17_local2 )
	local f17_local3 = false
	self:registerEventHandler( "fastfiles_loaded_poll", function ( element, event )
		if Engine.IsFastFileGameWorkComplete() and not f17_local3 then
			f17_local3 = true
			if controller.onLoadCompleteFunc then
				controller.onLoadCompleteFunc()
			end
			f17_local2:Stop()
		end
	end )
	self:processEvent( {
		name = "fastfiles_loaded_poll"
	} )
	return self
end

function FakeLoadingScreenOverlayPop()
	Engine.StopMenuVideo()
end

function PopupSpecialistUnlock()
	local f21_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_SP_UNLOCK_NEW_MODE" ),
		message = Engine.Localize( "MENU_SP_UNLOCK_NEW_MODE_REALISM" ),
		label = Engine.Localize( "MENU_OK" )
	} )
	f21_local0.id = "popup_specialist_unlock"
	return f21_local0
end

function PopupYoloUnlock()
	local f22_local0 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MENU_SP_UNLOCK_NEW_MODE" ),
		message = Engine.Localize( "MENU_SP_UNLOCK_NEW_MODE_YOLO" ),
		label = Engine.Localize( "MENU_OK" )
	} )
	f22_local0.id = "popup_yolo_unlock"
	return f22_local0
end

MenuBuilder.registerType( "PopupDifficultySelect", f0_local1 )
MenuBuilder.registerType( "PopupSpecialistUnlock", PopupSpecialistUnlock )
MenuBuilder.registerType( "PopupYoloUnlock", PopupYoloUnlock )
MenuBuilder.registerDef( "overwrite_warning_menu", overwrite_warning_menu )
MenuBuilder.registerDef( "overwrite_warning_level_select_menu", overwrite_warning_level_select_menu )
MenuBuilder.registerDef( "popmenu_autosave_warning", popmenu_autosave_warning )
MenuBuilder.registerType( "FakeLoadingScreenOverlay", FakeLoadingScreenOverlay )
LUI.FlowManager.RegisterStackPopBehaviour( "FakeLoadingScreenOverlay", FakeLoadingScreenOverlayPop )
LockTable( _M )
