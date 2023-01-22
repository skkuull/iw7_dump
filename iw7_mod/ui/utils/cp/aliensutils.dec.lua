local f0_local0 = module
local f0_local1, f0_local2 = ...
f0_local0( f0_local1, package.seeall )
function InitGameTypeToAliens()
	MatchRules.SetData( "gametype", "zombie" )
	MatchRules.LoadMatchRulesDataDefault()
end

function AliensRunConfig( f2_arg0 )
	assert( Engine.IsAliensMode(), "Running Aliens Config when not in aliens mode\n" )
	if Engine.IsAliensMode() then
		Engine.Exec( CPConfig.default_aliens, f2_arg0 )
	end
end

function IsChaosMode()
	assert( not Engine.InFrontend() )
	return false
end

AlienCraftingItems = {
	File = "cp/alien/crafting_items.csv",
	Cols = {
		Idx = 0,
		Ref = 1,
		Name = 2,
		Icon = 3
	},
	MaxItems = 100
}
AlienCraftingRecipes = {
	File = "cp/alien/crafting_items.csv",
	Cols = {
		Idx = 0,
		Ref = 1,
		Slot1Material = 2,
		Slot2Material = 3,
		Slot3Material = 4,
		Slot4Material = 5
	},
	MaxItems = 100
}
AlienRanks = {
	File = "cp/zombies/rankTable.csv",
	Cols = {
		Idx = 0,
		Rank = 1,
		MinXP = 2,
		XPToNext = 3,
		ShortRank = 4,
		FullRank = 5,
		Icon = 6,
		MaxXP = 7,
		WeaponUnlock = 8,
		PerkUnlock = 9,
		Challenge = 10,
		Camo = 11,
		Attachment = 12,
		Level = 13,
		DisplayLevel = 14,
		FeatureUnlock = 15,
		IngameRank = 16,
		UnlockString = 17
	},
	MaxLevel = 29,
	MaxPrestige = 20,
	SuperMaxLevel = 30
}
ExtinctionDifficluty = {
	Regular = 0,
	Easy = 1,
	Hard = 2
}
function ExtinctionSetDifficlutyDvars( f4_arg0 )
	if f4_arg0 == ExtinctionDifficluty.Easy then
		Engine.ExecNow( "set scr_aliens_hardcore 0" )
		Engine.ExecNow( "set scr_aliens_ricochet 0" )
		Engine.ExecNow( "set scr_aliens_casual 1" )
	elseif f4_arg0 == ExtinctionDifficluty.Hard then
		Engine.ExecNow( "set scr_aliens_hardcore 1" )
		Engine.ExecNow( "set scr_aliens_ricochet 1" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	else
		Engine.ExecNow( "set scr_aliens_hardcore 0" )
		Engine.ExecNow( "set scr_aliens_ricochet 0" )
		Engine.ExecNow( "set scr_aliens_casual 0" )
	end
	if IsPrivateMatch() then
		Lobby.SetExtinctionDifficulty( f4_arg0 )
	end
end

function IsChaosEnabled()
	local f5_local0 = false
	if IsPrivateMatch() then
		f5_local0 = Lobby.IsChaosEnabled()
	else
		f5_local0 = Engine.GetDvarInt( "scr_chaos_mode" ) == 1
	end
	return f5_local0
end

function SetEnableChaosMode( f6_arg0 )
	if f6_arg0 then
		if IsPrivateMatch() then
			Lobby.SetChaosEnabled( true )
		end
		Engine.SetDvarInt( "scr_chaos_mode", 1 )
		ExtinctionSetDifficlutyDvars( ExtinctionDifficluty.Regular )
	else
		if IsPrivateMatch() then
			Lobby.SetChaosEnabled( false )
		end
		Engine.SetDvarInt( "scr_chaos_mode", 0 )
	end
end

function LobbyGetIntroVideo()
	local f7_local0 = Engine.TableLookup( CSV.CPLevels.file, CSV.CPLevels.cols.ref, Engine.GetDvarString( "ui_mapname" ), CSV.CPLevels.cols.introBink )
	if f7_local0 and #f7_local0 > 0 then
		return f7_local0
	else
		return nil
	end
end

function HasSeenIntroVideoByIndex( f8_arg0, f8_arg1 )
	return Engine.GetPlayerDataEx( f8_arg0, CoD.StatsGroup.Coop, "has_seen_episode_intro", f8_arg1 )
end

function HasSeenIntroVideo( f9_arg0, f9_arg1 )
	local f9_local0 = Engine.TableLookup( CSV.CPLevels.file, CSV.CPLevels.cols.introBink, f9_arg1, CSV.CPLevels.cols.index )
	if f9_local0 ~= "" then
		return HasSeenIntroVideoByIndex( f9_arg0, f9_local0 )
	else
		return true
	end
end

function SetHasSeenIntroVideoByIndex( f10_arg0, f10_arg1 )
	Engine.SetPlayerDataEx( f10_arg0, CoD.StatsGroup.Coop, "has_seen_episode_intro", f10_arg1, true )
	Engine.ExecNow( "uploadstats", f10_arg0 )
end

function SetHasSeenIntroVideo( f11_arg0, f11_arg1 )
	local f11_local0 = Engine.TableLookup( CSV.CPLevels.file, CSV.CPLevels.cols.introBink, f11_arg1, CSV.CPLevels.cols.index )
	if f11_local0 ~= "" then
		SetHasSeenIntroVideoByIndex( f11_arg0, f11_local0 )
	end
end

function AliensPlayIntroVideo( f12_arg0, f12_arg1, f12_arg2 )
	Engine.StopMusic()
	LUI.FlowManager.RequestPopupMenu( nil, "AliensVideoOverlay", false, f12_arg0, false, {
		videoRef = f12_arg1,
		endEvent = f12_arg2
	} )
	SetHasSeenIntroVideo( f12_arg0, f12_arg1 )
end

function AliensVideoOverlay( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = f13_arg1 or {}
	local f13_local1 = f13_local0.videoRef or "mp_alien_armory_intro"
	local f13_local2 = f13_local0.endEvent or nil
	local self = LUI.UIElement.new()
	self.id = "video_root_id"
	local f13_local4 = 1000
	local f13_local5 = LUI.UIImage.new( {
		material = RegisterMaterial( "black" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f13_local5.id = "fadeToBlack"
	self:addElement( f13_local5 )
	f13_local5:SetAlpha( 1, f13_local4 )
	local f13_local6 = LUI.UIImage.new( {
		material = RegisterMaterial( "cinematic" ),
		topAnchor = true,
		bottomAnchor = true,
		leftAnchor = true,
		rightAnchor = true,
		top = 0,
		bottom = 0,
		left = 0,
		right = 0,
		alpha = 0
	} )
	f13_local6.id = "bink"
	self:addElement( f13_local6 )
	local f13_local7 = LUI.UIElement.new()
	f13_local7:SetupCinematicSubtitles()
	f13_local7.id = "subtitles"
	self:addElement( f13_local7 )
	local f13_local8 = false
	self:registerEventHandler( "exit_aliens_video", function ( element, event )
		if f13_local2 and not f13_local8 then
			f13_local8 = true
			if f13_local2.target then
				f13_local2.target:processEvent( f13_local2 )
			else
				element:dispatchEventToRoot( f13_local2 )
			end
		end
	end )
	self:registerEventHandler( "check_exit_aliens_video", function ( element, event )
		if Engine.IsVideoFinished() then
			element:processEvent( {
				name = "exit_aliens_video"
			} )
		end
	end )
	self:registerEventHandler( "menu_create", function ( element, event )
		local f16_local0 = element:Wait( f13_local4 )
		f16_local0.onComplete = function ()
			f13_local6:SetAlpha( 1, 1000 )
			Engine.StopMusic()
			if IsArabicSKU() and f13_local1 == "sysmainload" then
				f13_local1 = "sysmainload_safe"
			end
			Engine.PlayMenuVideo( f13_local1 )
			local self = LUI.UITimer.new( nil, {
				interval = 66,
				event = {
					name = "check_exit_aliens_video"
				},
				disposable = false,
				eventTarget = self,
				broadcastToRoot = false
			} )
			self.id = "check_exit_timer_id"
			element:addElement( self )
			local f17_local1 = LUI.UITimer.new( nil, {
				interval = 2000,
				event = "fastfiles_loaded_poll"
			} )
			f17_local1.id = "allowSkipTimer_id"
			self:addElement( f17_local1 )
			local f17_local2 = false
			self:registerEventHandler( "fastfiles_loaded_poll", function ( element, event )
				if Engine.IsFastFileGameWorkComplete() and not f17_local2 then
					f17_local2 = true
					self:processEvent( {
						name = "allow_skip"
					} )
					f17_local1:Stop()
				else
					Engine.StreamingSuspendInstall()
				end
			end )
			self:processEvent( {
				name = "fastfiles_loaded_poll"
			} )
		end
		
	end )
	local f13_local9 = LUI.UIButton.new()
	f13_local9.id = "video_continue_button"
	f13_local9:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = true,
		left = 0,
		right = 0,
		top = 0,
		bottom = 0
	} )
	f13_local9:animateToState( "default", 0 )
	f13_local9:registerEventHandler( "allow_skip", function ( element, event )
		local f19_local0 = MenuBuilder.BuildRegisteredType( "BinkSkipPrompt", {
			onSkipInput = function ()
				self:processEvent( {
					name = "exit_aliens_video"
				} )
			end
		} )
		f19_local0:setPriority( 5 )
		self:addElement( f19_local0 )
	end )
	self:addElement( f13_local9 )
	return self
end

function AliensVideoOverlayPop()
	Engine.StopMenuVideo()
end

MenuBuilder.registerType( "AliensVideoOverlay", AliensVideoOverlay )
LUI.FlowManager.RegisterStackPopBehaviour( "AliensVideoOverlay", AliensVideoOverlayPop )
LockTable( _M )
