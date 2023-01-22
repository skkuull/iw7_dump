local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	OSK.OpenScreenKeyboard( f1_arg0, Engine.Localize( "MP_EMBLEM_EDITOR_ENTER_NAME" ), f1_arg1.emblemName, 16, false, true, false, function ( f2_arg0, f2_arg1 )
		if f2_arg1 ~= nil and f2_arg1 ~= "" then
			EmblemEditor.RenameAndSaveEmblem( f2_arg0, f1_arg1.slotIndex, f2_arg1 )
			LUI.FlowManager.RequestLeaveMenuByName( "EmblemSelectOptionsPopup" )
		end
	end, CoD.KeyboardInputTypes.Normal )
end

f0_local1 = function ( f3_arg0, f3_arg1 )
	EmblemEditor.DeleteEmblem( f3_arg0, f3_arg1 )
	LUI.FlowManager.RequestLeaveMenuByName( "EmblemSelectOptionsPopup" )
end

f0_local2 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controllerIndex
	local f4_local1 = MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		width = 400,
		message = f4_arg1.message,
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true,
		yesAction = f4_arg1.yesAction
	} )
	f4_local1.id = "DeleteEmblemPopup"
	return f4_local1
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg1.controllerIndex
	local f5_local1 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 400,
		message = Engine.Localize( "MP_EMBLEM_EDITOR_LAYERS_EMPTY_MESSAGE" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f5_local1.id = "EmblemEmptyLayersPopup"
	return f5_local1
end

local f0_local4 = function ( f6_arg0, f6_arg1 )
	local f6_local0 = f6_arg1.controllerIndex
	local f6_local1 = f6_arg1.slotIndex
	local f6_local2 = MenuBuilder.BuildRegisteredType( "PopupMessageAndButtons", {
		title = Engine.Localize( "MP_EMBLEM_EDITOR_OPTIONS_MENU_TITLE" ),
		width = 400,
		message = "",
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = false,
		buttons = {
			{
				label = Engine.Localize( "MP_EMBLEM_EDITOR_RENAME_EMBLEM" ),
				action = function ( f7_arg0, f7_arg1 )
					f0_local0( f7_arg1, f6_arg1 )
				end
			},
			{
				label = Engine.Localize( "MP_EMBLEM_EDITOR_DELETE_EMBLEM" ),
				action = function ( f8_arg0, f8_arg1 )
					LUI.FlowManager.RequestPopupMenu( f8_arg0, "DeleteEmblemPopup", true, f8_arg1, false, {
						yesAction = function ( f9_arg0, f9_arg1 )
							f0_local1( f8_arg1, f6_local1 )
						end,
						message = Engine.Localize( "MP_EMBLEM_EDITOR_CONFIRM_DELETE_EMBLEM_MESSAGE" )
					} )
				end
			}
		}
	} )
	f6_local2.id = "EmblemSelectOptionsPopup"
	return f6_local2
end

local f0_local5 = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.controllerIndex
	local f10_local1 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = Engine.Localize( "MP_EMBLEM_EDITOR_SLOT_LIMIT_REACHED_TITLE" ),
		width = 400,
		message = Engine.Localize( "MP_EMBLEM_EDITOR_SLOT_LIMIT_REACHED_MESSAGE" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f10_local1.id = "EmblemSelectOptionsPopup"
	return f10_local1
end

local f0_local6 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1.controllerIndex
	local f11_local1 = MenuBuilder.BuildRegisteredType( "PopupOK", {
		width = 400,
		message = Engine.Localize( "MP_EMBLEM_EDITOR_EMBLEM_EQUIPPED_MESSAGE" ),
		defaultFocusIndex = 1,
		cancelClosesPopup = true,
		buttonsClosePopup = true
	} )
	f11_local1.id = "EmblemEquippedPopup"
	return f11_local1
end

MenuBuilder.registerType( "DeleteEmblemPopup", f0_local2 )
MenuBuilder.registerType( "EmblemEmptyLayersPopup", f0_local3 )
MenuBuilder.registerType( "EmblemEquippedPopup", f0_local6 )
MenuBuilder.registerType( "EmblemSelectOptionsPopup", f0_local4 )
MenuBuilder.registerType( "EmblemSlotLimitReachedPopup", f0_local5 )
