local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
f0_local0 = "%02d"
f0_local1 = 100
f0_local2 = 3600
local f0_local3 = 24 * f0_local2
local f0_local4 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = math.floor( f1_arg1 / f0_local3 % 30 )
	local f1_local1 = math.floor( f1_arg1 / f0_local2 % 24 )
	local f1_local2 = math.floor( f1_arg1 / 60 % 60 )
	local f1_local3 = f1_arg1 % 60
	f1_arg0.Days.Value:setText( string.format( f0_local0, f1_local0 ), 0 )
	f1_arg0.Hours.Value:setText( string.format( f0_local0, f1_local1 ), 0 )
	f1_arg0.Mins.Value:setText( string.format( f0_local0, f1_local2 ), 0 )
	f1_arg0.Secs.Value:setText( string.format( f0_local0, f1_local3 ), 0 )
end

local f0_local5 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = MLG.GetGameBattleIntermissionTimeLeft()
	if f2_local0 ~= nil then
		return math.ceil( f2_local0 / 1000 ) - f2_arg1
	else
		return Engine.GetCurrentTimeDiffWithEpochTime( f2_arg0 )
	end
end

local f0_local6 = function ( f3_arg0 )
	return function ()
		local f4_local0 = f0_local5( Engine.AddToEpochTime( f3_arg0.targetEpochDate, GAMEBATTLES.GetNoshowTime() ), 0 )
		f0_local4( f3_arg0, f4_local0 )
		if f4_local0 <= 0 then
			f3_arg0:dispatchEventToRoot( {
				name = "no_show_countdown_stop",
				dispatchChildren = true,
				immediate = not Lobby.IsGameHost()
			} )
			f3_arg0:StopCountdown()
		else
			f3_arg0.CountdownTween = f3_arg0:Wait( f0_local1 )
			f3_arg0.CountdownTween.onComplete = f3_arg0:UpdateNoShowCountdown()
		end
	end
	
end

local f0_local7 = function ( f5_arg0 )
	f5_arg0:StopCountdown()
	ACTIONS.AnimateSequence( f5_arg0, "StartNoShowCountdown" )
	ACTIONS.AnimateSequence( f5_arg0, "NoShowCountdown" )
	local f5_local0 = f0_local6( f5_arg0 )
	f5_local0()
	f5_arg0.CountdownTweenRunning = true
	f5_arg0:dispatchEventToRoot( {
		name = "gamebattles_change_countdown_name",
		countdownName = Engine.Localize( "MLG_GAMEBATTLES_COUNTDOWN_GAME_LAUNCH", MLG.GetActiveGameIndex() + 1 )
	} )
end

local f0_local8 = function ( f6_arg0 )
	return function ()
		local f7_local0 = f0_local5( f6_arg0.targetEpochDate, GAMEBATTLES.GetNoshowTime() )
		f0_local4( f6_arg0, f7_local0 )
		if f7_local0 <= 0 then
			f6_arg0:StartNoShowCountdown()
		else
			f6_arg0.CountdownTween = f6_arg0:Wait( f0_local1 )
			f6_arg0.CountdownTween.onComplete = f6_arg0:UpdateMatchCountdown()
		end
	end
	
end

local f0_local9 = function ( f8_arg0 )
	if MLG.GetGameBattleIntermissionTimeLeft() == nil then
		local f8_local0 = Engine.GetCurrentTimeDiffWithEpochTime( Engine.AddToEpochTime( f8_arg0.targetEpochDate, GAMEBATTLES.GetNoshowTime() ) )
		Lobby.UseIntermissionTimer( true )
		MLG.StartGameBattleIntermission( f8_local0 )
	end
end

local f0_local10 = function ( f9_arg0 )
	local f9_local0
	if f9_arg0.targetEpochDate == nil or MLG.GetActiveGameIndex() ~= 0 or Engine.GetCurrentTimeDiffWithEpochTime( f9_arg0.targetEpochDate ) > 0 then
		f9_local0 = false
	else
		f9_local0 = true
	end
	return f9_local0
end

local f0_local11 = function ( f10_arg0, f10_arg1 )
	f10_arg0.targetEpochDate = f10_arg1
	f10_arg0:StopCountdown()
	local f10_local0 = f0_local8( f10_arg0 )
	f10_local0()
	f10_arg0.CountdownTweenRunning = true
end

local f0_local12 = function ( f11_arg0 )
	return function ()
		local f12_local0 = f0_local5( f11_arg0.intermissionEndTime, 0 )
		f0_local4( f11_arg0, f12_local0 )
		if f12_local0 <= 0 then
			f11_arg0:dispatchEventToRoot( {
				name = "no_show_countdown_stop",
				dispatchChildren = true,
				immediate = not Lobby.IsGameHost()
			} )
			f11_arg0:StopCountdown()
		else
			f11_arg0.CountdownTween = f11_arg0:Wait( f0_local1 )
			f11_arg0.CountdownTween.onComplete = f11_arg0:UpdateIntermissionCountdown()
		end
	end
	
end

local f0_local13 = function ( f13_arg0, f13_arg1 )
	ACTIONS.AnimateSequence( f13_arg0, "StartNoShowCountdown" )
	ACTIONS.AnimateSequence( f13_arg0, "NoShowCountdown" )
	if f13_arg1 and MLG.GetGameBattleIntermissionTimeLeft() == nil then
		Lobby.UseIntermissionTimer( true )
		MLG.StartGameBattleIntermission( GAMEBATTLES.GetIntermissionTime() )
	end
	f13_arg0.intermissionEndTime = Engine.AddToEpochTime( Engine.GetCurrentEpochTime(), GAMEBATTLES.GetIntermissionTime() )
	local f13_local0 = f0_local12( f13_arg0 )
	f13_local0()
	f13_arg0.CountdownTweenRunning = true
end

local f0_local14 = function ( f14_arg0 )
	if f14_arg0.targetEpochDate then
		if f14_arg0.CountdownTweenRunning then
			f14_arg0.CountdownTween.onComplete = function ()
				
			end
			
		end
		f14_arg0.CountdownTweenRunning = false
	end
end

local f0_local15 = function ( f16_arg0, f16_arg1, f16_arg2 )
	f16_arg0.targetEpochDate = nil
	f16_arg0.intermissionEndTime = nil
	f16_arg0.StartCountdownToTargetEpochDate = f0_local11
	f16_arg0.StartIntermissionTimer = f0_local9
	f16_arg0.StartNoShowCountdown = f0_local7
	f16_arg0.StopCountdown = f0_local14
	f16_arg0.UpdateMatchCountdown = f0_local8
	f16_arg0.UpdateNoShowCountdown = f0_local6
	f16_arg0.StartIntermissionCountdown = f0_local13
	f16_arg0.UpdateIntermissionCountdown = f0_local12
	f16_arg0.IsInNoShow = f0_local10
end

function GameBattlesCountdown( menu, controller )
	local self = LUI.UIElement.new()
	self:SetAnchorsAndPosition( 0, 1, 0, 1, 0, 320 * _1080p, 0, 80 * _1080p )
	self.id = "GameBattlesCountdown"
	self._animationSets = {}
	self._sequences = {}
	local f17_local1 = controller and controller.controllerIndex
	if not f17_local1 and not Engine.InFrontend() then
		f17_local1 = self:getRootController()
	end
	assert( f17_local1 )
	local f17_local2 = self
	local Secs = nil
	
	Secs = MenuBuilder.BuildRegisteredType( "GameBattlesCountdownElement", {
		controllerIndex = f17_local1
	} )
	Secs.id = "Secs"
	Secs.Title:setText( Engine.Localize( "MLG_GAMEBATTLES_SECONDS_SHORT" ), 0 )
	Secs.Value:setText( "05", 0 )
	Secs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 240, _1080p * 320, 0, _1080p * 80 )
	self:addElement( Secs )
	self.Secs = Secs
	
	local Mins = nil
	
	Mins = MenuBuilder.BuildRegisteredType( "GameBattlesCountdownElement", {
		controllerIndex = f17_local1
	} )
	Mins.id = "Mins"
	Mins.Title:setText( Engine.Localize( "MLG_GAMEBATTLES_MINUTES_SHORT" ), 0 )
	Mins.Value:setText( "44", 0 )
	Mins:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160, _1080p * 240, 0, _1080p * 80 )
	self:addElement( Mins )
	self.Mins = Mins
	
	local Hours = nil
	
	Hours = MenuBuilder.BuildRegisteredType( "GameBattlesCountdownElement", {
		controllerIndex = f17_local1
	} )
	Hours.id = "Hours"
	Hours.Title:setText( Engine.Localize( "MLG_GAMEBATTLES_HOURS_SHORT" ), 0 )
	Hours.Value:setText( "07", 0 )
	Hours:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 80, _1080p * 160, 0, _1080p * 80 )
	self:addElement( Hours )
	self.Hours = Hours
	
	local Days = nil
	
	Days = MenuBuilder.BuildRegisteredType( "GameBattlesCountdownElement", {
		controllerIndex = f17_local1
	} )
	Days.id = "Days"
	Days.Title:setText( Engine.Localize( "MLG_GAMEBATTLES_DAYS_SHORT" ), 0 )
	Days.Value:setText( "28", 0 )
	Days:SetAnchorsAndPosition( 0, 1, 0, 1, 0, _1080p * 80, 0, _1080p * 80 )
	self:addElement( Days )
	self.Days = Days
	
	self._animationSets.DefaultAnimationSet = function ()
		self._sequences.DefaultSequence = function ()
			
		end
		
		Secs:RegisterAnimationSequence( "NoShowCountdown", {
			{
				function ()
					return self.Secs.BackgroundHighlight:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Secs.BackgroundHighlight:SetRGBFromTable( SWATCHES.HUD.inactive, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Secs.BackgroundHighlight:SetRGBFromInt( 16777215, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		Mins:RegisterAnimationSequence( "NoShowCountdown", {
			{
				function ()
					return self.Mins.BackgroundHighlight:SetRGBFromInt( 16777215, 0 )
				end,
				function ()
					return self.Mins.BackgroundHighlight:SetRGBFromTable( SWATCHES.HUD.inactive, 500, LUI.EASING.inQuadratic )
				end,
				function ()
					return self.Mins.BackgroundHighlight:SetRGBFromInt( 16777215, 500, LUI.EASING.outQuadratic )
				end
			}
		} )
		self._sequences.NoShowCountdown = function ()
			Secs:AnimateLoop( "NoShowCountdown" )
			Mins:AnimateLoop( "NoShowCountdown" )
		end
		
		Secs:RegisterAnimationSequence( "StartNoShowCountdown", {
			{
				function ()
					return self.Secs:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 160, _1080p * 240, 0, _1080p * 80, 0 )
				end
			}
		} )
		Mins:RegisterAnimationSequence( "StartNoShowCountdown", {
			{
				function ()
					return self.Mins:SetAnchorsAndPosition( 0, 1, 0, 1, _1080p * 80, _1080p * 160, 0, _1080p * 80, 0 )
				end
			}
		} )
		Hours:RegisterAnimationSequence( "StartNoShowCountdown", {
			{
				function ()
					return self.Hours:SetAlpha( 0, 0 )
				end
			}
		} )
		Days:RegisterAnimationSequence( "StartNoShowCountdown", {
			{
				function ()
					return self.Days:SetAlpha( 0, 0 )
				end
			}
		} )
		self._sequences.StartNoShowCountdown = function ()
			Secs:AnimateSequence( "StartNoShowCountdown" )
			Mins:AnimateSequence( "StartNoShowCountdown" )
			Hours:AnimateSequence( "StartNoShowCountdown" )
			Days:AnimateSequence( "StartNoShowCountdown" )
		end
		
	end
	
	self._animationSets.DefaultAnimationSet()
	f0_local15( self, f17_local1, controller )
	return self
end

MenuBuilder.registerType( "GameBattlesCountdown", GameBattlesCountdown )
LockTable( _M )
