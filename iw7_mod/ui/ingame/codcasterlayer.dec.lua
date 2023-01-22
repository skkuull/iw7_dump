LUI.CodcasterLayer = LUI.Class( LUI.UIElement )
LUI.CodcasterLayer.init = function ( f1_arg0, f1_arg1 )
	LUI.CodcasterLayer.super.init( f1_arg0 )
	f1_arg0.id = "CodcasterLayer"
	f1_arg0._controllerIndex = f1_arg1
	f1_arg0.shiftKeyPressed = false
end

LUI.CodcasterLayer.GetInstance = function ()
	local f2_local0 = Engine.GetLuiRoot()
	assert( f2_local0 )
	local f2_local1 = f2_local0.codcasterLayer
	assert( f2_local1 )
	return f2_local1
end

local f0_local0 = function ()
	local f3_local0 = true
	if Game.GetOmnvar( "post_game_state" ) ~= PostGameState.INACTIVE then
		f3_local0 = false
	end
	return f3_local0
end

local f0_local1 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = MLG.ShoutcasterProfileVarBool( f4_arg0._controllerIndex, "shoutcaster_qs_playerlist" ) and 1 or 0
	local f4_local1 = f4_arg0._codcasterPlayerList
	local f4_local2 = f4_local1
	f4_local1 = f4_local1.SetAlpha
	local f4_local3
	if f4_arg1 then
		f4_local3 = 0
		if not f4_local3 then
		
		else
			f4_local1( f4_local2, f4_local3 )
			f4_arg0.previousHeaderValue = MLG.ShoutcasterProfileVarBool( f4_arg0._controllerIndex, "shoutcaster_qs_scorepanel" )
			f4_local1 = f4_arg0.previousHeaderValue and 1 or 0
			f4_local2 = f4_arg0._codcasterHeader
			f4_local3 = f4_local2
			f4_local2 = f4_local2.SetAlpha
			local f4_local4
			if f4_arg1 then
				f4_local4 = 0
				if not f4_local4 then
				
				else
					f4_local2( f4_local3, f4_local4 )
					f4_local2 = MLG.ShoutcasterProfileVarBool( f4_arg0._controllerIndex, "shoutcaster_toolbar" ) and 1 or 0
					f4_local3 = f4_arg0._codcasterToolbar
					f4_local4 = f4_local3
					f4_local3 = f4_local3.SetAlpha
					local f4_local5
					if f4_arg1 then
						f4_local5 = 0
						if not f4_local5 then
						
						else
							f4_local3( f4_local4, f4_local5 )
							f4_local3 = f4_arg0._codcasterLoadout
							f4_local4 = f4_local3
							f4_local3 = f4_local3.SetAlpha
							if not f4_arg1 then
								f4_local5 = 1
								if not f4_local5 then
								
								else
									f4_local3( f4_local4, f4_local5 )
									if f4_arg1 then
										f4_arg0._codcasterMinimap:SetAlpha( 0 )
										if f4_arg0._codCasterAnnouncement ~= nil then
											f4_arg0._codCasterAnnouncement:SetAlpha( 0 )
										end
									else
										f4_arg0:RefreshMinimap()
									end
									if f4_arg0.isQSVisible then
										LUI.CodcasterLayer.ToggleQuickSettings( f4_arg0, f4_arg0._controllerIndex )
										f4_arg0:CloseQS()
									end
									if f4_arg0.isSSVisible then
										LUI.CodcasterLayer.ToggleSideSettings( f4_arg0, f4_arg0._controllerIndex, "display" )
										f4_arg0:CloseSS()
									end
									f4_arg0._codcasterPlayerCard:SetVisibility( f4_arg0._controllerIndex, not f4_arg1 )
								end
							end
							f4_local5 = 0
						end
					end
					f4_local5 = f4_local2
				end
			end
			f4_local4 = f4_local1
		end
	end
	f4_local3 = f4_local0
end

local f0_local2 = function ( f5_arg0, f5_arg1 )
	f0_local1( f5_arg0, f5_arg1 )
	f5_arg0._codcasterMinimap:SetAlpha( 1 )
end

LUI.CodcasterLayer.ShouldBeVisible = function ( f6_arg0 )
	local f6_local0 = Game.IsInitialized()
	if f6_local0 then
		f6_local0 = CODCASTER.IsCODCaster()
		if f6_local0 then
			if Game.GetOmnvar( "ui_mapshot_camera" ) == false then
				f6_local0 = f0_local0()
			else
				f6_local0 = false
			end
		end
	end
	return f6_local0
end

LUI.CodcasterLayer.InitAnnouncement = function ( f7_arg0 )
	if not f7_arg0._codCasterAnnouncement then
		local _codCasterAnnouncement = nil
		
		_codCasterAnnouncement = MenuBuilder.BuildRegisteredType( "CodCasterAnnouncementFeed", {
			controllerIndex = f7_arg0._controllerIndex
		} )
		_codCasterAnnouncement:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
		f7_arg0:addElement( _codCasterAnnouncement )
		f7_arg0._codCasterAnnouncement = _codCasterAnnouncement
		
		f7_arg0._codCasterAnnouncement:SetAlpha( 0 )
	end
end

LUI.CodcasterLayer.ToggleKeyboardShortcuts = function ( f8_arg0 )
	if not f8_arg0._codcasterKeyboardShortcuts then
		local _codcasterKeyboardShortcuts = nil
		
		_codcasterKeyboardShortcuts = MenuBuilder.BuildRegisteredType( "CodcasterKeyboardShortcutsInGame", {
			controllerIndex = f8_arg0._controllerIndex
		} )
		f8_arg0:addElement( _codcasterKeyboardShortcuts )
		f8_arg0._codcasterKeyboardShortcuts = _codcasterKeyboardShortcuts
		
	else
		LUI.CodcasterLayer.CloseKeyboardShortcuts( f8_arg0 )
	end
end

LUI.CodcasterLayer.CloseKeyboardShortcuts = function ( f9_arg0 )
	f9_arg0._codcasterKeyboardShortcuts:closeChildren()
	f9_arg0._codcasterKeyboardShortcuts:close()
	f9_arg0._codcasterKeyboardShortcuts = nil
end

LUI.CodcasterLayer.UpdateLoadoutFocus = function ( f10_arg0 )
	if f10_arg0.isLoadoutVisible then
		if f10_arg0.isQSVisible == false and f10_arg0.isSSVisible == false then
			f10_arg0._codcasterLoadout:LoadoutGainFocus()
		else
			f10_arg0._codcasterLoadout:LoadoutLoseFocus()
		end
	end
end

LUI.CodcasterLayer.InitQuickSettings = function ( f11_arg0 )
	if not f11_arg0._codcasterQS and not f11_arg0._codcasterKeyboardShortcuts then
		local f11_local0 = nil
		f11_local0 = MenuBuilder.BuildRegisteredType( "CodCasterQuickSettingsInGame", {
			controllerIndex = f11_arg0._controllerIndex
		} )
		LUI.UIElement.addElementBefore( f11_local0, f11_arg0._codcasterToolbar )
		f11_arg0._codcasterQS = f11_local0
		f11_arg0._codcasterQS:SetAlpha( 0 )
		f11_arg0.isQSVisible = false
	end
end

LUI.CodcasterLayer.InitSideSettings = function ( f12_arg0 )
	f12_arg0._codcasterSS = nil
	f12_arg0.isSSVisible = false
end

LUI.CodcasterLayer.InstantiateSideSettings = function ( f13_arg0, f13_arg1 )
	local f13_local0 = MenuBuilder.BuildRegisteredType( "CodCasterSettingsInGame", {
		controllerIndex = f13_arg0._controllerIndex,
		menuToShow = f13_arg1
	} )
	LUI.UIElement.addElementBefore( f13_local0, f13_arg0._codcasterToolbar )
	f13_arg0._codcasterSS = f13_local0
end

LUI.CodcasterLayer.InitLayer = function ( f14_arg0 )
	Engine.MeasureResourceEventStart( "LUI.CodcasterLayer.InitLayer" )
	f14_arg0._awardFeed = MenuBuilder.BuildRegisteredType( "AwardFeed", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._awardFeed:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -150, _1080p * 280, _1080p * 270, _1080p * 395 )
	f14_arg0:addElement( f14_arg0._awardFeed )
	f14_arg0._codcasterPlayerList = MenuBuilder.BuildRegisteredType( "CodCasterPlayerList", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterPlayerList:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterPlayerList )
	f14_arg0._codcasterPlayerList:GiveFocus()
	LUI.CodcasterLayer.InitAnnouncement( f14_arg0 )
	f14_arg0._codcasterHeader = MenuBuilder.BuildRegisteredType( "CodCasterHeaderWidget", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterHeader:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterHeader )
	f14_arg0._codcasterMinimap = MenuBuilder.BuildRegisteredType( "CodcasterMinimap", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterMinimap:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0.isMinimapVisible = false
	f14_arg0:addElement( f14_arg0._codcasterMinimap )
	f14_arg0._awardMessageQueue = LUI.UIMessageQueue.new( nil, {
		controller = 0,
		nextMessageDelay = 250
	} )
	f14_arg0:addElement( f14_arg0._awardMessageQueue )
	LUI.UIMessageQueue.AddWidget( f14_arg0._awardMessageQueue, f14_arg0._awardFeed, {
		messageType = LUI.UIMessageQueue.MessageType.PlayerAwards,
		dataSourcesFrom = {
			icon = DataSources.inGame.MP.awardQueue.icon,
			text = DataSources.inGame.MP.awardQueue.text,
			push = DataSources.inGame.MP.awardQueue.push
		},
		dataSourcesTo = {
			icon = DataSources.inGame.MP.awardEvents.icon,
			text = DataSources.inGame.MP.awardEvents.text,
			push = DataSources.inGame.MP.awardEvents.push
		}
	} )
	f14_arg0._codcasterPlayerCard = MenuBuilder.BuildRegisteredType( "CodcasterPlayerCard", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterPlayerCard:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterPlayerCard )
	f14_arg0._codcasterPlayerCard:SetPlayerSwitchVisibility( f14_arg0.isToolbarVisible )
	f14_arg0._codcasterLoadout = MenuBuilder.BuildRegisteredType( "CodCasterLoadout", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterLoadout:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterLoadout )
	f14_arg0._codcasterLoadout:SetLoadoutVisibility( false )
	f14_arg0._codcasterLoadout:SetRigContainerVisibility( false, f14_arg0._controllerIndex )
	f14_arg0.isLoadoutVisible = false
	f14_arg0._codcasterToolbar = MenuBuilder.BuildRegisteredType( "CodcasterToolbar", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterToolbar:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterToolbar )
	f14_arg0._codcasterToolbar:setLayoutCached( true )
	f14_arg0.isToolbarVisible = MLG.ShoutcasterProfileVarBool( f14_arg0._controllerIndex, "shoutcaster_toolbar" )
	f14_arg0._codcasterPlayerCard:AnimateSequence( f14_arg0.isToolbarVisible and "MoveUp" or "MoveDown" )
	f14_arg0._codcasterLoadout:AnimateSequence( f14_arg0.isToolbarVisible and "MoveUp" or "MoveDown" )
	if f14_arg0.isToolbarVisible == false then
		f14_arg0._codcasterToolbar._sequences.FadeOut()
	else
		f14_arg0._codcasterToolbar._sequences.FadeIn()
		f14_arg0._codcasterToolbar:SetAlpha( 1 )
	end
	if f14_arg0._codcasterKeyboardShortcuts ~= nil then
		LUI.CodcasterLayer.CloseKeyboardShortcuts( f14_arg0 )
	end
	f14_arg0:registerEventHandler( "playerstate_client_changed", LUI.CodcasterLayer.OnClientChanged )
	f14_arg0:registerEventHandler( "mlgspectator_loadout_changed", LUI.CodcasterLayer.RefreshLoadout )
	f14_arg0:registerEventHandler( "team_change", function ( element, event )
		element._codcasterHeader:PlayHeaderHighlightAnimation( event.controller, event.team )
	end )
	LUI.CodcasterLayer.InitSideSettings( f14_arg0 )
	f14_arg0._codcasterScreenBorder = MenuBuilder.BuildRegisteredType( "CodcasterScreenBorder", {
		controllerIndex = f14_arg0._controllerIndex
	} )
	f14_arg0._codcasterScreenBorder:SetAnchorsAndPosition( 0.5, 0.5, 0, 1, _1080p * -960, _1080p * 960, _1080p * 0, _1080p * 1080 )
	f14_arg0:addElement( f14_arg0._codcasterScreenBorder )
	f14_arg0._subscriptionToScoreboard = f14_arg0:SubscribeToModel( DataSources.inGame.HUD.isScoreboardOpen:GetModel( f14_arg0._controllerIndex ), function ( f16_arg0 )
		f14_arg0.isScoreboardOpen = DataModel.GetModelValue( f16_arg0 )
		if not f14_arg0.isScoreboardOpen and f14_arg0.isMinimapVisible then
			f0_local2( f14_arg0, f14_arg0.isMinimapVisible )
		else
			f0_local1( f14_arg0, f14_arg0.isScoreboardOpen )
		end
	end )
	LUI.CodcasterLayer.InitQuickSettings( f14_arg0 )
	f14_arg0._codcasterQS:closeChildren()
	f14_arg0._codcasterQS:close()
	f14_arg0._codcasterQS = nil
	f14_arg0._codcasterAnnouncement = nil
	f14_arg0._codcasterKeyboardShortcuts = nil
	f14_arg0:ToggleTeamIdentity( MLG.ShoutcasterProfileVarBool( f14_arg0._controllerIndex, "shoutcaster_team_identity" ) and 1 or 0 )
	LUI.CodcasterLayer.UpdateXray( MLG.ShoutcasterProfileVarValue( f14_arg0._controllerIndex, "shoutcaster_xray" ) )
	MLG.SetWaypointsEnabled( MLG.ShoutcasterProfileVarBool( f14_arg0._controllerIndex, "shoutcaster_waypoint_markers" ) )
	f14_arg0:registerEventHandler( "empty_menu_stack", function ( element )
		element:SetAlpha( 1 )
	end )
	f14_arg0:registerEventHandler( "non_empty_menu_stack", function ( element )
		element:SetAlpha( 0 )
	end )
	Engine.MeasureResourceEventEnd( "LUI.CodcasterLayer.InitLayer" )
	Engine.ReportMemoryUsage()
	Engine.ExecNow( "exec mp\\mlg_codcaster_unbind_keys.cfg" )
	f14_arg0.currentClientNum = -1
	local f14_local0 = LUI.HudManager.GetInstance()
	if f14_local0.activeHud ~= nil then
		f14_local0 = LUI.MPHUD.ToggleCodcasting
		local f14_local1 = LUI.HudManager.GetInstance()
		f14_local0( f14_local1.activeHud, true )
	end
end

LUI.CodcasterLayer.ClearLayer = function ( f19_arg0, f19_arg1 )
	if f19_arg0._subscriptionToScoreboard then
		f19_arg0:UnsubscribeFromModel( f19_arg0._subscriptionToScoreboard )
		f19_arg0._subscriptionToScoreboard = nil
	end
	f19_arg0:closeChildren()
	f19_arg0._codcasterToolbar = nil
	f19_arg0._codcasterPlayerList = nil
	f19_arg0._codcasterHeader = nil
	f19_arg0._codcasterMinimap = nil
	f19_arg0._codcasterQS = nil
	f19_arg0._codcasterSS = nil
	f19_arg0._codCasterAnnouncement = nil
	f19_arg0._codcasterScreenBorder = nil
	f19_arg0._codcasterLoadout = nil
	local f19_local0 = LUI.HudManager.GetInstance()
	if f19_local0.activeHud ~= nil then
		f19_local0 = LUI.MPHUD.ToggleCodcasting
		local f19_local1 = LUI.HudManager.GetInstance()
		f19_local0( f19_local1.activeHud, false )
	end
end

LUI.CodcasterLayer.ToggleToolbar = function ( f20_arg0 )
	if f20_arg0._codcasterToolbar then
		f20_arg0.isToolbarVisible = not f20_arg0.isToolbarVisible
		if f20_arg0.isToolbarVisible then
			f20_arg0._codcasterToolbar._sequences.FadeIn()
			f20_arg0._codcasterToolbar:SetAlpha( 1 )
			MLG.SetShoutcasterProfileVarValue( f20_arg0._controllerIndex, "shoutcaster_toolbar", 1 )
		else
			f20_arg0._codcasterToolbar._sequences.FadeOut()
			MLG.SetShoutcasterProfileVarValue( f20_arg0._controllerIndex, "shoutcaster_toolbar", 0 )
		end
		f20_arg0._codcasterLoadout:AnimateSequence( f20_arg0.isToolbarVisible and "MoveUp" or "MoveDown" )
		f20_arg0._codcasterPlayerCard:AnimateSequence( f20_arg0.isToolbarVisible and "MoveUp" or "MoveDown" )
		f20_arg0._codcasterPlayerCard:SetPlayerSwitchVisibility( f20_arg0.isToolbarVisible )
	end
end

LUI.CodcasterLayer.ToggleTeamIdentity = function ( f21_arg0, f21_arg1 )
	if GameX.gameModeIsFFA( gameMode ) == false then
		f21_arg0._codcasterHeader:SetTeamLogosVisibility( f21_arg1 )
		f21_arg0._codcasterHeader:SetTeamNamesVisibility( f21_arg1 )
		f21_arg0._codcasterPlayerCard:SetTeamNameVisibility( f21_arg1 )
		f21_arg0._codcasterPlayerList:SetTeamNamesVisibility( f21_arg1 )
		local f21_local0 = LUI.HudManager.GetInstance()
		f21_local0 = f21_local0.activeHud
		if f21_local0 ~= nil then
			f21_local0.teamScores._widget:SetLogoVisibility( f21_arg1 )
			f21_local0.teamScores._widget:UpdateCodcasterMatchStatus()
		end
	end
end

LUI.CodcasterLayer.ToggleSpecificQuickSetting = function ( f22_arg0, f22_arg1, f22_arg2 )
	local f22_local0 = MLG.ShoutcasterProfileVarBool( f22_arg0._controllerIndex, f22_arg1 )
	local f22_local1 = nil
	if f22_local0 then
		f22_local1 = 0
		if f22_arg2 ~= nil then
			f22_arg2( false )
		end
	else
		f22_local1 = 1
		if f22_arg2 ~= nil then
			f22_arg2( true )
		end
	end
	MLG.SetShoutcasterProfileVarValue( f22_arg0._controllerIndex, f22_arg1, f22_local1 )
	return f22_local1
end

LUI.CodcasterLayer.ToggleThirdPerson = function ( f23_arg0 )
	LUI.CodcasterLayer.ToggleSpecificQuickSetting( f23_arg0, "shoutcaster_qs_thirdperson", MLG.SetThirdPerson )
end

LUI.CodcasterLayer.ToggleXRay = function ( f24_arg0 )
	LUI.CodcasterLayer.ToggleSpecificQuickSetting( f24_arg0, "shoutcaster_qs_xray", MLG.SetPlayerOutlines )
end

LUI.CodcasterLayer.TogglePlayerNumbers = function ( f25_arg0 )
	LUI.CodcasterLayer.ToggleSpecificQuickSetting( f25_arg0, "shoutcaster_qs_playernumbers", MLG.SetPlayerNumbersEnabled )
	f25_arg0._codcasterPlayerList:SetPlayerNumbersVisibility( f25_arg0._controllerIndex )
end

LUI.CodcasterLayer.TogglePlayerHUD = function ( f26_arg0 )
	LUI.CodcasterLayer.ToggleSpecificQuickSetting( f26_arg0, "shoutcaster_qs_playerhud", nil )
	local f26_local0 = LUI.HudManager.GetInstance()
	if f26_local0.activeHud ~= nil then
		f26_local0 = LUI.HUD.UpdateWidgetsVisibility
		local f26_local1 = LUI.HudManager.GetInstance()
		f26_local0( f26_local1.activeHud )
	end
end

LUI.CodcasterLayer.TogglePlayerCard = function ( f27_arg0 )
	local f27_local0 = LUI.CodcasterLayer.ToggleSpecificQuickSetting( f27_arg0, "shoutcaster_qs_playercard", nil )
	f27_arg0._codcasterPlayerCard:SetVisibility( f27_arg0._controllerIndex, f27_local0 )
	f27_arg0._codcasterLoadout:SetRigContainerVisibility( f27_local0, f27_arg0._controllerIndex )
	f27_arg0._codcasterLoadout:UpdateLoadout( f27_arg0.isLoadoutVisible )
end

LUI.CodcasterLayer.TogglePlayerList = function ( f28_arg0 )
	f28_arg0._codcasterPlayerList:SetAlpha( LUI.CodcasterLayer.ToggleSpecificQuickSetting( f28_arg0, "shoutcaster_qs_playerlist", nil ) )
end

LUI.CodcasterLayer.ToggleScorePanel = function ( f29_arg0 )
	local f29_local0 = LUI.CodcasterLayer.ToggleSpecificQuickSetting( f29_arg0, "shoutcaster_qs_scorepanel", nil )
	f29_arg0._codcasterHeader:SetAlpha( f29_local0 )
	f29_arg0._codCasterAnnouncement:SetAlpha( f29_local0 )
end

LUI.CodcasterLayer.ToggleLoadout = function ( f30_arg0, f30_arg1 )
	if f30_arg0._codcasterLoadout then
		f30_arg0.isLoadoutVisible = not f30_arg0.isLoadoutVisible
		f30_arg0:RefreshLoadout()
	end
end

LUI.CodcasterLayer.RefreshLoadout = function ( f31_arg0 )
	if f31_arg0._codcasterLoadout and Game.GetPlayerClientnum() ~= Game.GetPlayerstateClientnum() then
		f31_arg0._codcasterLoadout:LoadoutLoseFocus()
		f31_arg0._codcasterLoadout:SetLoadoutVisibility( f31_arg0.isLoadoutVisible )
		f31_arg0._codcasterLoadout:UpdateLoadout( f31_arg0.isLoadoutVisible )
		f31_arg0._codcasterPlayerCard:UpdateSpectator( f31_arg0._controllerIndex )
		if f31_arg0.isLoadoutVisible and f31_arg0.isQSVisible == false and f31_arg0.isSSVisible == false then
			f31_arg0._codcasterLoadout:LoadoutGainFocus()
		end
	end
end

LUI.CodcasterLayer.OnClientChanged = function ()
	local f32_local0 = LUI.CodcasterLayer.GetInstance()
	local f32_local1 = Game.GetPlayerstateClientnum()
	if f32_local0.currentClientNum ~= f32_local1 and f32_local1 ~= Game.GetPlayerClientnum() then
		LUI.CodcasterLayer.RefreshLoadout( f32_local0 )
		if GameX.gameModeIsFFA( gameMode ) == false then
			local f32_local2 = LUI.HudManager.GetInstance()
			f32_local2 = f32_local2.activeHud
			if f32_local2 ~= nil then
				f32_local2.teamScores._widget:UpdateCodcasterMatchStatus()
			end
		end
		f32_local0.currentClientNum = f32_local1
	end
end

LUI.CodcasterLayer.ToggleMinimap = function ( f33_arg0 )
	if f33_arg0._codcasterMinimap then
		f33_arg0.isMinimapVisible = not f33_arg0.isMinimapVisible
		f0_local2( f33_arg0, f33_arg0.isMinimapVisible )
		f33_arg0._codcasterMinimap:SetAlpha( 1 )
		f33_arg0:RefreshMinimap()
		if f33_arg0.isMinimapVisible and f33_arg0._codcasterKeyboardShortcuts then
			LUI.CodcasterLayer.CloseKeyboardShortcuts( f33_arg0 )
		end
	end
end

LUI.CodcasterLayer.RefreshMinimap = function ( f34_arg0 )
	if f34_arg0._codcasterMinimap then
		local f34_local0 = {
			minimapOptions = {},
			minimapOptions = true,
			minimapOptions = true,
			minimapOptions = true,
			minimapOptions = true,
			alpha = 1
		}
		if f34_arg0.isMinimapVisible then
			f34_local0.minimapOptions.mapAlpha = 1
			f34_local0.minimapOptions.compassType = CoD.CompassType.Full
			f34_local0.minimapOptions.cropPartialMap = false
			f34_local0.showExtras = 0
			f34_local0.mapType = "FullScreen"
		else
			f34_local0.minimapOptions.mapAlpha = 0.8
			local f34_local1 = MLG.ShoutcasterProfileVarValue( f34_arg0._controllerIndex, "shoutcaster_minimap" )
			if f34_local1 == 1 then
				f34_local0.mapType = "CornerStandard"
				f34_local0.alpha = 0
				f34_local0.minimapOptions.drawMap = false
				f34_local0.minimapOptions.drawPlayer = false
				f34_local0.minimapOptions.drawOthers = false
				f34_local0.minimapOptions.drawItems = false
				f34_local0.minimapOptions.cropPartialMap = false
				f34_local0.showExtras = 0
			elseif f34_local1 == 2 then
				f34_local0.mapType = "CornerStandard"
				f34_local0.minimapOptions.compassType = CoD.CompassType.Partial
				f34_local0.minimapOptions.cropPartialMap = false
				f34_local0.showExtras = 1
			elseif f34_local1 == 0 then
				f34_local0.mapType = "CornerFullsize"
				f34_local0.minimapOptions.compassType = CoD.CompassType.Partial
				f34_local0.minimapOptions.cropPartialMap = true
				f34_local0.showExtras = 0
			else
				assert( false, "Unknown value for MinimapStyle" )
			end
		end
		f34_arg0._codcasterMinimap:UpdateSettings( f34_local0 )
	end
end

LUI.CodcasterLayer.SetUIVisible = function ( f35_arg0, f35_arg1 )
	if f35_arg0 then
		local f35_local0 = f35_arg0
		local f35_local1 = f35_arg0.SetAlpha
		local f35_local2
		if f35_arg1 then
			f35_local2 = 1
			if not f35_local2 then
			
			else
				f35_local1( f35_local0, f35_local2 )
			end
		end
		f35_local2 = 0
	end
end

LUI.CodcasterLayer.CloseQS = function ( f36_arg0 )
	if f36_arg0._codcasterQS then
		f36_arg0._codcasterQS:closeChildren()
		f36_arg0._codcasterQS:close()
		f36_arg0._codcasterQS = nil
		f36_arg0.requestCloseQS = false
	end
end

LUI.CodcasterLayer.ToggleQuickSettings = function ( f37_arg0, f37_arg1 )
	if f37_arg0._codcasterKeyboardShortcuts then
		LUI.CodcasterLayer.CloseKeyboardShortcuts( f37_arg0 )
	end
	LUI.CodcasterLayer.InitQuickSettings( f37_arg0 )
	f37_arg0.isQSVisible = not f37_arg0.isQSVisible
	LUI.CodcasterLayer.UpdateLoadoutFocus( f37_arg0 )
	if f37_arg0.isQSVisible then
		if f37_arg0.isSSVisible then
			LUI.CodcasterLayer.ToggleSideSettings( f37_arg0, f37_arg1, "display" )
			f37_arg0:CloseSS()
		end
		f37_arg0._codcasterQS:SetAlpha( 1 )
		if f37_arg0._codcasterKeyboardShortcuts then
			LUI.CodcasterLayer.CloseKeyboardShortcuts( f37_arg0 )
		end
		f37_arg0._codcasterToolbar:GrayOutPrompts( f37_arg1, false )
		ACTIONS.AnimateSequence( f37_arg0._codcasterQS, "Appear" )
		ACTIONS.GainFocus( f37_arg0._codcasterQS, "CodCasterQuickSettings", f37_arg1 )
		f37_arg0._codcasterPlayerList:RemoveFocus()
		f37_arg0.requestCloseQS = false
	else
		f37_arg0._codcasterToolbar:GrayOutPrompts( f37_arg1, true )
		ACTIONS.AnimateSequence( f37_arg0._codcasterQS, "Disappear" )
		ACTIONS.LoseFocus( f37_arg0._codcasterQS, "CodCasterQuickSettings", f37_arg1 )
		f37_arg0._codcasterPlayerList:GiveFocus()
		f37_arg0.requestCloseQS = true
		local f37_local0 = f37_arg0:Wait( 300 )
		f37_local0.onComplete = function ()
			if f37_arg0.requestCloseQS then
				f37_arg0:CloseQS()
			end
		end
		
	end
end

LUI.CodcasterLayer.CloseSS = function ( f39_arg0 )
	if f39_arg0._codcasterSS then
		f39_arg0._codcasterSS:closeChildren()
		f39_arg0._codcasterSS:close()
		f39_arg0._codcasterSS = nil
		f39_arg0.requestCloseSS = false
	end
end

LUI.CodcasterLayer.ToggleSideSettings = function ( f40_arg0, f40_arg1, f40_arg2 )
	f40_arg0.isSSVisible = not f40_arg0.isSSVisible
	LUI.CodcasterLayer.UpdateLoadoutFocus( f40_arg0 )
	if f40_arg0.isSSVisible then
		if f40_arg0._codcasterSS == nil or f40_arg0.requestCloseSS then
			if f40_arg0._codcasterSS ~= nil then
				f40_arg0:CloseSS()
			end
			LUI.CodcasterLayer.InstantiateSideSettings( f40_arg0, f40_arg2 )
		end
		if f40_arg0.isQSVisible then
			LUI.CodcasterLayer.ToggleQuickSettings( f40_arg0, f40_arg1 )
			f40_arg0:CloseQS()
		end
		if f40_arg0._codcasterKeyboardShortcuts then
			LUI.CodcasterLayer.CloseKeyboardShortcuts( f40_arg0 )
		end
		f40_arg0._codcasterToolbar:GrayOutPrompts( f40_arg1, false )
		ACTIONS.AnimateSequence( f40_arg0._codcasterSS, "Appear" )
		ACTIONS.AnimateSequence( f40_arg0._codcasterSS, "ChildAppear" )
		f40_arg0._codcasterSS:UpdateFocus( f40_arg1, true )
		f40_arg0._codcasterPlayerList:RemoveFocus()
	else
		f40_arg0._codcasterSS:UpdateFocus( f40_arg1, false )
		f40_arg0._codcasterToolbar:GrayOutPrompts( f40_arg1, true )
		ACTIONS.AnimateSequence( f40_arg0._codcasterSS, "Disappear" )
		f40_arg0._codcasterPlayerList:GiveFocus()
		f40_arg0.requestCloseSS = true
		local f40_local0 = f40_arg0:Wait( 300 )
		f40_local0.onComplete = function ()
			if f40_arg0.requestCloseSS then
				f40_arg0:CloseSS()
			end
		end
		
	end
end

LUI.CodcasterLayer.UpdateXray = function ( f42_arg0 )
	MLG.SetPlayerOutlineViewMode( MLG.GetXrayModeByShoutcasterValue( f42_arg0 ) )
end

LUI.CodcasterLayer.FocusChanged = function ( f43_arg0, f43_arg1 )
	f43_arg0._codcasterQS:dispatchEventToChildren( {
		name = "update_button_description",
		text = "test test test" or ""
	} )
end

LUI.CodcasterLayer.ProcessQuickSettingChangedEvent = function ( f44_arg0, f44_arg1 )
	if f44_arg1.setting_name == "player_list" then
		LUI.CodcasterLayer.SetUIVisible( f44_arg0._codcasterPlayerList, f44_arg1.setting_value )
	elseif f44_arg1.setting_name == "score_panel" then
		LUI.CodcasterLayer.SetUIVisible( f44_arg0._codcasterHeader, f44_arg1.setting_value )
		if f44_arg0.previousHeaderValue ~= f44_arg1.setting_value then
			f44_arg0._codCasterAnnouncement:SetAlpha( f44_arg1.setting_value and 1 or 0 )
			f44_arg0.previousHeaderValue = f44_arg1.setting_value
		end
	elseif f44_arg1.setting_name == "player_card" then
		f44_arg0._codcasterPlayerCard:SetVisibility( f44_arg0._controllerIndex, f44_arg1.setting_value )
		f44_arg0._codcasterLoadout:SetRigContainerVisibility( f44_arg1.setting_value, f44_arg0._controllerIndex )
		f44_arg0._codcasterLoadout:UpdateLoadout( f44_arg0.isLoadoutVisible )
	elseif f44_arg1.setting_name == "player_numbers" then
		f44_arg0._codcasterPlayerList:SetPlayerNumbersVisibility( f44_arg0._controllerIndex )
		MLG.SetPlayerNumbersEnabled( f44_arg1.setting_value )
	elseif f44_arg1.setting_name == "listen_in" then
		f44_arg0._codcasterPlayerList:SetListenInVisibility( f44_arg0._controllerIndex )
		MLG.SetListenIn( f44_arg1.setting_value )
	elseif f44_arg1.setting_name == "playernameplates" and Game.IsInitialized() then
		local f44_local0 = f44_arg1.setting_value and 1 or 0
		local f44_local1 = Engine.GetLuiRoot()
		f44_local1.inWorldManager.playerNameplates:SetAlpha( f44_local0 )
	end
	if f44_arg0.isScoreboardOpen then
		f0_local1( f44_arg0, f44_arg0.isScoreboardOpen )
	end
end

LUI.CodcasterLayer.ProcessDisplaySettingChangedEvent = function ( f45_arg0, f45_arg1 )
	local f45_local0 = f45_arg1.setting_name
	if f45_local0 == "shoutcaster_minimap" then
		f45_arg0:RefreshMinimap()
	elseif f45_local0 == "shoutcaster_toolbar" then
		f45_arg0:ToggleToolbar()
	elseif f45_local0 == "shoutcaster_team_identity" then
		f45_arg0:ToggleTeamIdentity( f45_arg1.setting_value )
	elseif f45_local0 == "shoutcaster_xray" then
		LUI.CodcasterLayer.UpdateXray( f45_arg1.setting_value )
	elseif f45_local0 == "shoutcaster_waypoint_markers" then
		MLG.SetWaypointsEnabled( MLG.ShoutcasterProfileVarBool( f45_arg0._controllerIndex, "shoutcaster_waypoint_markers" ) )
	end
end

LUI.CodcasterLayer.ProcessSettingChangedEvent = function ( f46_arg0, f46_arg1 )
	local f46_local0 = true
	if f46_arg1.setting_category == "display" then
		LUI.CodcasterLayer.ProcessDisplaySettingChangedEvent( f46_arg0, f46_arg1 )
	elseif f46_arg1.setting_category == "quick" then
		LUI.CodcasterLayer.ProcessQuickSettingChangedEvent( f46_arg0, f46_arg1 )
	elseif f46_arg1.setting_category == "loadout" then
		if Game.GetPlayerstateClientnum() ~= Game.GetPlayerClientnum() then
			f46_arg0._codcasterLoadout:UpdateLoadout( f46_arg0.isLoadoutVisible )
		elseif f46_arg0.currentClientNum >= 0 then
			f46_arg0._codcasterLoadout:UpdateLoadout( f46_arg0.isLoadoutVisible, f46_arg0.currentClientNum )
		end
	end
	if f46_arg1.update_WidgetVisibility then
		local f46_local1 = LUI.HudManager.GetInstance()
		if f46_local1.activeHud ~= nil then
			f46_local1 = LUI.HUD.UpdateWidgetsVisibility
			local f46_local2 = LUI.HudManager.GetInstance()
			f46_local1( f46_local2.activeHud )
		end
	end
	return f46_local0
end

LUI.CodcasterLayer.ProcessQSInputEvent = function ( f47_arg0, f47_arg1 )
	f47_arg0._codcasterQS:processEvent( f47_arg1 )
	if f47_arg1.name == "gamepad_button" and f47_arg1.down then
		if f47_arg1.button == "left_trigger" or f47_arg1.button == "q" then
			LUI.CodcasterLayer.ToggleQuickSettings( f47_arg0, f47_arg1.controller )
		elseif f47_arg1.button == "right_trigger" or f47_arg1.button == "w" then
			LUI.CodcasterLayer.ToggleSideSettings( f47_arg0, f47_arg1.controller, "display" )
		elseif f47_arg1.button == "e" then
			LUI.CodcasterLayer.ToggleSideSettings( f47_arg0, f47_arg1.controller, "loadout" )
		end
	end
end

LUI.CodcasterLayer.ProcessSSInputEvent = function ( f48_arg0, f48_arg1 )
	f48_arg0._codcasterSS:processEvent( f48_arg1 )
	if f48_arg1.name == "gamepad_button" and f48_arg1.down then
		if f48_arg1.button == "right_trigger" then
			if f48_arg1.qualifier == "gamepad" then
				LUI.CodcasterLayer.ToggleSideSettings( f48_arg0, f48_arg1.controller, "display" )
			elseif f48_arg1.qualifier == "keyboard" then
				if f48_arg0._codcasterSS._visibleMenu == "display" then
					f48_arg0._codcasterSS:ToggleVisibleMenu( controllerIndex )
				else
					LUI.CodcasterLayer.ToggleSideSettings( f48_arg0, f48_arg1.controller, "loadout" )
				end
			end
		elseif f48_arg1.button == "w" then
			if f48_arg0._codcasterSS._visibleMenu == "loadout" then
				f48_arg0._codcasterSS:ToggleVisibleMenu( controllerIndex )
			else
				LUI.CodcasterLayer.ToggleSideSettings( f48_arg0, f48_arg1.controller, "display" )
			end
		elseif f48_arg1.button == "e" then
			if f48_arg0._codcasterSS._visibleMenu == "display" then
				f48_arg0._codcasterSS:ToggleVisibleMenu( controllerIndex )
			else
				LUI.CodcasterLayer.ToggleSideSettings( f48_arg0, f48_arg1.controller, "loadout" )
			end
		elseif f48_arg1.button == "shoulderr" or f48_arg1.button == "shoulderl" then
			f48_arg0._codcasterSS:ToggleVisibleMenu( controllerIndex )
		elseif f48_arg1.button == "left_trigger" or f48_arg1.button == "q" then
			LUI.CodcasterLayer.ToggleQuickSettings( f48_arg0, f48_arg1.controller )
		end
	end
end

LUI.CodcasterLayer.TrapsInput = function ( f49_arg0, f49_arg1 )
	if Engine.GetDvarBool( "cg_mlg_static_cameras_editing" ) == true then
		for f49_local0 = 1, 12, 1 do
			if f49_arg1.button == "f" .. f49_local0 then
				return true
			end
		end
		return false
	elseif f49_arg1.name == "gamepad_button" and f49_arg1.button == "start" and f49_arg1.qualifier == "gamepad" then
		return false
	else
		return true
	end
end

LUI.CodcasterLayer.HandleStagedCameras = function ( f50_arg0 )
	local f50_local0 = false
	if Engine.GetDvarBool( "cg_mlg_static_cameras" ) == false then
		return false
	end
	for f50_local1 = 1, 12, 1 do
		if f50_arg0 == "f" .. f50_local1 then
			MLG.SetCamera( f50_local1 - 1 )
			f50_local0 = true
			break
		end
	end
	return f50_local0
end

LUI.CodcasterLayer.ProcessInputEvent = function ( f51_arg0, f51_arg1 )
	local f51_local0 = false
	if f51_arg0.isSSVisible then
		f51_arg0:ProcessSSInputEvent( f51_arg1 )
		f51_local0 = true
	elseif f51_arg0.isQSVisible then
		f51_arg0:ProcessQSInputEvent( f51_arg1 )
		f51_local0 = true
	end
	local f51_local1 = f51_arg0.m_eventHandlers[f51_arg1.name]
	if not f51_local0 and f51_local1 then
		f51_local0 = f51_local1( f51_arg0, f51_arg1 )
	end
	if f51_arg1.name == "gamepad_button" then
		if f51_arg1.button == "shift" then
			f51_arg0.shiftKeyPressed = f51_arg1.down
		elseif not f51_local0 and f51_arg1.down then
			local f51_local2 = tonumber( f51_arg1.button )
			if string.find( f51_arg1.button, "numpad_" ) then
				f51_local2 = tonumber( string.gsub( f51_arg1.button, "numpad_", "" ) )
			end
			if f51_local2 ~= nil then
				f51_arg0._codcasterPlayerList:FollowPlayerNumber( f51_local2, f51_arg1.controller )
			elseif LUI.CodcasterLayer.HandleStagedCameras( f51_arg1.button ) then
				f51_arg0._codcasterPlayerCard:SetVisibility( f51_arg1.controller, false )
				f51_local0 = true
			elseif f51_arg1.button == "tab" then
				f51_arg0:dispatchEventToRoot( {
					name = "togglescores",
					immediate = true
				} )
				f51_local0 = true
			elseif not f51_arg0.isScoreboardOpen then
				if f51_arg1.button == "m" or Engine.IsGamepadEnabled() == 1 and f51_arg1.button == "alt1" then
					LUI.CodcasterLayer.ToggleMinimap( f51_arg0 )
					f51_local0 = true
				elseif not f51_arg0.isMinimapVisible then
					if f51_arg1.button == "secondary" or f51_arg1.button == "r" then
						LUI.CodcasterLayer.ToggleToolbar( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "alt2" then
						if Engine.IsGamepadEnabled() == 1 then
							LUI.CodcasterLayer.ToggleLoadout( f51_arg0 )
							f51_local0 = true
						end
					elseif f51_arg1.button == "l" then
						LUI.CodcasterLayer.ToggleLoadout( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "shoulderr" or f51_arg1.button == "dot" then
						f51_arg0._codcasterPlayerList:FollowNextPlayer( f51_arg1.controller )
						f51_local0 = true
					elseif f51_arg1.button == "shoulderl" or f51_arg1.button == "comma" then
						f51_arg0._codcasterPlayerList:FollowPreviousPlayer( f51_arg1.controller )
						f51_local0 = true
					elseif f51_arg1.button == "primary" then
						f51_arg0._codcasterPlayerList:FollowSelectedPlayer( f51_arg1.controller )
						f51_local0 = true
					elseif f51_arg1.button == "left_trigger" or f51_arg1.button == "q" then
						LUI.CodcasterLayer.ToggleQuickSettings( f51_arg0, f51_arg1.controller )
						f51_local0 = true
					elseif f51_arg1.button == "w" then
						LUI.CodcasterLayer.ToggleSideSettings( f51_arg0, f51_arg1.controller, "display" )
						f51_local0 = true
					elseif f51_arg1.button == "right_trigger" then
						if f51_arg1.qualifier == "keyboard" then
							LUI.CodcasterLayer.ToggleSideSettings( f51_arg0, f51_arg1.controller, "loadout" )
						elseif f51_arg1.qualifier == "gamepad" then
							LUI.CodcasterLayer.ToggleSideSettings( f51_arg0, f51_arg1.controller, "display" )
						end
						f51_local0 = true
					elseif f51_arg1.button == "e" then
						LUI.CodcasterLayer.ToggleSideSettings( f51_arg0, f51_arg1.controller, "loadout" )
						f51_local0 = true
					elseif f51_arg1.button == "down" or f51_arg1.button == "up" then
						f51_local0 = f51_arg0._codcasterPlayerList:ProcessDpadButtonEvent( f51_arg1 )
					elseif f51_arg1.button == "start" then
						f51_local0 = f51_arg0._codcasterPlayerList:FollowNextAlivePlayer( f51_arg1.controller )
					elseif f51_arg1.button == "t" then
						LUI.CodcasterLayer.ToggleThirdPerson( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "x" then
						LUI.CodcasterLayer.ToggleXRay( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "n" then
						LUI.CodcasterLayer.TogglePlayerNumbers( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "h" then
						LUI.CodcasterLayer.TogglePlayerHUD( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "y" then
						LUI.CodcasterLayer.TogglePlayerList( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "s" then
						LUI.CodcasterLayer.ToggleScorePanel( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "c" then
						LUI.CodcasterLayer.TogglePlayerCard( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "k" then
						LUI.CodcasterLayer.ToggleKeyboardShortcuts( f51_arg0 )
						f51_local0 = true
					elseif f51_arg1.button == "i" then
						LUI.CodcasterLayer.ToggleSpecificQuickSetting( f51_arg0, "shoutcaster_cameraicon", nil )
						f51_local0 = true
					elseif f51_arg1.button == "left" or f51_arg1.button == "right" then
						if f51_arg0.isLoadoutVisible then
							f51_local0 = f51_arg0._codcasterLoadout:ProcessDpadButtonEvent( f51_arg1 )
						end
					elseif f51_arg1.button == "right_stick" or f51_arg1.button == "f" then
						MLG.FollowDrone( MLG.IsMLGFollowDroneActive() and 0 or 1 )
						f51_local0 = true
					end
				end
			end
		end
	end
	return f51_local0
end

LUI.CodcasterLayer.ProcessShowAnnouncement = function ( f52_arg0, f52_arg1 )
	f52_arg0._codcasterHeader.CodCasterHeaderTeamBased:HideObjectiveInfo()
	return true
end

LUI.CodcasterLayer.ProcessHideAnnouncement = function ( f53_arg0, f53_arg1 )
	f53_arg0._codcasterHeader.CodCasterHeaderTeamBased:ShowObjectiveInfo()
	return true
end

LUI.CodcasterLayer.processEvent = function ( f54_arg0, f54_arg1 )
	if IsInputEvent( f54_arg1.name ) then
		return f54_arg0:ProcessInputEvent( f54_arg1 )
	elseif f54_arg1.name == "codcaster_setting_change" then
		return f54_arg0:ProcessSettingChangedEvent( f54_arg1 )
	elseif f54_arg1.name == "codcaster_show_announcement" then
		return f54_arg0:ProcessShowAnnouncement( f54_arg1 )
	elseif f54_arg1.name == "codcaster_hide_announcement" then
		return f54_arg0:ProcessHideAnnouncement( f54_arg1 )
	else
		return LUI.CodcasterLayer.super.processEvent( f54_arg0, f54_arg1 )
	end
end

