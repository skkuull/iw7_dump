LUI.HUD = LUI.Class( LUI.UIElement )
LUI.HUD.init = function ( f1_arg0, f1_arg1 )
	assert( f1_arg1 )
	local f1_local0 = {
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0
	}
	LUI.HUD.super.init( f1_arg0, f1_local0 )
	f1_arg0.id = "HUD"
	f1_arg0.allWidgets = {}
	f1_arg0.controllerIndex = f1_arg1
	f1_arg0.shakeable = LUI.UIElement.new( f1_local0 )
	f1_arg0.shakeable.id = "shakeable"
	f1_arg0:addElement( f1_arg0.shakeable )
	f1_arg0.static = LUI.UIElement.new( f1_local0 )
	f1_arg0.static.id = "static"
	f1_arg0:addElement( f1_arg0.static )
	f1_arg0.static.fullscreen = LUI.UIElement.new( f1_local0 )
	f1_arg0.static.fullscreen.id = "fullscreen"
	f1_arg0.static:addElement( f1_arg0.static.fullscreen )
	f1_arg0.shakeable.fullscreen = LUI.UIElement.new( f1_local0 )
	f1_arg0.shakeable.fullscreen.id = "fullscreen"
	f1_arg0.shakeable:addElement( f1_arg0.shakeable.fullscreen )
	f1_arg0.static.scalable = LUI.UIElement.new( f1_local0 )
	f1_arg0.static.scalable:SetupSafeArea()
	f1_arg0.static.scalable.id = "scalable"
	f1_arg0.static:addElement( f1_arg0.static.scalable )
	f1_arg0.shakeable.scalable = LUI.UIElement.new( f1_local0 )
	f1_arg0.shakeable.scalable:SetupSafeArea()
	f1_arg0.shakeable.scalable.id = "scalable"
	f1_arg0.shakeable:addElement( f1_arg0.shakeable.scalable )
	f1_arg0.shakeable.shakeDuration = 0
	f1_arg0.shakeable.hud = f1_arg0
	f1_arg0.shakeable:registerOmnvarHandler( "ui_hud_shake", function ( f2_arg0, f2_arg1 )
		local f2_local0 = f2_arg0.hud
		if f2_arg1.value then
			f2_local0:Shake()
		else
			f2_local0:StopShake()
		end
	end )
	f1_arg0.shakeable:registerOmnvarHandler( "ui_hud_static", function ( f3_arg0, f3_arg1 )
		local f3_local0 = f3_arg0.hud
		if f3_arg1.value == 2 then
			f3_local0:Shake()
		elseif f3_arg1.value == 0 then
			f3_local0:StopShake()
		end
	end )
	f1_arg0._dimOverlay = false
	f1_arg0:registerOmnvarHandler( "ui_session_state", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerEventHandler( "weapon_change", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerEventHandler( "playerstate_client_changed", LUI.HUD.UpdateWidgetsVisibility )
	f1_arg0:registerEventHandler( "pause", LUI.HUD.OpenPauseMenu )
	f1_arg0:registerEventHandler( "empty_menu_stack", function ( element )
		element._dimOverlay = false
		element:UpdateWidgetsVisibility()
	end )
	f1_arg0:registerEventHandler( "non_empty_menu_stack", function ( element )
		element._dimOverlay = true
		element:UpdateWidgetsVisibility()
	end )
	if Engine.IsSingleplayer() then
		f1_arg0:registerEventHandler( "campaign_mode_savedata_error", LUI.HUD.OpenSaveDataErrorDialog )
	end
	if Engine.IsMultiplayer() then
		f1_arg0:SubscribeToModel( DataSources.inGame.HUD.isScoreboardOpen:GetModel( f1_arg1 ), function ()
			LUI.HUD.UpdateWidgetsVisibility( f1_arg0 )
		end )
	end
	f1_arg0.staggeredWidgets = {}
	local f1_local1 = f1_arg0:Wait( 16 )
	local f1_local2 = nil
	f1_local1.onComplete = function ( f7_arg0 )
		if #f7_arg0.staggeredWidgets > 0 then
			local f7_local0 = table.remove( f7_arg0.staggeredWidgets, 1 )
			f7_local0.wrapper._widget = f7_arg0:AddWidgetInternal( f7_local0.wrapper, f7_local0.name, f7_local0.options )
			f7_local0.wrapper:addElement( f7_local0.wrapper._widget )
			if #f7_arg0.staggeredWidgets > 0 then
				local f7_local1 = f7_arg0:Wait( 16 )
				f7_local1.onComplete = f1_local2
			end
		end
	end
	
end

LUI.HUD.AddWidgetDebugInfo = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	local f8_local0 = 1280
	local f8_local1 = 720
	local f8_local2 = 0.8
	local f8_local3 = f8_arg3
	local f8_local4
	if f8_arg4 or f8_arg3 >= f8_local2 * f8_local0 then
		f8_local4 = false
	else
		f8_local4 = f8_local3 and true
	end
	local f8_local5 = f8_arg4
	local f8_local6
	if f8_arg3 or f8_arg4 >= f8_local2 * f8_local1 then
		f8_local6 = false
	else
		f8_local6 = f8_local5 and true
	end
	if (f8_local4 or f8_local6 or f8_arg3 and f8_arg4) and not f8_arg1._hudMapRegistered then
		local f8_local7 = f8_arg2.id
		f8_arg1._hudMapRegistered = true
		f8_arg1:SubscribeToModel( DataSources.debug.drawHUDMap:GetModel( 0 ), function ( f9_arg0 )
			if DataModel.GetModelValue( f9_arg0 ) then
				assert( not f8_arg1.box )
				f8_arg1.box = LUI.UIImage.new( {
					material = RegisterMaterial( "white" ),
					topAnchor = true,
					bottomAnchor = true,
					leftAnchor = true,
					rightAnchor = true,
					top = 0,
					bottom = 0,
					left = 0,
					right = 0,
					red = math.random(),
					green = math.random(),
					alpha = 0.4
				} )
				f8_arg1.box.id = "debug_bg"
				f8_arg1:addElement( f8_arg1.box )
				assert( not f8_arg1.widgetName )
				f8_arg1.widgetName = LUI.UIText.new( {
					alignment = LUI.Alignment.Center,
					font = FONTS.GetFont( FONTS.Dev.File ),
					topAnchor = false,
					bottomAnchor = false,
					leftAnchor = true,
					rightAnchor = true,
					left = 0,
					top = -8,
					right = 0,
					height = 16,
					alpha = 1
				} )
				f8_arg1.widgetName:SetWordWrap( false )
				f8_arg1.widgetName:setText( tostring( f8_local7 ) )
				f8_arg1.widgetName.id = "debug_name"
				f8_arg1:addElement( f8_arg1.widgetName )
			else
				if f8_arg1.box then
					f8_arg1.box:close()
					f8_arg1.box = nil
				end
				if f8_arg1.widgetName then
					f8_arg1.widgetName:close()
					f8_arg1.widgetName = nil
				end
			end
		end )
	end
end

LUI.HUD.AddWidgetInternal = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	Engine.MeasureResourceEventStart( "(LUI.HUD.AddWidgetInternal) " .. f10_arg2, "widget" )
	local f10_local0 = f10_arg3.options or {}
	f10_local0.controllerIndex = f10_arg0.controllerIndex
	local f10_local1 = MenuBuilder.BuildRegisteredType( f10_arg2, f10_local0 )
	local f10_local2
	if f10_arg3.leftAnchor == nil then
		f10_local2 = true
	else
		f10_local2 = f10_arg3.leftAnchor
	end
	local f10_local3
	if f10_arg3.rightAnchor == nil then
		f10_local3 = true
	else
		f10_local3 = f10_arg3.rightAnchor
	end
	local f10_local4
	if f10_arg3.topAnchor == nil then
		f10_local4 = true
	else
		f10_local4 = f10_arg3.topAnchor
	end
	local f10_local5
	if f10_arg3.bottomAnchor == nil then
		f10_local5 = true
	else
		f10_local5 = f10_arg3.bottomAnchor
	end
	local f10_local6 = f10_arg3.horizontalOffset or 0
	local f10_local7 = f10_arg3.verticalOffset or 0
	local f10_local8 = {
		leftAnchor = f10_local2,
		rightAnchor = f10_local3,
		topAnchor = f10_local4,
		bottomAnchor = f10_local5
	}
	local f10_local9, f10_local10 = nil
	local f10_local11 = {}
	f10_local11 = f10_local1:getLocalRect()
	local f10_local12 = {}
	f10_local12 = f10_local1:GetAnchorData()
	if f10_local2 and f10_local3 then
		f10_local8.left = 0
		f10_local8.right = 0
	else
		local f10_local13 = assert
		local f10_local14
		if f10_local12[1] == 0 and f10_local12[3] == 0 then
			f10_local14 = false
		else
			f10_local14 = true
		end
		f10_local13( f10_local14, "HUD widgets can only be positioned horizontally if the given widget has one or more false horizontal anchors." )
		f10_local9 = f10_local11[3] - f10_local11[1]
		if not f10_local2 and not f10_local3 then
			f10_local8.left = f10_local6 - f10_local9 / 2
			f10_local8.right = f10_local6 + f10_local9 / 2
		elseif not f10_local2 then
			f10_local8.right = -f10_local6
			f10_local8.width = f10_local9
		elseif not f10_local3 then
			f10_local8.left = f10_local6
			f10_local8.width = f10_local9
		end
	end
	if f10_local4 and f10_local5 then
		f10_local8.top = 0
		f10_local8.bottom = 0
	else
		local f10_local13 = assert
		local f10_local14
		if f10_local12[2] == 0 and f10_local12[4] == 0 then
			f10_local14 = false
		else
			f10_local14 = true
		end
		f10_local13( f10_local14, "HUD widgets can only be positioned vertically if the given widget has one or more false vertical anchors." )
		f10_local10 = f10_local11[4] - f10_local11[2]
		if not f10_local4 and not f10_local5 then
			f10_local8.top = f10_local7 - f10_local10 / 2
			f10_local8.bottom = f10_local7 + f10_local10 / 2
		elseif not f10_local4 then
			f10_local8.bottom = -f10_local7
			f10_local8.height = f10_local10
		elseif not f10_local5 then
			f10_local8.top = f10_local7
			f10_local8.height = f10_local10
		end
	end
	f10_arg1:registerAnimationState( "default", f10_local8 )
	f10_arg1:animateToState( "default" )
	f10_local1:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0 )
	if Engine.IsDevelopmentBuild() then
		f10_arg0:AddWidgetDebugInfo( f10_arg1, f10_local1, f10_local9, f10_local10 )
	end
	Engine.MeasureResourceEventEnd( "(LUI.HUD.AddWidgetInternal) " .. f10_arg2, "widget" )
	return f10_local1
end

LUI.HUD.AddOverlay = function ( f11_arg0, f11_arg1 )
	f11_arg0._overlay = f11_arg1
	f11_arg0:addElement( f11_arg1 )
end

LUI.HUD.AddWidget = function ( f12_arg0, f12_arg1, f12_arg2 )
	assert( type( f12_arg1 ) == "string" )
	if not f12_arg2 then
		f12_arg2 = {}
	end
	local f12_local0 = f12_arg2.shakeable
	local f12_local1 = f12_arg2.scalable
	local f12_local2 = f12_arg2.curvedX or 0
	local f12_local3 = f12_arg2.curvedY or 0
	local f12_local4 = f12_arg2.useFullscreenHUDMask
	local self = LUI.UIElement.new( defaultState )
	local f12_local6 = f12_arg2.id
	if not f12_local6 then
		f12_local6 = f12_arg1 .. "Wrapper"
	end
	self.id = f12_local6
	self.ShowImmediately = function ( f13_arg0 )
		return f13_arg0:PlayHUDWidgetAnimation( "immediate", true )
	end
	
	self.PlayHUDWidgetAnimation = function ( f14_arg0, f14_arg1, f14_arg2 )
		if self._widget then
			local f14_local0 = "hud_anim_"
			local f14_local1 = f14_arg1
			local f14_local2 = "_"
			local f14_local3
			if f14_arg2 then
				f14_local3 = "on"
				if not f14_local3 then
				
				else
					f14_local0 = f14_local0 .. f14_local1 .. f14_local2 .. f14_local3
					if self._widget:HasEventHandler( f14_local0 ) then
						self._widget:processEvent( {
							name = f14_local0
						} )
						return true
					end
				end
			end
			f14_local3 = "off"
		end
		return false
	end
	
	self:SetCurvedRenderingX( f12_local2 )
	self:SetCurvedRenderingY( f12_local3 )
	if f12_local4 then
		self:SetDotPitchX( 6 )
		self:SetDotPitchY( 3 )
		self:SetDotPitchContrast( 0.1 )
	end
	f12_local6 = f12_arg0
	if f12_local0 then
		local f12_local7 = f12_local6.shakeable
	end
	f12_local6 = f12_local7 or f12_local6.static
	if f12_local1 then
		local f12_local8 = f12_local6.scalable
	end
	f12_local6.addElement( f12_local8 or f12_local6.fullscreen, self )
	table.insert( f12_arg0.allWidgets, self )
	if f12_arg2.buildWhen and f12_arg2.staggerBuild then
		assert( false, "Shouldn't have both buildWhen and staggerBuild set for a widget: " .. f12_arg1 )
	end
	if not f12_arg2.buildWhen and not f12_arg2.staggerBuild then
		self._widget = f12_arg0:AddWidgetInternal( self, f12_arg1, f12_arg2 )
		self:addElement( self._widget )
	elseif f12_arg2.staggerBuild then
		table.insert( f12_arg0.staggeredWidgets, {
			name = f12_arg1,
			options = f12_arg2,
			wrapper = self
		} )
	else
		local f12_local9 = f12_arg2.gracePeriod or 500
		local f12_local10 = f12_arg2.buildWhen:GetModel( f12_arg0.controllerIndex )
		self:SubscribeToModel( f12_local10, function ()
			local f15_local0 = DataModel.GetModelValue( f12_local10 )
			if f15_local0 and not self._widget then
				self._widget = f12_arg0:AddWidgetInternal( self, f12_arg1, f12_arg2 )
				self:addElement( self._widget )
			elseif self._widget and not f15_local0 then
				local f15_local1 = self:Wait( f12_local9 )
				f15_local1.onComplete = function ()
					if self._widget and not DataModel.GetModelValue( f12_local10 ) then
						self._widget:closeTree()
						self._widget = nil
					end
				end
				
			end
		end, f12_arg2.noCallbackOnSubscribeForBuildWhen or false )
	end
	return self
end

LUI.HUD.SetWidgetVisibility = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	assert( f17_arg2 )
	if f17_arg3 then
		f17_arg1:ShowImmediately()
		f17_arg1:SetGlitchEnabled( false )
		f17_arg1:SetAlpha( 1 )
		f17_arg1:SetRGBFromTable( COLORS.white )
	end
	if f17_arg2 == "snap" then
		if f17_arg3 then
			f17_arg1:SetAlpha( 1 )
		else
			f17_arg1:SetAlpha( 0 )
		end
	elseif f17_arg2 == "fade" then
		if f17_arg3 then
			f17_arg1:SetAlpha( 0 )
			f17_arg1:SetAlpha( 1, 150 )
		else
			f17_arg1:SetAlpha( 1 )
			f17_arg1:SetAlpha( 0, 150 )
		end
	elseif f17_arg2 == "glitch" then
		local f17_local0 = f17_arg1
		local f17_local1 = f17_arg1.SetRGBFromTable
		local f17_local2
		if f17_arg3 then
			f17_local2 = COLORS.white
			if not f17_local2 then
			
			else
				f17_local1( f17_local0, f17_local2, 0 )
				f17_arg1:SetAlpha( 1 )
				f17_arg1:SetGlitchEnabled( true )
				f17_arg1:SetGlitchBlockWidth( math.random( 10, 40 ) )
				f17_arg1:SetGlitchBlockHeight( math.random( 5, 20 ) )
				f17_arg1:SetGlitchDistortionRange( math.random( 1, 80 ) )
				f17_arg1:SetGlitchScanlinePitch( 1 )
				f17_arg1:SetGlitchMaskPitch( 1 )
				f17_local0 = f17_arg1
				f17_local1 = f17_arg1.SetGlitchAmount
				if f17_arg3 then
					f17_local2 = 1
					if not f17_local2 then
					
					else
						f17_local1( f17_local0, f17_local2 )
						f17_local0 = f17_arg1
						f17_local1 = f17_arg1.SetGlitchAmount
						if f17_arg3 then
							f17_local2 = 0.5
							if not f17_local2 then
							
							else
								local f17_local3
								if f17_arg3 then
									f17_local3 = 300
									if not f17_local3 then
									
									else
										f17_local1 = f17_local1( f17_local0, f17_local2, f17_local3 )
										f17_local1.onComplete = function ()
											f17_arg1:SetAlpha( f17_arg3 and 1 or 0 )
											f17_arg1:SetGlitchEnabled( false )
										end
										
									end
								end
								f17_local3 = 600
							end
						end
						f17_local2 = 1
					end
				end
				f17_local2 = 0.5
			end
		end
		f17_local2 = SWATCHES.HUD.warning
	elseif not f17_arg1:PlayHUDWidgetAnimation( f17_arg2, f17_arg3 ) and not f17_arg3 then
		f17_arg1:SetAlpha( 0 )
	end
end

LUI.HUD.UpdateWidgetsVisibility = function ( f19_arg0 )
	local f19_local0, f19_local1, f19_local2 = f19_arg0:GetToggleWidgets()
	if not f19_arg0.initialized then
		f19_local2 = {
			on = "snap",
			off = "snap"
		}
	elseif not f19_local2 then
		f19_local2 = {
			on = "fade",
			off = "fade"
		}
	end
	assert( f19_local2.on )
	assert( f19_local2.off )
	local f19_local3 = {}
	for f19_local7, f19_local8 in pairs( f19_local0 ) do
		assert( f19_local8.id )
		f19_local3[f19_local8.id] = true
	end
	for f19_local7, f19_local8 in pairs( f19_arg0.allWidgets ) do
		assert( f19_local8.id )
		local f19_local9 = not f19_local1
		if f19_local3[f19_local8.id] then
			f19_local9 = f19_local1
		end
		if f19_local8._widgetVisible ~= f19_local9 then
			local f19_local10 = nil
			if not f19_local9 then
				f19_local8._nextOnAnimation = f19_local2[f19_local8] and f19_local2[f19_local8].on or f19_local2.on
				if f19_local2[f19_local8] then
					local f19_local11 = f19_local2[f19_local8].off
				end
				f19_local10 = f19_local11 or f19_local2.off
			else
				if f19_local2[f19_local8] and f19_local2[f19_local8].on then
					f19_local10 = f19_local2[f19_local8].on
				else
					f19_local10 = f19_local8._nextOnAnimation or "bootup"
				end
				f19_local8._nextOnAnimation = nil
			end
			f19_arg0:SetWidgetVisibility( f19_local8, f19_local10, f19_local9 )
			f19_local8._widgetVisible = f19_local9
		end
	end
	if f19_arg0._overlay then
		if f19_arg0._dimOverlay then
			f19_arg0._overlay:SetAlpha( 0.05 )
		else
			f19_arg0._overlay:SetAlpha( 1 )
		end
	end
end

LUI.HUD.GetToggleWidgets = function ( f20_arg0 )
	return {}, false
end

LUI.HUD.Shake = function ( f21_arg0 )
	if f21_arg0.shakeable.shakeDuration > 400 then
		f21_arg0:StopShake()
		return 
	end
	local f21_local0 = 4
	local f21_local1 = 4
	local f21_local2 = 20 + 50 * math.random()
	local f21_local3 = f21_local0 * (1 - f21_local1 + math.random() * 2 * f21_local1)
	local f21_local4 = f21_local0 * (1 - f21_local1 + math.random() * 2 * f21_local1)
	if math.random() > 0.5 then
		f21_local3 = -f21_local3
	end
	if math.random() > 0.5 then
		f21_local4 = -f21_local4
	end
	f21_arg0.shakeable.shakeDuration = f21_arg0.shakeable.shakeDuration + f21_local2
	local f21_local5 = f21_arg0.shakeable:SetAnchorsAndPosition( 0, 0, 0, 0, f21_local3, f21_local3, f21_local4, f21_local4, f21_local2, LUI.EASING.outQuadratic )
	f21_local5.onComplete = function ()
		f21_arg0:Shake()
	end
	
end

LUI.HUD.StopShake = function ( f23_arg0 )
	assert( f23_arg0.shakeable )
	f23_arg0.shakeable:SetAnchorsAndPosition( 0, 0, 0, 0, 0, 0, 0, 0, 150, LUI.EASING.inOutQuadratic )
	f23_arg0.shakeable.shakeDuration = 0
end

LUI.HUD.OpenPauseMenu = function ( f24_arg0, f24_arg1 )
	if Engine.IsAliensMode() then
		LUI.FlowManager.RequestAddMenu( "CPPauseMenu", true, f24_arg1.controller, false )
	elseif Engine.IsMultiplayer() then
		LUI.FlowManager.RequestAddMenu( "MPPauseMenu", true, f24_arg1.controller, false )
	else
		local f24_local0 = nil
		if DataSources.inGame.SP.inVR ~= nil then
			local f24_local1 = f24_arg1.controller
			if not f24_local1 then
				f24_local1 = Engine.GetFirstActiveController()
			end
			f24_local0 = DataSources.inGame.SP.inVR:GetModel( f24_local1 )
		end
		if f24_local0 ~= nil and DataModel.GetModelValue( f24_local0 ) then
			LUI.FlowManager.RequestPopupMenu( nil, "VRPauseMenu" )
		elseif not OSK.IsScreenKeyboardActive() then
			LUI.FlowManager.RequestAddMenu( "SPPauseMenu", true, f24_arg1.controller, false )
		end
	end
end

LUI.HUD.OpenSaveDataErrorDialog = function ( f25_arg0, f25_arg1 )
	if not Engine.IsMultiplayer() then
		if Engine.GetDvarBool( "unattended" ) then
			HudUtility.CorruptSaveDataRepairForSP( Engine.GetFirstActiveController() )
		else
			Engine.Pause()
			LUI.FlowManager.RequestPopupMenu( nil, "campaign_mode_savedata_error_popup" )
		end
	end
end

LUI.HUD.RegisterOmnvarMenuOpenHandler = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
	f26_arg0:registerOmnvarHandler( f26_arg1, function ( f27_arg0, f27_arg1 )
		if f27_arg1.value then
			LUI.FlowManager.RequestAddMenu( f26_arg2, false, false, false )
			f27_arg0:UpdateWidgetsVisibility()
		end
	end )
	if f26_arg3 and Game.GetOmnvar( f26_arg1 ) then
		LUI.FlowManager.RequestAddMenu( f26_arg2, false, false, false )
	end
end

LUI.HUD.processEvent = function ( f28_arg0, f28_arg1 )
	if IsInputEvent( f28_arg1.name ) then
		return false
	else
		return LUI.UIElement.processEvent( f28_arg0, f28_arg1 )
	end
end

