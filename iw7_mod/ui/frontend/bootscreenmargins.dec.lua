local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function RedrawMarginGuide( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetDvarFloat( "profileMenuOption_safeAreaHorz" )
	local f1_local1 = Engine.GetDvarFloat( "profileMenuOption_safeAreaVert" )
	local f1_local2 = math.ceil( (1 - (f1_local0 - SliderBounds.HorzMargin.Min) / (SliderBounds.HorzMargin.Max - SliderBounds.HorzMargin.Min)) * 1280 * (1 - SliderBounds.HorzMargin.Min) / 2 )
	local f1_local3 = math.ceil( (1 - (f1_local1 - SliderBounds.VertMargin.Min) / (SliderBounds.VertMargin.Max - SliderBounds.VertMargin.Min)) * 720 * (1 - SliderBounds.VertMargin.Min) / 2 )
	if not f1_arg0.old_horz_margin then
		f1_arg0.old_horz_margin = f1_local2
		f1_arg0.old_vert_margin = f1_local3
		f1_arg0.arrowTop = f1_arg0:getChildById( "margins_guide_arrow_top" )
		f1_arg0.arrowBottom = f1_arg0:getChildById( "margins_guide_arrow_bot" )
		f1_arg0.arrowLeft = f1_arg0:getChildById( "margins_guide_arrow_lt" )
		f1_arg0.arrowRight = f1_arg0:getChildById( "margins_guide_arrow_rt" )
	end
	f1_arg0:registerAnimationState( "current", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = f1_local2,
		right = -f1_local2,
		top = f1_local3,
		bottom = -f1_local3
	} )
	f1_arg0:animateToState( "current", 0 )
	if f1_arg0.old_horz_margin ~= f1_local2 then
		f1_arg0.arrowLeft:SetAlpha( 0, 0 )
		f1_arg0.arrowLeft:SetAlpha( 1, 250 )
		f1_arg0.arrowRight:SetAlpha( 0, 0 )
		f1_arg0.arrowRight:SetAlpha( 1, 250 )
		f1_arg0.old_horz_margin = f1_local2
	end
	if f1_arg0.old_vert_margin ~= f1_local3 then
		f1_arg0.arrowTop:SetAlpha( 0, 0 )
		f1_arg0.arrowTop:SetAlpha( 1, 250 )
		f1_arg0.arrowBottom:SetAlpha( 0, 0 )
		f1_arg0.arrowBottom:SetAlpha( 1, 250 )
		f1_arg0.old_vert_margin = f1_local3
	end
end

function margins_guide()
	local f2_local0 = {
		type = "UIElement",
		id = "horizontal_margins_guide_id",
		states = {
			default = {
				alpha = 0
			},
			visible = {
				alpha = 1
			}
		}
	}
	local f2_local1 = {}
	local f2_local2 = MBh.DoMultiple
	local f2_local3 = {}
	local f2_local4 = MBh.AnimateToState( "visible", 0 )
	local f2_local5 = RedrawMarginGuide
	local f2_local6 = MBh.EmitEvent( {
		name = "horizontal_margin_over_children"
	} )
	f2_local1.horizontal_margin_over = f2_local2( f2_local4 )
	f2_local2 = MBh.DoMultiple
	f2_local3 = {}
	f2_local4 = MBh.AnimateToState( "visible", 0 )
	f2_local5 = RedrawMarginGuide
	f2_local6 = MBh.EmitEvent( {
		name = "vertical_margin_over_children"
	} )
	f2_local1.vertical_margin_over = f2_local2( f2_local4 )
	f2_local2 = MBh.DoMultiple
	f2_local3 = {}
	f2_local4 = MBh.AnimateToState( "default", 100, true, false )
	f2_local5 = MBh.EmitEvent( {
		name = "horizontal_margin_up_children"
	} )
	f2_local1.horizontal_margin_up = f2_local2( f2_local4 )
	f2_local2 = MBh.DoMultiple
	f2_local3 = {}
	f2_local4 = MBh.AnimateToState( "default", 100, true, false )
	f2_local5 = MBh.EmitEvent( {
		name = "vertical_margin_up_children"
	} )
	f2_local1.vertical_margin_up = f2_local2( f2_local4 )
	f2_local1.margin_updated = RedrawMarginGuide
	f2_local0.handlers = f2_local1
	f2_local0.children = {
		{
			type = "UIImage",
			id = "margins_guide_dim",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = 0,
					right = 0,
					top = 0,
					bottom = 0,
					material = RegisterMaterial( "white" ),
					red = 0,
					green = 0,
					blue = 0,
					alpha = 0.5
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_lt",
			handlers = {
				horizontal_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				horizontal_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = false,
					left = -7,
					right = 27,
					top = -32,
					bottom = 32,
					material = RegisterMaterial( "wdg_selection_arrow_left_1" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_rt",
			handlers = {
				horizontal_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				horizontal_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = true,
					topAnchor = false,
					bottomAnchor = false,
					left = -27,
					right = 7,
					top = -32,
					bottom = 32,
					material = RegisterMaterial( "wdg_selection_arrow_right_1" ),
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_top",
			handlers = {
				vertical_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				vertical_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = true,
					bottomAnchor = false,
					left = -16,
					right = 16,
					top = -24,
					bottom = 44,
					material = RegisterMaterial( "wdg_selection_arrow_right_1" ),
					zRot = 90,
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "UIImage",
			id = "margins_guide_arrow_bot",
			handlers = {
				vertical_margin_over_children = MBh.AnimateToState( "visible", 0 ),
				vertical_margin_up_children = MBh.AnimateToState( "default", 0 )
			},
			states = {
				default = {
					leftAnchor = false,
					rightAnchor = false,
					topAnchor = false,
					bottomAnchor = true,
					left = -16,
					right = 16,
					top = -44,
					bottom = 24,
					material = RegisterMaterial( "wdg_selection_arrow_right_1" ),
					zRot = -90,
					alpha = 0
				},
				visible = {
					alpha = 1
				}
			}
		},
		{
			type = "generic_border",
			properties = {
				border_red = 0,
				border_green = 0,
				border_blue = 0.04,
				thickness = 100,
				border_alpha = 0.85
			}
		},
		{
			type = "generic_border"
		},
		{
			type = "UIElement",
			id = "margins_guide_outer_border_container",
			states = {
				default = {
					leftAnchor = true,
					rightAnchor = true,
					topAnchor = true,
					bottomAnchor = true,
					left = -3,
					right = 3,
					top = -3,
					bottom = 3
				}
			},
			children = {
				{
					type = "generic_border",
					properties = {
						border_red = SWATCHES.genericButton.highlight.r,
						border_green = SWATCHES.genericButton.highlight.g,
						border_blue = SWATCHES.genericButton.highlight.b,
						border_alpha = 0.4
					}
				}
			}
		}
	}
	return f2_local0
end

f0_local0 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = LUI.FlowManager.GetScopedData( f3_arg0 )
	local f3_local1 = f3_local0.exclusiveController
	assert( f3_local1 )
	f3_arg0:dispatchEventToRoot( {
		name = "continue_message_visible"
	} )
	f3_local0.OriginalVertMargin = Engine.GetDvarFloat( "profileMenuOption_safeAreaVert" )
	f3_local0.OriginalHorzMargin = Engine.GetDvarFloat( "profileMenuOption_safeAreaHorz" )
	if f3_local0.OriginalVertMargin < SliderBounds.VertMargin.Min or f3_local0.OriginalVertMargin > SliderBounds.VertMargin.Max then
		f3_local0.OriginalVertMargin = LUI.clamp( f3_local0.OriginalVertMargin, SliderBounds.VertMargin.Min, SliderBounds.VertMargin.Max )
		Engine.SetDvarFloat( "profileMenuOption_safeAreaVert", f3_local0.OriginalVertMargin )
		Engine.ExecNow( "profile_menuDvarsFinish" )
	end
	if f3_local0.OriginalHorzMargin < SliderBounds.HorzMargin.Min or f3_local0.OriginalHorzMargin > SliderBounds.HorzMargin.Max then
		f3_local0.OriginalHorzMargin = LUI.clamp( f3_local0.OriginalHorzMargin, SliderBounds.HorzMargin.Min, SliderBounds.HorzMargin.Max )
		Engine.SetDvarFloat( "profileMenuOption_safeAreaHorz", f3_local0.OriginalHorzMargin )
		Engine.ExecNow( "profile_menuDvarsFinish" )
	end
	f3_local0.VertMarginMinAmount = SliderBounds.VertMargin.Min
	f3_local0.VertMarginMaxAmount = SliderBounds.VertMargin.Max
	f3_local0.VertMarginIncrement = SliderBounds.VertMargin.Step
	f3_local0.HorzMarginMinAmount = SliderBounds.HorzMargin.Min
	f3_local0.HorzMarginMaxAmount = SliderBounds.HorzMargin.Max
	f3_local0.HorzMarginIncrement = SliderBounds.HorzMargin.Step
	f3_arg0:dispatchEventToChildren( {
		name = "vertical_margin_over"
	} )
	f3_arg0:dispatchEventToChildren( {
		name = "horizontal_margin_over"
	} )
	local f3_local2 = nil
	if (Engine.IsXB3() or Engine.IsPCApp()) and f3_arg0.properties and f3_arg0.properties.fromFirstTimeFlow then
		f3_local2 = MenuBuilder.BuildRegisteredType( "PlayerLogIn", {
			controllerIndex = f3_local1
		} )
		f3_local2.id = "Gamertag"
		f3_local2:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 116, _1080p * 585, _1080p * 964.5, _1080p * 993.5 )
		f3_arg0:addElement( f3_local2 )
		f3_arg0.Gamertag = f3_local2
	end
end

f0_local1 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3, f4_arg4, f4_arg5 )
	local f4_local0 = LUI.FlowManager.GetScopedData( f4_arg0 )
	local f4_local1 = math.min( f4_arg2, math.max( f4_arg1, Engine.GetDvarFloat( f4_arg4 ) + f4_arg3 ) )
	Engine.SetDvarFloat( f4_arg4, f4_local1 )
	Engine.ExecNow( "profile_menuDvarsFinish" )
	f4_arg0:dispatchEventToRoot( {
		name = "margin_updated"
	} )
	if f4_local1 <= f4_arg1 or f4_arg2 <= f4_local1 then
		Engine.PlaySound( CoD.SFX.DenyAdjustSafeArea )
	else
		Engine.PlaySound( CoD.SFX.AdjustSafeArea )
	end
end

f0_local2 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = LUI.FlowManager.GetScopedData( f5_arg0 )
	LUI.FlowManager.RequestLeaveMenu( f5_arg0, true )
end

function boot_screen_margins()
	local f6_local0 = CONDITIONS.IsSplitscreen( self ) and 100 or 210
	return {
		type = "UIElement",
		id = "boot_screen_margins_id",
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
				type = "UIImage",
				id = "margins_backgroung_image",
				handlers = {
					horizontal_margin_up_children = MBh.AnimateToState( "default", 0 )
				},
				states = {
					default = {
						leftAnchor = true,
						rightAnchor = true,
						topAnchor = true,
						bottomAnchor = true,
						left = 0,
						right = 0,
						top = 0,
						bottom = 0,
						material = RegisterMaterial( "sp_frontend_bink_background" ),
						alpha = 1
					}
				}
			},
			{
				type = "margins_guide"
			},
			{
				type = "UIText",
				id = "boot_screen_margins_title_txt_id",
				properties = {
					text = Engine.Localize( "@MENU_HUD_MARGINS_CAPS" )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 60,
						bottom = 60 + CoD.TextSettings.ExtraBigFont.Height,
						left = 100,
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
				id = "boot_screen_margins_instruction_txt1_id",
				properties = {
					text = ToUpperCase( Engine.Localize( "@MENU_ADJUST_SCREENMARGINS" ) )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = f6_local0,
						bottom = f6_local0 + CoD.TextSettings.NormalFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Center
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt2_id",
				properties = {
					text = ToUpperCase( Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_DESC" ) )
				},
				states = {
					default = {
						topAnchor = true,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = f6_local0 + CoD.TextSettings.NormalFont.Height,
						bottom = f6_local0 + 2 * CoD.TextSettings.NormalFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.NormalFont.Font,
						alignment = LUI.Alignment.Center
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt3_id",
				properties = {
					text = ToUpperCase( Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_INST1" ) )
				},
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = -1.2 * CoD.TextSettings.BoldFont.Height,
						bottom = 0,
						left = 0,
						right = 0,
						font = CoD.TextSettings.BoldFont.Font,
						alignment = LUI.Alignment.Center
					}
				}
			},
			{
				type = "UIText",
				id = "boot_screen_margins_instruction_txt4_id",
				properties = {
					text = ToUpperCase( Engine.Localize( "@MENU_ADJUST_SCREENMARGINS_INST2" ) )
				},
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = false,
						leftAnchor = true,
						rightAnchor = true,
						top = 0,
						bottom = 1.2 * CoD.TextSettings.BoldFont.Height,
						left = 0,
						right = 0,
						font = CoD.TextSettings.BoldFont.Font,
						alignment = LUI.Alignment.Center
					}
				}
			},
			{
				type = "UIButton",
				id = "boot_screen_margins_continue_btn_id",
				states = {
					default = {
						topAnchor = false,
						bottomAnchor = true,
						leftAnchor = false,
						rightAnchor = false,
						top = -1 * (CoD.TextSettings.BoldFont.Height + 105),
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
					button_action = f0_local2,
					continue_message_visible = MBh.AnimateToState( "visible", 0 )
				},
				children = {
					{
						type = "UIText",
						properties = {
							text = ToUpperCase( Engine.Localize( "@PLATFORM_UI_PRESS_TO_CONTINUE" ) )
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
				type = "UIBindButton",
				id = "boot_screen_margins_bind_btn_id",
				handlers = {
					button_primary = f0_local2,
					button_secondary = f0_local2,
					button_up = function ( f8_arg0, f8_arg1 )
						local f8_local0 = LUI.FlowManager.GetScopedData( f8_arg0 )
						f0_local1( f8_arg0, f8_local0.VertMarginMinAmount, f8_local0.VertMarginMaxAmount, f8_local0.VertMarginIncrement, "profileMenuOption_safeAreaVert", f8_local0.OriginalVertMargin )
					end
					,
					button_down = function ( f9_arg0, f9_arg1 )
						local f9_local0 = LUI.FlowManager.GetScopedData( f9_arg0 )
						f0_local1( f9_arg0, f9_local0.VertMarginMinAmount, f9_local0.VertMarginMaxAmount, -f9_local0.VertMarginIncrement, "profileMenuOption_safeAreaVert", f9_local0.OriginalVertMargin )
					end
					,
					button_left = function ( f10_arg0, f10_arg1 )
						local f10_local0 = LUI.FlowManager.GetScopedData( f10_arg0 )
						f0_local1( f10_arg0, f10_local0.HorzMarginMinAmount, f10_local0.HorzMarginMaxAmount, -f10_local0.HorzMarginIncrement, "profileMenuOption_safeAreaHorz", f10_local0.OriginalHorzMargin )
					end
					,
					button_right = function ( f11_arg0, f11_arg1 )
						local f11_local0 = LUI.FlowManager.GetScopedData( f11_arg0 )
						f0_local1( f11_arg0, f11_local0.HorzMarginMinAmount, f11_local0.HorzMarginMaxAmount, f11_local0.HorzMarginIncrement, "profileMenuOption_safeAreaHorz", f11_local0.OriginalHorzMargin )
					end
					
				}
			}
		}
	}
end

MenuBuilder.registerDef( "margins_guide", margins_guide )
MenuBuilder.registerDef( "boot_screen_margins", boot_screen_margins )
LockTable( _M )
