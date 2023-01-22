local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
CoD.PrintModuleLoad( _NAME )
f0_local0 = 750
f0_local1 = 100
f0_local2 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = ""
	if f1_arg1.value == "waiting_for_teams" then
		if not GameX.gameModeIsFFA() then
			f1_local0 = Engine.Localize( "@MP_WAITING_FOR_TEAMS" )
		else
			f1_local0 = Engine.Localize( "@MP_WAITING_FOR_MORE_PLAYERS" )
		end
	elseif f1_arg1.value == "opponent_forfeiting_in" then
		f1_local0 = Engine.Localize( "@MP_OPPONENT_FORFEITING_IN" )
	elseif f1_arg1.value == "match_starting_in" then
		f1_local0 = Engine.Localize( "@MP_MATCH_STARTING_IN" )
	elseif f1_arg1.value == "match_resuming_in" then
		f1_local0 = Engine.Localize( "@MP_MATCH_RESUMING_IN" )
	elseif f1_arg1.value == "first_infected_in" then
		f1_local0 = Engine.Localize( "@SPLASHES_INFECTED_STARTS_IN" )
	end
	f1_arg0:setText( ToUpperCase( f1_local0 ) )
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	if f2_arg1.value > 0 then
		if f2_arg0.current_state ~= "active" then
			f2_arg0:animateToState( "active", 0 )
			f2_arg0.current_state = "active"
			f0_local2( f2_arg0:getChildById( "matchStartDesc" ), {
				name = "ui_match_start_text",
				value = Game.GetOmnvar( "ui_match_start_text" )
			} )
		end
	elseif f2_arg0.current_state ~= "default" then
		f2_arg0:animateToState( "default", 0 )
		f2_arg0.current_state = "default"
		return 
	end
	local f2_local0 = f2_arg0:getChildById( "countdownContainer" )
	local f2_local1 = f2_local0:getChildById( "countdownValueText" )
	local f2_local2 = f2_arg0:getChildById( "ghostedCountdownContainer" )
	local f2_local3 = f2_local2:getChildById( "ghostedCountdownValueText" )
	if Engine.IsActiveLocalClientPrimary( f2_arg1.controller ) and f2_arg1.value > 0 then
		local f2_local4 = "match_start_tick"
		if f2_arg1.value == 1 then
			f2_local4 = "match_start_tick_in1"
		elseif f2_arg1.value == 2 then
			f2_local4 = "match_start_tick_in2"
		elseif f2_arg1.value == 3 then
			f2_local4 = "match_start_tick_in3"
		end
		if not (AnyActiveMenusInStack( Engine.GetLuiRoot() ) or not LUI.RigBootup.HasPlayed() and Game.GetOmnvar( "ui_session_state" ) ~= "spectator") or f2_arg1.value < 5 then
			Engine.PlaySound( f2_local4 )
		end
	end
	f2_local1:setText( f2_arg1.value )
	f2_local3:setText( f2_arg1.value )
	local f2_local4 = MBh.AnimateSequence( {
		{
			"opening",
			0
		},
		{
			"active",
			f0_local1
		},
		{
			"active",
			f0_local0
		},
		{
			"default",
			150
		}
	} )
	f2_local4( f2_local0 )
	f2_local4 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f0_local1
		},
		{
			"active",
			0
		},
		{
			"closing",
			0
		}
	} )
	f2_local4( f2_local2 )
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.value == -1 then
		return 
	end
	local f3_local0 = Game.GetPlayerTeam()
	local f3_local1 = 0
	if f3_local0 > 0 then
		local f3_local2 = GameX.GetFactionName( f3_local0 )
		local f3_local3 = f3_arg0:getChildById( "faction_icon_container" )
		local f3_local4 = f3_local3:getChildById( "faction_icon" )
		if Engine.IsActiveLocalClientPrimary( f3_arg1.controller ) then
			Engine.PlaySound( "ui_iw7_match_faction_slam" )
			local f3_local5 = Engine.TableLookup( CSV.FactionTable.file, CSV.FactionTable.cols.ref, f3_local2, CSV.FactionTable.cols.splashSound )
			if f3_local5 and f3_local5 ~= "" then
				local f3_local6 = f3_arg0:Wait( 500 )
				f3_local6.onComplete = function ()
					Engine.PlaySound( f3_local5 )
				end
				
			end
		end
		local f3_local5 = f3_arg0:getChildById( "faction_name_parent_container" )
		local f3_local6 = f3_local5:getChildById( "faction_name_container" )
		local f3_local7 = f3_local5:getChildById( "faction_name_glint" )
		local f3_local8 = f3_local6:getChildById( "faction_name" )
		CoD.SetMaterial( f3_local4, RegisterMaterial( Engine.TableLookup( CSV.FactionTable.file, CSV.FactionTable.cols.ref, f3_local2, CSV.FactionTable.cols.factionHudIcon ) ) )
		f3_local8:setText( Engine.Localize( "@" .. Engine.TableLookup( CSV.FactionTable.file, CSV.FactionTable.cols.ref, f3_local2, CSV.FactionTable.cols.name ) ) )
		local f3_local9 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"active",
				125
			},
			{
				"active",
				2500,
				true,
				true
			},
			{
				"leaving",
				250
			}
		} )
		f3_local9( f3_local3 )
		local f3_local10 = MBh.AnimateSequence( {
			{
				"default",
				0
			},
			{
				"default",
				200
			},
			{
				"active",
				500,
				true,
				true
			},
			{
				"active",
				1850
			},
			{
				"default",
				250
			}
		} )
		f3_local10( f3_local6 )
		f3_local1 = 2750
	end
	local f3_local2 = Game.GetOmnvar( "ui_round_hint_override_attackers" )
	local f3_local3 = Game.GetOmnvar( "ui_round_hint_override_defenders" )
	local f3_local4 = GameX.GetGameMode()
	local f3_local5 = Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f3_local4, GameTypesTable.Cols.ObjectiveHintAttackers )
	if f3_arg1.value == 0 and f3_local2 ~= 0 then
		if f3_local4 == "ctf" then
			if f3_local2 == 1 then
				f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_SET_HINT"
			elseif f3_local2 == 2 then
				f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_ATTACK_HINT"
			elseif f3_local2 == 3 then
				f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_DEFEND_HINT"
			elseif f3_local2 == 4 then
				f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_SD_HINT"
			end
		elseif f3_local4 == "ball" then
			if f3_local2 == 1 then
				f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_SET_HINT"
			elseif f3_local2 == 2 then
				f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_ATTACK_HINT"
			elseif f3_local2 == 3 then
				f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_DEFEND_HINT"
			elseif f3_local2 == 4 then
				f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_SD_HINT"
			end
		elseif f3_local4 == "dd" then
			f3_local5 = "OBJECTIVES_DD_OVERTIME_HINT"
		end
	end
	if f3_arg1.value == 1 then
		if f3_local3 ~= 0 then
			if f3_local4 == "ctf" then
				if f3_local3 == 1 then
					f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_SET_HINT"
				elseif f3_local3 == 2 then
					f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_ATTACK_HINT"
				elseif f3_local3 == 3 then
					f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_DEFEND_HINT"
				elseif f3_local3 == 4 then
					f3_local5 = "OBJECTIVES_CTF_TIME_TO_BEAT_SD_HINT"
				end
			elseif f3_local4 == "ball" then
				if f3_local3 == 1 then
					f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_SET_HINT"
				elseif f3_local3 == 2 then
					f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_ATTACK_HINT"
				elseif f3_local3 == 3 then
					f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_DEFEND_HINT"
				elseif f3_local3 == 4 then
					f3_local5 = "OBJECTIVES_UPLINK_TIME_TO_BEAT_SD_HINT"
				end
			elseif f3_local4 == "dd" then
				f3_local5 = "OBJECTIVES_DD_OVERTIME_HINT"
			end
		else
			f3_local5 = Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f3_local4, GameTypesTable.Cols.ObjectiveHintDefenders )
		end
	end
	local f3_local6 = Engine.Localize( "@" .. f3_local5 )
	local f3_local7 = f3_arg0:getChildById( "objective_container" )
	local f3_local8 = f3_local7:getChildById( "objective_bg" )
	local f3_local11 = f3_local7:getChildById( "objective_text" )
	f3_local11:setText( f3_local6 )
	local f3_local12 = MBh.AnimateSequence( {
		{
			"default",
			0
		},
		{
			"default",
			f3_local1
		},
		{
			"active",
			150
		},
		{
			"active",
			2000
		},
		{
			"default",
			250
		}
	} )
	f3_local12( f3_local7 )
	f3_arg0:animateToState( "active", 0 )
end

function matchStartHudDef()
	local self = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		bottomAnchor = false,
		rightAnchor = false
	} )
	self.id = "matchStartHudDef"
	local f5_local1 = LUI.UIElement.new()
	self:addElement( f5_local1 )
	f5_local1.id = "matchStartHud"
	f5_local1:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = -32,
		bottom = 32,
		alpha = 0
	} )
	f5_local1:animateToState( "default", 0 )
	f5_local1:registerAnimationState( "active", {
		alpha = 1
	} )
	f5_local1:registerOmnvarHandler( "ui_match_start_countdown", f0_local3 )
	local f5_local2 = RegisterMaterial( "widg_gradient_center_out" )
	local f5_local3 = LUI.UIStyledText.new()
	f5_local3.id = "matchStartDesc"
	f5_local3:setText( "" )
	f5_local3:SetDecodeLetterLength( 25 )
	f5_local3:SetDecodeMaxRandChars( 3 )
	f5_local3:SetDecodeUpdatesPerLetter( 4 )
	f5_local3:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = -22,
		height = 24 * _1080p,
		alignment = LUI.Alignment.Center,
		font = FONTS.GetFont( FONTS.MainBold.File ),
		red = 1,
		green = 1,
		blue = 1
	} )
	f5_local3:animateToState( "default", 0 )
	local f5_local4 = LUI.UIImage.new()
	f5_local4.id = "desc_bg"
	f5_local4:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -26,
		height = 24,
		left = -400,
		right = 400,
		material = f5_local2,
		alpha = 1,
		red = COLORS.grey56.r,
		green = COLORS.grey56.g,
		blue = COLORS.grey56.b
	} )
	f5_local4:animateToState( "default", 0 )
	local f5_local5 = LUI.UIImage.new()
	f5_local5.id = "desc_bg_top_line"
	f5_local5:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -26,
		height = 1,
		left = -400,
		right = 400,
		material = f5_local2,
		alpha = 1,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f5_local5:animateToState( "default", 0 )
	local f5_local6 = LUI.UIImage.new()
	f5_local6.id = "desc_bg_bottom_line"
	f5_local6:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -3,
		height = 1,
		left = -400,
		right = 400,
		material = f5_local2,
		alpha = 1,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f5_local6:animateToState( "default", 0 )
	local f5_local7 = 35
	local f5_local8 = 100
	local f5_local9 = LUI.UIElement.new()
	f5_local9.id = "countdownContainer"
	f5_local9:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7,
		left = -f5_local8,
		bottom = f5_local7,
		right = f5_local8,
		alpha = 0
	} )
	f5_local9:animateToState( "default", 0 )
	f5_local9:registerAnimationState( "opening", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7 * 2,
		left = -f5_local8 * 2,
		bottom = f5_local7 * 2,
		right = f5_local8 * 2,
		alpha = 0
	} )
	f5_local9:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7,
		left = -f5_local8,
		bottom = f5_local7,
		right = f5_local8,
		alpha = 1
	} )
	local f5_local10 = LUI.UIStyledText.new()
	f5_local10.id = "countdownValueText"
	f5_local10:setText( "" )
	f5_local10:SetShadowMinDistance( -0.1, 0 )
	f5_local10:SetShadowMaxDistance( 0.1, 0 )
	f5_local10:SetShadowRGBFromInt( 0, 0 )
	f5_local10:SetShadowUOffset( -0 )
	f5_local10:SetShadowVOffset( -0 )
	f5_local10:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		font = FONTS.GetFont( FONTS.MainExtended.File ),
		alignment = LUI.Alignment.Center
	} )
	f5_local10:animateToState( "default", 0 )
	f5_local9:addElement( f5_local10 )
	local f5_local11 = LUI.UIElement.new()
	f5_local11.id = "ghostedCountdownContainer"
	f5_local11:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7,
		left = -f5_local8,
		bottom = f5_local7,
		right = f5_local8,
		alpha = 0
	} )
	f5_local11:animateToState( "default", 0 )
	f5_local11:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7,
		left = -f5_local8,
		bottom = f5_local7,
		right = f5_local8,
		alpha = 0.75
	} )
	f5_local11:registerAnimationState( "closing", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f5_local7 * 2,
		left = -f5_local8 * 2,
		bottom = f5_local7 * 2,
		right = f5_local8 * 2,
		alpha = 0
	} )
	local f5_local12 = LUI.UIText.new()
	f5_local12.id = "ghostedCountdownValueText"
	f5_local12:setText( "" )
	f5_local12:setTextStyle( CoD.TextStyle.Shadowed )
	f5_local12:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		font = FONTS.GetFont( FONTS.MainBold.File ),
		alignment = LUI.Alignment.Center
	} )
	f5_local12:animateToState( "default", 0 )
	f5_local11:addElement( f5_local12 )
	f5_local1:addElement( f5_local4 )
	f5_local1:addElement( f5_local5 )
	f5_local1:addElement( f5_local6 )
	f5_local1:addElement( f5_local3 )
	f5_local1:addElement( f5_local11 )
	f5_local1:addElement( f5_local9 )
	return self
end

local f0_local5 = function ()
	local f6_local0 = RegisterMaterial( "white" )
	local f6_local1 = RegisterMaterial( "pointflash" )
	local f6_local2 = RegisterMaterial( "widg_gradient_center_out" )
	local self = LUI.UIElement.new()
	self.id = "matchStartObjectiveHud"
	self:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 0,
		height = 128,
		alpha = 0
	} )
	self:animateToState( "default", 0 )
	self:registerAnimationState( "active", {
		alpha = 1
	} )
	self:registerOmnvarHandler( "ui_objective_text", f0_local4 )
	local f6_local4 = -30
	local f6_local5 = LUI.UIElement.new()
	f6_local5.id = "faction_icon_container"
	f6_local5:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -64 - f6_local4,
		left = -64,
		bottom = 64 - f6_local4,
		right = 64,
		alpha = 0
	} )
	f6_local5:animateToState( "default", 0 )
	f6_local5:registerAnimationState( "opening", {
		alpha = 1
	} )
	f6_local5:registerAnimationState( "active", {
		alpha = 1
	} )
	f6_local5:registerAnimationState( "leaving", {
		alpha = 0
	} )
	local f6_local6 = LUI.UIImage.new()
	f6_local6.id = "faction_icon"
	f6_local6:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		material = f6_local0
	} )
	f6_local6:animateToState( "default", 0 )
	f6_local5:addElement( f6_local6 )
	local f6_local7 = LUI.UIElement.new()
	f6_local7.id = "faction_name_parent_container"
	f6_local7:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = true,
		rightAnchor = false,
		bottom = -18 - f6_local4 + 30,
		left = -128,
		height = 24,
		width = 256
	} )
	f6_local7:animateToState( "default", 0 )
	local f6_local8 = LUI.UIImage.new()
	f6_local8.id = "faction_name_glint"
	f6_local8:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -128,
		left = -128,
		bottom = 128,
		right = 128,
		material = f6_local1,
		alpha = 0
	} )
	f6_local8:animateToState( "default", 0 )
	f6_local8:registerAnimationState( "active", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -128,
		left = -128,
		bottom = 128,
		right = 128,
		material = f6_local1,
		alpha = 0
	} )
	f6_local8:registerAnimationState( "closing", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = 256,
		left = -640,
		bottom = -256,
		right = 640,
		material = f6_local1,
		alpha = 0
	} )
	local f6_local9 = 32 * _1080p
	local f6_local10 = 128
	local f6_local11 = LUI.UIElement.new()
	f6_local11.id = "faction_name_container"
	f6_local11:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = false,
		bottomAnchor = false,
		rightAnchor = false,
		top = -f6_local9 + 15,
		left = -f6_local10,
		bottom = f6_local9 + 15,
		right = f6_local10,
		alpha = 0
	} )
	f6_local11:animateToState( "default", 0 )
	f6_local11:registerAnimationState( "active", {
		alpha = 1
	} )
	local f6_local12 = LUI.UIStyledText.new()
	f6_local12.id = "faction_name"
	f6_local12:setText( "" )
	f6_local12:SetShadowMinDistance( -0.1, 0 )
	f6_local12:SetShadowMaxDistance( 0.1, 0 )
	f6_local12:SetShadowRGBFromInt( 0, 0 )
	f6_local12:SetShadowUOffset( -0 )
	f6_local12:SetShadowVOffset( -0 )
	f6_local12:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		font = FONTS.GetFont( FONTS.MainBold.File ),
		alignment = LUI.Alignment.Center,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f6_local12:animateToState( "default", 0 )
	f6_local11:addElement( f6_local12 )
	f6_local7:addElement( f6_local11 )
	local f6_local13 = LUI.UIElement.new()
	f6_local13.id = "objective_container"
	f6_local13:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = 50,
		height = 24 * _1080p,
		alpha = 0
	} )
	f6_local13:animateToState( "default", 0 )
	f6_local13:registerAnimationState( "active", {
		alpha = 1
	} )
	local f6_local14 = LUI.UIImage.new()
	f6_local14.id = "objective_bg"
	f6_local14:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = -2,
		bottom = 2,
		material = f6_local2,
		alpha = 1,
		red = COLORS.grey56.r,
		green = COLORS.grey56.g,
		blue = COLORS.grey56.b
	} )
	f6_local14:animateToState( "default", 0 )
	local f6_local15 = LUI.UIImage.new()
	f6_local15.id = "objective_bg_top_line"
	f6_local15:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = false,
		rightAnchor = true,
		top = -2,
		bottom = -1,
		material = f6_local2,
		alpha = 1,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f6_local15:animateToState( "default", 0 )
	local f6_local16 = LUI.UIImage.new()
	f6_local16.id = "objective_bg_bottom_line"
	f6_local16:registerAnimationState( "default", {
		topAnchor = false,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		top = 2,
		bottom = 3,
		material = f6_local2,
		alpha = 1,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f6_local16:animateToState( "default", 0 )
	local f6_local17 = 40
	local f6_local18 = LUI.UIStyledText.new()
	f6_local18.id = "objective_text"
	f6_local18:setText( "" )
	f6_local18:SetDecodeLetterLength( 25 )
	f6_local18:SetDecodeMaxRandChars( 3 )
	f6_local18:SetDecodeUpdatesPerLetter( 4 )
	f6_local18:registerAnimationState( "default", {
		topAnchor = true,
		leftAnchor = true,
		bottomAnchor = true,
		rightAnchor = true,
		font = FONTS.GetFont( FONTS.MainBold.File ),
		alignment = LUI.Alignment.Center,
		red = COLORS.white.r,
		green = COLORS.white.g,
		blue = COLORS.white.b
	} )
	f6_local18:animateToState( "default", 0 )
	f6_local13:addElement( f6_local14 )
	f6_local13:addElement( f6_local15 )
	f6_local13:addElement( f6_local16 )
	f6_local13:addElement( f6_local18 )
	self:addElement( f6_local5 )
	self:addElement( f6_local7 )
	self:addElement( f6_local13 )
	return self
end

MenuBuilder.registerType( "matchStartHudDef", matchStartHudDef )
MenuBuilder.registerType( "matchStartObjectiveHudDef", f0_local5 )
LockTable( _M )
