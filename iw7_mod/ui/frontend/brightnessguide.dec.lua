local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
BrightnessGuideConstants = {
	not_visible = {
		item_id = "bg_not_visible",
		color_default = 0.02
	},
	barely_visible = {
		item_id = "bg_barely_visible",
		color_default = 0.07
	},
	easily_visible = {
		item_id = "bg_easily_visible",
		color_default = 0.19
	}
}
function UpdateBrightnessGuide( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetDvarFloat( "profileMenuOption_blacklevel" )
	local f1_local1 = nil
	if f1_arg0.id == BrightnessGuideConstants.not_visible.item_id then
		f1_local1 = BrightnessGuideConstants.not_visible.color_default
	elseif f1_arg0.id == BrightnessGuideConstants.barely_visible.item_id then
		f1_local1 = BrightnessGuideConstants.barely_visible.color_default
	elseif f1_arg0.id == BrightnessGuideConstants.easily_visible.item_id then
		f1_local1 = BrightnessGuideConstants.easily_visible.color_default
	end
	if f1_local1 ~= nil then
		local f1_local2 = (f1_local1 - f1_local0) / (1 - f1_local0)
		f1_arg0:registerAnimationState( "current", {
			red = f1_local2,
			green = f1_local2,
			blue = f1_local2
		} )
		f1_arg0:animateToState( "current", 0 )
	end
end

function brightness_guide()
	local f2_local0 = {
		type = "UIElement",
		id = "brightness_guide_id",
		states = {
			default = {
				leftAnchor = true,
				rightAnchor = false,
				topAnchor = true,
				bottomAnchor = false,
				top = 150,
				bottom = 510,
				left = 710,
				right = 1070,
				alpha = 0
			},
			visible = {
				alpha = 1
			}
		},
		properties = {
			band_height = 120
		}
	}
	local f2_local1 = {}
	local f2_local2 = MBh.DoMultiple
	local f2_local3 = {}
	local f2_local4 = MBh.AnimateToState( "visible", 0 )
	local f2_local5 = MBh.EmitEvent( {
		name = "brightness_over_children"
	} )
	f2_local1.brightness_over = f2_local2( f2_local4 )
	f2_local1.brightness_up = MBh.AnimateToState( "default", 0 )
	f2_local0.handlers = f2_local1
	f2_local0.children = {
		{
			type = "generic_border",
			properties = {
				thickness = 2,
				border_red = SWATCHES.genericMenu.frame.r,
				border_green = SWATCHES.genericMenu.frame.g,
				border_blue = SWATCHES.genericMenu.frame.b
			}
		},
		{
			type = "UIVerticalList",
			id = "brightness_guide_list_id",
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
			children = {
				{
					type = "UIImage",
					id = BrightnessGuideConstants.not_visible.item_id,
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = 0,
							bottom = MBh.Property( "band_height" ),
							material = RegisterMaterial( "white" ),
							red = BrightnessGuideConstants.not_visible.color_default,
							green = BrightnessGuideConstants.not_visible.color_default,
							blue = BrightnessGuideConstants.not_visible.color_default
						}
					},
					children = {
						{
							type = "UIText",
							id = "text_not_visible",
							properties = {
								text = Engine.Localize( "@MENU_BRIGHTNESS_NOT_VISIBLE" )
							},
							states = {
								default = {
									leftAnchor = true,
									rightAnchor = true,
									topAnchor = false,
									bottomAnchor = false,
									left = 0,
									right = 0,
									top = -CoD.TextSettings.ExtraBigFont.Height / 2,
									bottom = CoD.TextSettings.ExtraBigFont.Height / 2,
									font = CoD.TextSettings.ExtraBigFont.Font,
									red = 0,
									green = 0,
									blue = 0,
									alignment = LUI.Alignment.Center
								}
							}
						}
					},
					handlers = {
						brightness_over_children = UpdateBrightnessGuide,
						brightness_updated = UpdateBrightnessGuide
					}
				},
				{
					type = "UIImage",
					id = BrightnessGuideConstants.barely_visible.item_id,
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = 0,
							bottom = MBh.Property( "band_height" ),
							material = RegisterMaterial( "white" ),
							red = BrightnessGuideConstants.barely_visible.color_default,
							green = BrightnessGuideConstants.barely_visible.color_default,
							blue = BrightnessGuideConstants.barely_visible.color_default
						}
					},
					children = {
						{
							type = "UIText",
							id = "text_barely_visible",
							properties = {
								text = Engine.Localize( "@MENU_BRIGHTNESS_BARELY_VISIBLE" )
							},
							states = {
								default = {
									leftAnchor = true,
									rightAnchor = true,
									topAnchor = false,
									bottomAnchor = false,
									left = 0,
									right = 0,
									top = -CoD.TextSettings.ExtraBigFont.Height / 2,
									bottom = CoD.TextSettings.ExtraBigFont.Height / 2,
									font = CoD.TextSettings.ExtraBigFont.Font,
									red = 0,
									green = 0,
									blue = 0,
									alignment = LUI.Alignment.Center
								}
							}
						}
					},
					handlers = {
						brightness_over_children = UpdateBrightnessGuide,
						brightness_updated = UpdateBrightnessGuide
					}
				},
				{
					type = "UIImage",
					id = BrightnessGuideConstants.easily_visible.item_id,
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = 0,
							bottom = MBh.Property( "band_height" ),
							material = RegisterMaterial( "white" ),
							red = BrightnessGuideConstants.easily_visible.color_default,
							green = BrightnessGuideConstants.easily_visible.color_default,
							blue = BrightnessGuideConstants.easily_visible.color_default
						}
					},
					children = {
						{
							type = "UIText",
							id = "text_barely_visible",
							properties = {
								text = Engine.Localize( "@MENU_BRIGHTNESS_EASILY_VISIBLE" )
							},
							states = {
								default = {
									leftAnchor = true,
									rightAnchor = true,
									topAnchor = false,
									bottomAnchor = false,
									left = 0,
									right = 0,
									top = -CoD.TextSettings.ExtraBigFont.Height / 2,
									bottom = CoD.TextSettings.ExtraBigFont.Height / 2,
									font = CoD.TextSettings.ExtraBigFont.Font,
									red = 0,
									green = 0,
									blue = 0,
									alignment = LUI.Alignment.Center
								}
							}
						}
					},
					handlers = {
						brightness_over_children = UpdateBrightnessGuide,
						brightness_updated = UpdateBrightnessGuide
					}
				},
				{
					type = "UIElement",
					id = "spacing_element_id",
					states = {
						default = {
							leftAnchor = true,
							rightAnchor = true,
							topAnchor = true,
							bottomAnchor = false,
							left = 0,
							right = 0,
							top = 0,
							bottom = 15
						}
					}
				},
				{
					type = "UIText",
					id = "background_guide_help",
					properties = {
						text = Engine.Localize( "@MENU_BRIGHTNESS_DESC2" )
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
							bottom = CoD.TextSettings.NormalFont.Height,
							font = CoD.TextSettings.NormalFont.Font,
							alignment = LUI.Alignment.Center,
							red = SWATCHES.text.primaryText.r,
							green = SWATCHES.text.primaryText.g,
							blue = SWATCHES.text.primaryText.b
						}
					}
				}
			}
		}
	}
	return f2_local0
end

MenuBuilder.registerDef( "brightness_guide", brightness_guide )
LockTable( _M )
