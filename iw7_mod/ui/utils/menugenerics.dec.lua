local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
if Engine.InFrontend() or Engine.IsSingleplayer() then
	function InputFieldOpensVirtualKeyboard( f1_arg0 )
		return Engine.IsConsoleGame() or f1_arg0
	end
	
	function InputFieldAction( f2_arg0, f2_arg1 )
		local f2_local0 = Engine.GetDvarString( f2_arg0.properties.dvar_hook )
		local f2_local1
		if not Engine.IsConsoleGame() and not f2_arg1.mouse then
			f2_local1 = not f2_arg1.keyboard
		else
			f2_local1 = false
		end
		f2_arg0.properties.isPCGamepad = f2_local1
		if InputFieldOpensVirtualKeyboard( f2_local1 ) then
			f2_arg0.properties.active = true
			local f2_local2 = OSK.OpenScreenKeyboard
			local f2_local3 = f2_arg1.controller
			if not f2_local3 then
				f2_local3 = Engine.GetFirstActiveController()
			end
			local f2_local4 = f2_arg0.properties.field_name
			if f2_local0 then
				local f2_local5 = f2_local0
			end
			f2_local2( f2_local3, f2_local4, f2_local5 or "", f2_arg0.properties.max_length, f2_arg0.properties.verify_string, f2_arg0.properties.filter_profanity, f2_arg0.properties.allow_empty, function ( f3_arg0, f3_arg1, f3_arg2 )
				DebugPrint( "Callback called on generic keyboard" )
				if InputFieldOpensVirtualKeyboard( f2_arg0.properties.isPCGamepad ) and f2_arg0.properties.active then
					local f3_local0 = {
						controller = f3_arg0
					}
					f3_arg1 = f2_arg0.properties:field_edited_func( f3_local0 ) or f3_arg1
					InputFieldUpdateText( f2_arg0, f3_local0 )
					f2_arg0.properties.active = false
				end
			end, f2_arg0.properties.keyboard_type )
		elseif not f2_arg0.properties.active then
			local f2_local2 = f2_arg0:getChildById( "input_text" )
			f2_local2:setTextEditActive()
			f2_arg0.properties.active = true
		end
	end
	
	function InputFieldUpdateText( f4_arg0, f4_arg1 )
		if f4_arg1.text then
			local f4_local0 = f4_arg0.properties.password_field and string.rep( "*", #f4_arg1.text ) or f4_arg1.text
			local f4_local1 = f4_arg0:getChildById( "input_text" )
			f4_local1:setTextEditText( f4_local0 )
			Engine.SetDvarString( f4_arg0.properties.dvar_hook, f4_arg1.text )
		end
	end
	
	function InitField( f5_arg0, f5_arg1 )
		f5_arg0:setTextEditText( f5_arg0.properties.text )
		local f5_local0 = Engine.GetDvarString( f5_arg0.properties.dvar_hook )
		if f5_local0 ~= nil and f5_local0 ~= "" then
			f5_arg0:setTextEditText( f5_arg0.properties.password_field and string.rep( "*", #f5_local0 ) or f5_local0 )
		end
	end
	
	function DefaultFieldEditedAction()
		
	end
	
	function generic_input_field()
		return {
			type = "UIButton",
			id = "generic_input_field_id",
			focusable = true,
			properties = {
				help_value = "Placeholder field help",
				field_name = "Placeholder Field name",
				dvar_hook = "override_this_with_a_DVarString_name",
				max_length = 16,
				password_field = false,
				use_auto_align = false,
				active = false,
				isPCGamepad = false,
				field_edited_func = DefaultFieldEditedAction,
				verify_string = false,
				filter_profanity = false,
				allow_empty = false,
				keyboard_type = CoD.KeyboardInputTypes.Normal,
				text_alignment = LUI.Alignment.Left
			},
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = false,
					left = 0,
					right = 0,
					top = 0,
					bottom = GenericButtonDims.button_height,
					alpha = 0.5
				},
				over = {
					alpha = 1
				}
			},
			handlers = {
				button_over = MBh.AnimateToState( "over", 0 ),
				button_up = MBh.AnimateToState( "default", 0 ),
				button_action = InputFieldAction,
				text_edit_complete = function ( f8_arg0, f8_arg1 )
					if not InputFieldOpensVirtualKeyboard( f8_arg0.properties.isPCGamepad ) and f8_arg0.properties.active then
						f8_arg1.text = f8_arg0.properties:field_edited_func( f8_arg1 ) or f8_arg1.text
						InputFieldUpdateText( f8_arg0, f8_arg1 )
					end
				end
				,
				edit_unfocus = function ( f9_arg0, f9_arg1 )
					if not InputFieldOpensVirtualKeyboard( f9_arg0.properties.isPCGamepad ) and f9_arg0.properties.active then
						f9_arg0:processEvent( {
							name = "finish_editing"
						} )
						f9_arg0.properties.active = false
					end
				end
				
			},
			children = {
				{
					type = "UITextEdit",
					id = "input_text",
					properties = {
						text = MBh.Property( "help_value" ),
						max_length = MBh.Property( "max_length" ),
						dvar_hook = MBh.Property( "dvar_hook" ),
						password_field = MBh.Property( "password_field" ),
						use_auto_align = MBh.Property( "use_auto_align" ),
						text_alignment = MBh.Property( "text_alignment" )
					},
					handlers = {
						menu_create = InitField,
						finish_editing = function ( f10_arg0, f10_arg1 )
							f10_arg0:setTextEditActive( false )
						end
						,
						colorize = function ( f11_arg0, f11_arg1 )
							f11_arg0:registerAnimationState( "colorized", {
								red = f11_arg1.red,
								green = f11_arg1.green,
								blue = f11_arg1.blue
							} )
							f11_arg0:animateToState( "colorized" )
						end
						
					},
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = 0,
							bottom = CoD.TextSettings.SmallFont.Height,
							font = CoD.TextSettings.SmallFont.Font,
							alignment = MBh.Property( "text_alignment" )
						}
					}
				}
			}
		}
	end
	
	function AutoUpdateDescText( f12_arg0, f12_arg1 )
		if f12_arg0.properties.desc_text then
			local f12_local0 = ""
			if type( f12_arg0.properties.desc_text ) == "string" then
				f12_local0 = f12_arg0.properties.desc_text
			elseif type( f12_arg0.properties.desc_text ) == "function" then
				f12_local0 = f12_arg0.properties:desc_text( f12_arg1 )
				assert( type( f12_local0 ) == "string" )
			end
			f12_arg0:dispatchEventToRoot( {
				name = "set_button_info_text",
				text = f12_local0,
				[1] = immediate
			} )
		end
	end
	
end
function generic_back_button()
	local self = LUI.UIBindButton.new()
	self.id = "generic_back_button"
	self:registerEventHandler( "button_secondary", function ( element, event )
		LUI.FlowManager.RequestLeaveMenu( element )
		return true
	end )
	return self
end

function generic_border( f15_arg0, f15_arg1 )
	local f15_local0 = false
	if f15_arg1.inner ~= nil then
		f15_local0 = f15_arg1.inner
	end
	local f15_local1 = f15_arg1.thickness
	if not f15_local1 then
		f15_local1 = 1
	end
	local f15_local2 = f15_arg1.border_red
	if not f15_local2 then
		f15_local2 = 1
	end
	local f15_local3 = f15_arg1.border_green
	if not f15_local3 then
		f15_local3 = 1
	end
	local f15_local4 = f15_arg1.border_blue
	if not f15_local4 then
		f15_local4 = 1
	end
	local f15_local5 = f15_arg1.border_alpha
	if not f15_local5 then
		f15_local5 = 1
	end
	local f15_local6 = f15_arg1.hide_bottom
	if not f15_local6 then
		f15_local6 = false
	end
	local self = LUI.UIElement.new()
	local f15_local8 = self
	local f15_local9 = self.registerAnimationState
	local f15_local10 = "default"
	local f15_local11 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true
	}
	if f15_local0 then
		local f15_local12 = f15_local1
	end
	f15_local11.top = f15_local12 or 0
	local f15_local13
	if f15_local0 then
		f15_local13 = -f15_local1
		if not f15_local13 then
		
		else
			f15_local11.bottom = f15_local13
			if f15_local0 then
				local f15_local14 = f15_local1
			end
			f15_local11.left = f15_local14 or 0
			if f15_local0 then
				f15_local13 = -f15_local1
				if not f15_local13 then
				
				else
					f15_local11.right = f15_local13
					f15_local9( f15_local8, f15_local10, f15_local11 )
					self:animateToState( "default" )
					f15_local9 = LUI.UIImage.new()
					f15_local9.id = "top"
					f15_local9:registerAnimationState( "default", {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = -f15_local1,
						bottom = 0,
						left = 0,
						right = 0
					} )
					f15_local9:animateToState( "default" )
					self:addElement( f15_local9 )
					f15_local8 = nil
					if not f15_local6 then
						f15_local8 = LUI.UIImage.new()
						f15_local8.id = "bottom"
						f15_local8:registerAnimationState( "default", {
							material = RegisterMaterial( "white" ),
							topAnchor = false,
							bottomAnchor = true,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = f15_local1 or 0,
							left = 0,
							right = 0
						} )
						f15_local8:animateToState( "default" )
						self:addElement( f15_local8 )
					end
					f15_local10 = LUI.UIImage.new()
					f15_local10.id = "left"
					f15_local13 = f15_local10
					f15_local11 = f15_local10.registerAnimationState
					local f15_local15 = "default"
					local f15_local16 = {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = false,
						top = -f15_local1
					}
					if not f15_local6 then
						local f15_local17 = f15_local1
					end
					f15_local16.bottom = f15_local17 or 0
					f15_local16.left = -f15_local1
					f15_local16.right = 0
					f15_local11( f15_local13, f15_local15, f15_local16 )
					f15_local10:animateToState( "default" )
					self:addElement( f15_local10 )
					f15_local11 = LUI.UIImage.new()
					f15_local11.id = "right"
					f15_local15 = f15_local11
					f15_local13 = f15_local11.registerAnimationState
					f15_local16 = "default"
					local f15_local18 = {
						material = RegisterMaterial( "white" ),
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = true,
						top = -f15_local1
					}
					if not f15_local6 then
						local f15_local19 = f15_local1
					end
					f15_local18.bottom = f15_local19 or 0
					f15_local18.left = 0
					f15_local18.right = f15_local1
					f15_local13( f15_local15, f15_local16, f15_local18 )
					f15_local11:animateToState( "default" )
					self:addElement( f15_local11 )
					self.colorize = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
						for f16_local3, f16_local4 in ipairs( {
							f15_local9,
							f15_local11,
							f15_local10,
							f15_local8
						} ) do
							f16_local4:registerAnimationState( "current", {
								red = f16_arg0,
								green = f16_arg1,
								blue = f16_arg2,
								alpha = f16_arg3
							} )
							f16_local4:animateToState( "current" )
						end
					end
					
					self.colorize( f15_local2, f15_local3, f15_local4, f15_local5 )
					self:registerEventHandler( "updateBorderColor", function ( element, event )
						element.colorize( event.red, event.green, event.blue, event.alpha )
					end )
					return self
				end
			end
			f15_local13 = 0
		end
	end
	f15_local13 = 0
end

function generic_confirmation_popup( f18_arg0, f18_arg1 )
	return MenuBuilder.BuildRegisteredType( "PopupOK", {
		title = f18_arg1.popup_title or "",
		message = f18_arg1.message_text or "",
		action = function ( f19_arg0, f19_arg1 )
			if f18_arg1.confirmation_action then
				f18_arg1.confirmation_action( f19_arg0, {
					controller = f19_arg1
				} )
			end
		end
		,
		label = f18_arg1.button_text
	} )
end

function generic_yesno_popup( f20_arg0, f20_arg1 )
	return MenuBuilder.BuildRegisteredType( "PopupYesNo", {
		title = f20_arg1.popup_title or "",
		message = f20_arg1.message_text or "",
		yesAction = function ( f21_arg0, f21_arg1 )
			if f20_arg1.yes_action then
				f20_arg1.yes_action( f21_arg0, {
					controller = f21_arg1
				} )
			end
		end
		,
		noAction = function ( f22_arg0, f22_arg1 )
			if f20_arg1.no_action then
				f20_arg1.no_action( f22_arg0, {
					controller = f22_arg1
				} )
			end
		end
		,
		yesLabel = f20_arg1.yes_text,
		noLabel = f20_arg1.no_text
	} )
end

if Engine.InFrontend() or Engine.IsSingleplayer() then
	MenuBuilder.registerDef( "generic_input_field", generic_input_field )
end
MenuBuilder.registerType( "generic_border", generic_border )
MenuBuilder.registerType( "generic_back_button", generic_back_button )
MenuBuilder.registerType( "generic_confirmation_popup", generic_confirmation_popup )
MenuBuilder.registerType( "generic_yesno_popup", generic_yesno_popup )
LockTable( _M )
