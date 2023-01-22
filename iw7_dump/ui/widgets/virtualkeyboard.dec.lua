local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
function ExitVirtualKeyboard( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
	if f1_local0.exiting then
		return 
	end
	f1_local0.exiting = true
	f1_arg0:dispatchEventToRoot( {
		name = "exit_virtual_keyboard",
		immediate = true
	} )
	if OSK.TriggerVirtualKeyboardCallback then
		local f1_local1 = OSK.TriggerVirtualKeyboardCallback
		local f1_local2 = f1_arg1.controller
		local f1_local3 = f1_arg2
		local f1_local4
		if not f1_arg2 then
			f1_local4 = f1_local0.input
			if not f1_local4 then
			
			else
				f1_local1( f1_local2, f1_local3, f1_local4 )
			end
		end
		f1_local4 = ""
	end
end

function input_popup( f2_arg0, f2_arg1 )
	local f2_local0 = LUI.FlowManager.GetScopedData( "virtual_keyboard" )
	local f2_local1 = f2_arg1.keyboardType
	if not f2_local1 then
		f2_local1 = CoD.KeyboardInputTypes.Normal
	end
	local f2_local2
	if f2_local1 == CoD.KeyboardInputTypes.Email then
		f2_local2 = 1000
		if not f2_local2 then
		
		else
			local f2_local3 = f2_local1 == CoD.KeyboardInputTypes.Password
			local f2_local4 = f2_arg1.use_auto_align or false
			local f2_local5 = {
				controllerIndex = f2_local0.controllerIndex,
				title = f2_arg1.title,
				width = f2_local2,
				listContent = {}
			}
			table.insert( f2_local5.listContent, MenuBuilder.buildItems( {
				type = "generic_input_field",
				id = "not_so_virtual_input",
				requireFocusType = FocusType.MouseOver,
				properties = {
					keyboard_type = f2_local1,
					password_field = f2_local3,
					use_auto_align = f2_local4,
					max_length = f2_local0.maxLength,
					help_value = f2_local0.input,
					field_edited_func = function ( f3_arg0, f3_arg1 )
						local f3_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
						f3_local0.input = f3_arg1.text or ""
						if f3_local0.exiting then
							return 
						else
							f3_arg1.controller = f3_local0.exclusiveController
							ExitVirtualKeyboard( f3_arg0, f3_arg1, f3_arg1.cancelled )
							LUI.FlowManager.RequestLeaveMenu( f3_arg0 )
						end
					end,
					additional_handlers = {
						menu_create = MBh.EmitEvent( {
							name = "button_action",
							mouse = true
						} ),
						exit_virtual_keyboard = function ( f4_arg0, f4_arg1 )
							f4_arg0:processEvent( {
								name = "finish_editing"
							} )
							f4_arg0.properties.active = false
						end
					}
				}
			} ) )
			local f2_local6 = MenuBuilder.BuildRegisteredType( "PopupButton", {
				controllerIndex = f2_local0.controllerIndex
			} )
			f2_local6:SetLeftAnchor( 0 )
			f2_local6:SetRightAnchor( 0 )
			f2_local6:SetLeft( 0 )
			f2_local6:SetRight( 0 )
			f2_local6.id = "okButton"
			assert( f2_local6.SetText )
			f2_local6:SetText( Engine.Localize( "MENU_OK" ) )
			f2_local6:addEventHandler( "button_action", function ( f5_arg0, f5_arg1 )
				ExitVirtualKeyboard( f5_arg0, f5_arg1, false )
				LUI.FlowManager.RequestLeaveMenu( f5_arg0 )
			end )
			table.insert( f2_local5.listContent, f2_local6 )
			local f2_local7 = MenuBuilder.BuildRegisteredType( "PopupButton", {
				controllerIndex = f2_local0.controllerIndex
			} )
			f2_local7:SetLeftAnchor( 0 )
			f2_local7:SetRightAnchor( 0 )
			f2_local7:SetLeft( 0 )
			f2_local7:SetRight( 0 )
			f2_local7.id = "cancelButton"
			assert( f2_local7.SetText )
			f2_local7:SetText( Engine.Localize( "MENU_CANCEL" ) )
			f2_local7:addEventHandler( "button_action", function ( f6_arg0, f6_arg1 )
				ExitVirtualKeyboard( f6_arg0, f6_arg1, true )
				LUI.FlowManager.RequestLeaveMenu( f6_arg0 )
			end )
			table.insert( f2_local5.listContent, f2_local7 )
			local f2_local8 = MenuBuilder.BuildRegisteredType( "PopupList", f2_local5 )
			f2_local8:registerEventHandler( "popup_back", function ( element, event )
				ExitVirtualKeyboard( element, event, true )
			end )
			f2_local8:dispatchEventToRoot( {
				name = "virtual_keyboard_popup_active",
				immediate = true
			} )
			return f2_local8
		end
	end
	f2_local2 = nil
end

function virtual_keyboard( f8_arg0, f8_arg1 )
	local f8_local0 = LUI.FlowManager.GetScopedData( "virtual_keyboard" )
	f8_local0.input = f8_arg1.defaultText or ""
	f8_local0.maxLength = f8_arg1.maxLength or 12
	return input_popup( f8_arg0, f8_arg1 )
end

MenuBuilder.registerType( "virtual_keyboard", virtual_keyboard )
LockTable( _M )
