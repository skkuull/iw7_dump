local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = LUI.FlowManager.GetScopedData( f1_arg0 )
	local f1_local1 = f1_local0.exclusiveController
	assert( f1_local1 )
	f1_local0.BrightnessOgAmount = Engine.GetDvarFloat( "profileMenuOption_blacklevel" )
	f1_arg0:dispatchEventToRoot( {
		name = "continue_message_visible"
	} )
	f1_local0.BrightnessMinAmount = MIN_BRIGHTNESS or -0.4
	f1_local0.BrightnessMaxAmount = MAX_BRIGHTNESS or 0.2
	f1_local0.BrightnessIncrement = STEP_BRIGHTNESS or -0.01
	f1_arg0:dispatchEventToChildren( {
		name = "brightness_over"
	} )
	local f1_local2 = nil
	if Engine.IsXB3() or Engine.IsPCApp() then
		f1_local2 = MenuBuilder.BuildRegisteredType( "PlayerLogIn", {
			controllerIndex = f1_local1
		} )
		f1_local2.id = "Gamertag"
		f1_local2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 585, _1080p * 964.5, _1080p * 993.5 )
		f1_arg0:addElement( f1_local2 )
		f1_arg0.Gamertag = f1_local2
	end
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3, f2_arg4 )
	local f2_local0 = LUI.FlowManager.GetScopedData( f2_arg0 )
	local f2_local1 = math.min( f2_arg2, math.max( f2_arg1, Engine.GetDvarFloat( "profileMenuOption_blacklevel" ) + f2_arg3 ) )
	Engine.SetDvarFloat( "profileMenuOption_blacklevel", f2_local1 )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	if f2_local1 <= f2_arg1 or f2_arg2 <= f2_local1 then
		Engine.PlaySound( "mouse_negative" )
	elseif f2_arg4 then
		Engine.PlaySound( SOUND_SETS.default.action )
	end
	f2_arg0:dispatchEventToRoot( {
		name = "brightness_updated"
	} )
end

f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
	f0_local1( f3_arg0, f3_local0.BrightnessMinAmount, f3_local0.BrightnessMaxAmount, -f3_local0.BrightnessIncrement, not f3_arg1.mouse )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
	f0_local1( f4_arg0, f4_local0.BrightnessMinAmount, f4_local0.BrightnessMaxAmount, f4_local0.BrightnessIncrement, not f4_arg1.mouse )
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
	Engine.PlaySound( SOUND_SETS.default.action )
	if Engine.IsConsoleGame() then
		LUI.FlowManager.RequestPopupMenu( unused, "boot_screen_margins", false, firstControllerIndex, true, {
			fromFirstTimeFlow = true
		}, nil, true, true )
	else
		LUI.FlowManager.RequestLeaveMenu( f5_arg0, true )
	end
end

function boot_brightness()
	return {
		type = "UIElement",
		id = "boot_brightness_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = true,
				leftAnchor = true,
				rightAnchor = true,
				top = 0,
				bottom = 0,
				left = 0,
				right = 0
			}
		},
		handlers = {
			menu_create = f0_local0
		},
		children = {
			{
				type = "UIBindButton",
				id = "boot_brightness_bind_btn_id",
				handlers = {
					button_primary = f0_local4,
					button_left = f0_local2,
					button_right = f0_local3
				}
			},
			{
				type = "UIImage",
				id = "boot_brightness_bg_id",
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = true,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = 0,
						left = 0,
						right = 0,
						material = RegisterMaterial( "white" ),
						red = 0,
						green = 0,
						blue = 0,
						alpha = 1
					}
				}
			},
			{
				type = "UIText",
				id = "boot_brightness_title_txt_id",
				properties = {
					text = Engine.Localize( "@MENU_BRIGHTNESS_CAP" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 60,
						bottom = 60 + CoD.TextSettings.ExtraBigFont.Height,
						left = 90,
						right = 0,
						font = CoD.TextSettings.ExtraBigFont.Font,
						alignment = LUI.Alignment.Left
					}
				},
				handlers = {
					menu_create = function ( f7_arg0 )
						f7_arg0:SetOptOutRightToLeftAlignmentFlip( true )
					end
					
				}
			},
			{
				type = "UIText",
				id = "boot_brightness_instruction_txt1_id",
				properties = {
					text = Engine.Localize( "@MENU_ADJUST_BRIGHTNESS" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 210,
						bottom = 210 + CoD.TextSettings.NormalFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Center,
						red = SWATCHES.text.primaryText.r,
						green = SWATCHES.text.primaryText.g,
						blue = SWATCHES.text.primaryText.b
					}
				}
			},
			{
				type = "UIText",
				id = "boot_brightness_instruction_txt2_id",
				properties = {
					text = Engine.Localize( "@MENU_BRIGHTNESS_DESC2" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 210 + CoD.TextSettings.NormalFont.Height,
						bottom = 210 + 2 * CoD.TextSettings.NormalFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Center,
						red = SWATCHES.text.primaryText.r,
						green = SWATCHES.text.primaryText.g,
						blue = SWATCHES.text.primaryText.b
					}
				}
			},
			{
				type = "UIButton",
				id = "boot_brightness_continue_btn_id",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = false,
						top = -1 * (CoD.TextSettings.NormalFont.Height + 100),
						bottom = -100,
						left = -200,
						right = 200,
						alpha = 0
					},
					visible = {
						alpha = 1
					}
				},
				handlers = {
					button_action = f0_local4,
					continue_message_visible = MBh.AnimateToState( "visible", 0 )
				},
				children = {
					{
						type = "UIText",
						properties = {
							text = Engine.Localize( "@PLATFORM_UI_PRESS_TO_CONTINUE" )
						},
						states = {
							default = {
								topAnchor = true,
								bottomAnchor = true,
								leftAnchor = true,
								rightAnchor = true,
								top = 0,
								bottom = 0,
								left = 0,
								right = 0,
								font = CoD.TextSettings.NormalFont.Font,
								alignment = LUI.Alignment.Center
							}
						}
					}
				}
			},
			{
				type = "boot_brightness_guide"
			}
		}
	}
end

function boot_brightness_guide()
	local f8_local0 = 270
	local f8_local1 = 400
	local f8_local2 = 90
	local f8_local3 = {
		type = "UIElement",
		id = "brightness_guide_mini_id",
		states = {
			default = {
				topAnchor = true,
				bottomAnchor = false,
				leftAnchor = false,
				rightAnchor = false,
				top = f8_local0,
				bottom = f8_local0 + f8_local2 * 3,
				left = -1 * f8_local1 * 0.5,
				right = f8_local1 * 0.5,
				alpha = 0
			},
			visible = {
				alpha = 1
			}
		}
	}
	local f8_local4 = {}
	local f8_local5 = MBh.DoMultiple
	local f8_local6 = {}
	local f8_local7 = MBh.AnimateToState( "visible", 0 )
	local f8_local8 = MBh.EmitEvent( {
		name = "brightness_over_children"
	} )
	f8_local4.brightness_over = f8_local5( f8_local7 )
	f8_local4.brightness_up = MBh.AnimateToState( "default", 0 )
	f8_local3.handlers = f8_local4
	f8_local3.children = {
		{
			type = "brightness_guide",
			id = "brightness_guide_id",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					top = 0,
					left = 0,
					right = 0,
					bottom = 0
				}
			},
			properties = {
				band_height = f8_local2
			}
		},
		{
			type = "UIButton",
			id = "boot_brightness_left_arrow_btn_id",
			states = {
				default = {
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = -32,
					bottom = 32,
					left = -52,
					right = -20
				},
				offset = {
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = false,
					top = -32,
					bottom = 32,
					left = -55,
					right = -23
				}
			},
			handlers = {
				button_action = f0_local2,
				menu_create = MBh.AnimateLoop( {
					{
						"offset",
						500,
						true,
						true
					},
					{
						"default",
						500,
						true,
						true
					}
				} )
			},
			children = {
				{
					type = "UIImage",
					states = {
						default = {
							topAnchor = true,
							bottomAnchor = true,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = 0,
							left = 0,
							right = 0,
							material = RegisterMaterial( "widg_margin_arrow_lt" )
						}
					}
				}
			}
		},
		{
			type = "UIButton",
			id = "boot_brightness_right_arrow_btn_id",
			states = {
				default = {
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = false,
					rightAnchor = true,
					top = -32,
					bottom = 32,
					left = 20,
					right = 52
				},
				offset = {
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = false,
					rightAnchor = true,
					top = -32,
					bottom = 32,
					left = 23,
					right = 55
				}
			},
			handlers = {
				button_action = f0_local3,
				menu_create = MBh.AnimateLoop( {
					{
						"offset",
						500,
						true,
						true
					},
					{
						"default",
						500,
						true,
						true
					}
				} )
			},
			children = {
				{
					type = "UIImage",
					states = {
						default = {
							topAnchor = true,
							bottomAnchor = true,
							leftAnchor = true,
							rightAnchor = true,
							top = 0,
							bottom = 0,
							left = 0,
							right = 0,
							material = RegisterMaterial( "widg_margin_arrow_rt" )
						}
					}
				}
			}
		}
	}
	return f8_local3
end

MenuBuilder.registerDef( "boot_brightness", boot_brightness )
MenuBuilder.registerDef( "boot_brightness_guide", boot_brightness_guide )
LockTable( _M )
