CONDITIONS = {
	AlwaysFalse = function ( f1_arg0 )
		return false
	end,
	AlwaysTrue = function ( f2_arg0 )
		return true
	end,
	InFrontend = function ( f3_arg0 )
		return Engine.InFrontend()
	end,
	InFrontendPublicMP = function ( f4_arg0 )
		local f4_local0 = Engine.InFrontend()
		if f4_local0 then
			f4_local0 = Engine.IsCoreMode()
			if f4_local0 then
				if not IsPrivateMatch() and not IsSystemLink() then
					f4_local0 = not Engine.IsAliensMode()
				else
					f4_local0 = false
				end
			end
		end
		return f4_local0
	end,
	InGame = function ( f5_arg0 )
		return not Engine.InFrontend()
	end,
	InGameSPOrFrontendMP = function ( f6_arg0 )
		local f6_local0
		if not Engine.InFrontend() then
			f6_local0 = Engine.IsSingleplayer()
			if not f6_local0 then
				f6_local0 = Engine.InFrontend()
				if f6_local0 then
					f6_local0 = Engine.IsMultiplayer()
				end
			end
		else
			f6_local0 = Engine.InFrontend()
			if f6_local0 then
				f6_local0 = Engine.IsMultiplayer()
			end
		end
		return f6_local0
	end,
	IsMenuInStack = function ( f7_arg0 )
		return LUI.FlowManager.IsInStack( f7_arg0 )
	end,
	IsGamepadEnabled = function ( f8_arg0 )
		return Engine.IsGamepadEnabled() == 1
	end,
	IsDevelopmentBuild = function ( f9_arg0 )
		return Engine.IsDevelopmentBuild()
	end,
	IsMatchSimToolEnabled = function ( f10_arg0 )
		return Engine.GetDvarInt( "matchsim_tool_enabled" ) == 1
	end,
	ShouldHideButtonPrompts = function ( f11_arg0 )
		return Engine.GetDvarBool( "hide_button_prompts" ) == true
	end,
	IsInFocus = function ( f12_arg0 )
		return f12_arg0:isInFocus()
	end,
	IsDisabled = function ( f13_arg0 )
		return f13_arg0:IsDisabled()
	end,
	IsCoreMultiplayer = function ( f14_arg0 )
		return Engine.IsCoreMode()
	end,
	IsMultiplayer = function ( f15_arg0 )
		return Engine.IsMultiplayer()
	end,
	IsSingleplayer = function ( f16_arg0 )
		return not Engine.IsMultiplayer()
	end,
	IsThirdGameMode = function ( f17_arg0 )
		return Engine.IsAliensMode()
	end,
	IsMultiplayerDesired = function ( f18_arg0 )
		return Engine.GetLUIModeTransition() == CoD.PlayMode.Core
	end,
	IsSingleplayerDesired = function ( f19_arg0 )
		return Engine.GetLUIModeTransition() == CoD.PlayMode.SP
	end,
	IsThirdGameModeDesired = function ( f20_arg0 )
		return Engine.GetLUIModeTransition() == CoD.PlayMode.Aliens
	end,
	IsTeamBasedGameType = function ( f21_arg0 )
		return Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, Engine.GetDvarString( "ui_gametype" ), GameTypesTable.Cols.TeamChoice ) == "1"
	end,
	IsMatchMakingGame = function ( f22_arg0 )
		return Engine.GetDvarBool( "isMatchMakingGame" )
	end,
	IsPublicMatch = function ( f23_arg0 )
		return IsPublicMatch()
	end,
	IsCorePublicMatch = function ( f24_arg0 )
		return Engine.IsCoreMode() and IsPublicMatch()
	end,
	IsWeaponLevelShown = function ( f25_arg0 )
		return IsPublicMatch() and Engine.InFrontend()
	end,
	IsCoreFrontendPC = function ( f26_arg0 )
		local f26_local0 = Engine.IsPC()
		if f26_local0 then
			f26_local0 = Engine.IsCoreMode()
			if f26_local0 then
				f26_local0 = Engine.InFrontend()
			end
		end
		return f26_local0
	end,
	IsLocalServerPaused = function ( f27_arg0 )
		return Engine.IsLocalServerPaused()
	end,
	IsCWLDraftLobby = function ( f28_arg0 )
		local f28_local0
		if not IsPrivateMatch() then
			f28_local0 = IsSystemLink()
			if f28_local0 then
				f28_local0 = Engine.IsCoreMode()
				if f28_local0 then
					f28_local0 = MLG.AreMLGRulesEnabled()
					if f28_local0 then
						f28_local0 = not Engine.GetDvarBool( "killswitch_loadout_draft" )
					end
				end
			end
		else
			f28_local0 = Engine.IsCoreMode()
			if f28_local0 then
				f28_local0 = MLG.AreMLGRulesEnabled()
				if f28_local0 then
					f28_local0 = not Engine.GetDvarBool( "killswitch_loadout_draft" )
				end
			end
		end
		return f28_local0
	end,
	IsBombGametype = function ( f29_arg0 )
		local f29_local0 = Engine.GetDvarString( "ui_gametype" )
		local f29_local1
		if f29_local0 ~= "sd" and f29_local0 ~= "sr" and f29_local0 ~= "dd" then
			f29_local1 = false
		else
			f29_local1 = true
		end
		return f29_local1
	end,
	ButtonPrimary = function ( f30_arg0, f30_arg1 )
		return f30_arg1.button == "primary"
	end,
	ButtonSecondary = function ( f31_arg0, f31_arg1 )
		return f31_arg1.button == "secondary"
	end,
	ButtonAltOne = function ( f32_arg0, f32_arg1 )
		return f32_arg1.button == "alt1"
	end,
	ButtonAltTwo = function ( f33_arg0, f33_arg1 )
		return f33_arg1.button == "alt2"
	end,
	ButtonRightTrigger = function ( f34_arg0, f34_arg1 )
		return f34_arg1.button == "right_trigger"
	end,
	ButtonLeftTrigger = function ( f35_arg0, f35_arg1 )
		return f35_arg1.button == "left_trigger"
	end,
	ButtonRightShoulder = function ( f36_arg0, f36_arg1 )
		return f36_arg1.button == "shoulderr"
	end,
	ButtonLeftShoulder = function ( f37_arg0, f37_arg1 )
		return f37_arg1.button == "shoulderl"
	end,
	ButtonRightStick = function ( f38_arg0, f38_arg1 )
		return f38_arg1.button == "right_stick"
	end,
	ButtonLeftStick = function ( f39_arg0, f39_arg1 )
		return f39_arg1.button == "left_stick"
	end,
	ButtonLeft = function ( f40_arg0, f40_arg1 )
		return f40_arg1.button == "left"
	end,
	ButtonRight = function ( f41_arg0, f41_arg1 )
		return f41_arg1.button == "right"
	end,
	ButtonUp = function ( f42_arg0, f42_arg1 )
		return f42_arg1.button == "up"
	end,
	ButtonDown = function ( f43_arg0, f43_arg1 )
		return f43_arg1.button == "down"
	end,
	ButtonStart = function ( f44_arg0, f44_arg1 )
		return f44_arg1.button == "start"
	end,
	ButtonSelect = function ( f45_arg0, f45_arg1 )
		return f45_arg1.button == "select"
	end,
	ButtonOptions = function ( f46_arg0, f46_arg1 )
		return f46_arg1.button == "options"
	end,
	InKillCam = function ( f47_arg0 )
		return Game.InKillCam()
	end,
	IsCinematicCameraActive = function ( f48_arg0 )
		return Engine.IsMultiplayer() and Game.IsCinematicCameraActive()
	end,
	IsGameMode = function ( f49_arg0 )
		return GameX.GetGameMode() == f49_arg0
	end,
	IsHardcoreMode = function ( f50_arg0 )
		return GameX.IsHardcoreMode()
	end,
	IsNotHardcoreMode = function ( f51_arg0 )
		return not GameX.IsHardcoreMode()
	end,
	IsOnlineMatch = function ( f52_arg0 )
		return GameX.IsOnlineMatch()
	end,
	IsRankedMatch = function ( f53_arg0 )
		return GameX.IsRankedMatch()
	end,
	IsAllowedToSpectate = function ( f54_arg0, f54_arg1 )
		local f54_local0 = 0
		if MatchRules.IsUsingMatchRulesData() then
			local f54_local1 = DataSources.inGame.MP.match.team:GetValue( f54_arg1 )
			f54_local0 = MatchRules.GetData( "commonOption", "spectateModeAllowed" )
		end
		return f54_local0 ~= 0
	end,
	IsSpectating = function ( f55_arg0 )
		if not Engine.IsMultiplayer() then
			return false
		else
			return Game.IsSpectating() or Game.GetOmnvar( "ui_session_state" ) == "spectator"
		end
	end,
	IsCODCastingAllowed = function ( f56_arg0 )
		return CODCASTER.CanCODCast()
	end,
	IsCODCaster = function ( f57_arg0 )
		return CODCASTER.IsCODCaster()
	end,
	IsSpectatingNotCODCaster = function ( f58_arg0 )
		return CONDITIONS.IsSpectating( f58_arg0 ) and not CONDITIONS.IsCODCaster( f58_arg0 )
	end,
	IsSplitscreen = function ( f59_arg0 )
		local f59_local0
		if not Engine.InFrontend() then
			f59_local0 = GameX.IsSplitscreen()
		else
			f59_local0 = false
		end
		return f59_local0
	end,
	IsFriendsButtonAccessible = function ( f60_arg0, f60_arg1 )
		return IsOnlineMatch() and not Engine.IsUserAGuest( f60_arg1 )
	end,
	UsingRemoteKillstreak = function ( f61_arg0 )
		return CoD.UsingKillstreakRemote()
	end,
	WeaponHasAltMode = function ( f62_arg0, f62_arg1 )
		return Game.WeaponHasAltMode( f62_arg0 )
	end,
	IsLoadoutEditOpen = function ( f63_arg0 )
		local f63_local0 = LUI.FlowManager.GetScopedData( f63_arg0 )
		return f63_local0.openedLoadoutEdit
	end,
	UseCACBreadCrumbs = function ( f64_arg0 )
		local f64_local0 = Engine.InFrontend()
		if f64_local0 then
			f64_local0 = Engine.IsMultiplayer()
			if f64_local0 then
				if not IsPrivateMatch() then
					f64_local0 = not IsSystemLink()
				else
					f64_local0 = false
				end
			end
		end
		return f64_local0
	end,
	IsDraftEnabled = function ( f65_arg0 )
		local f65_local0
		if not IsPrivateMatch() then
			f65_local0 = IsSystemLink()
			if f65_local0 then
				f65_local0 = LoadoutDrafting.IsEnabled()
				if f65_local0 then
					f65_local0 = Engine.IsCoreMode()
					if f65_local0 then
						f65_local0 = MLG.AreMLGRulesEnabled()
						if f65_local0 then
							f65_local0 = not Engine.GetDvarBool( "killswitch_loadout_draft" )
						end
					end
				end
			end
		else
			f65_local0 = LoadoutDrafting.IsEnabled()
			if f65_local0 then
				f65_local0 = Engine.IsCoreMode()
				if f65_local0 then
					f65_local0 = MLG.AreMLGRulesEnabled()
					if f65_local0 then
						f65_local0 = not Engine.GetDvarBool( "killswitch_loadout_draft" )
					end
				end
			end
		end
		return f65_local0
	end,
	IsCompetitivePlaylist = function ( f66_arg0 )
		local f66_local0 = CONDITIONS.IsCorePublicMatch( f66_arg0 )
		if f66_local0 then
			f66_local0 = Engine.InLobby()
			if f66_local0 then
				f66_local0 = Playlist.IsCompetitivePlaylist( Engine.GetDvarInt( "playlist" ) )
			end
		end
		return f66_local0
	end,
	UseLoadoutRestrictions = function ( f67_arg0 )
		local f67_local0 = CONDITIONS.IsDraftEnabled( f67_arg0 )
		if not f67_local0 then
			f67_local0 = CONDITIONS.IsCompetitivePlaylist( f67_arg0 )
		end
		return f67_local0
	end,
	AreLootStreaksEnabled = function ( f68_arg0 )
		local f68_local0
		if not Engine.GetDvarBool( "killswitch_streak_variants" ) and not IsSystemLink() then
			f68_local0 = not CONDITIONS.UseLoadoutRestrictions()
		else
			f68_local0 = false
		end
		return f68_local0
	end,
	IsTeamChoiceAllowed = function ( f69_arg0 )
		local f69_local0
		if Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, DataSources.inGame.MP.match.gameType:GetValue( 0 ), GameTypesTable.Cols.TeamChoice ) == "1" and not GameX.IsRankedMatch() and not MLG.IsGameBattleMatch() then
			f69_local0 = Lobby.IsTeamAssignmentEnabled()
		else
			f69_local0 = false
		end
		return f69_local0
	end,
	IsTeamOrCodcasterChoiceAllowed = function ( f70_arg0 )
		local f70_local0
		if not CONDITIONS.IsTeamChoiceAllowed( f70_arg0 ) then
			f70_local0 = CONDITIONS.IsCODCastingAllowed( f70_arg0 )
			if f70_local0 then
			
			else
				return f70_local0
			end
		end
		f70_local0 = not MLG.IsGameBattleMatch()
	end,
	IsClassChoiceAllowed = function ( f71_arg0 )
		local f71_local0 = DataSources.inGame.MP.match.gameType:GetValue( 0 )
		local f71_local1
		if Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f71_local0, GameTypesTable.Cols.ClassChoice ) == "1" then
			f71_local1 = not GameX.UsesFakeLoadout()
		else
			f71_local1 = false
		end
		local f71_local2
		if Engine.TableLookup( GameTypesTable.File, GameTypesTable.Cols.Ref, f71_local0, GameTypesTable.Cols.TeamChoice ) == "1" then
			f71_local2 = not GameX.IsRankedMatch()
		else
			f71_local2 = false
		end
		local f71_local3 = Game.GetPlayerTeam()
		local f71_local4
		if not f71_local2 or f71_local3 ~= Teams.allies and f71_local3 ~= Teams.axis then
			f71_local4 = not f71_local2
		else
			f71_local4 = true
		end
		return f71_local1 and f71_local4
	end,
	IsAliensNotSolo = function ( f72_arg0 )
		local f72_local0 = Engine.IsAliensMode()
		local f72_local1 = Engine.GetDvarBool( "xblive_privatematch" )
		local f72_local2 = Engine.GetDvarBool( "xblive_privatematch_solo" )
		local f72_local3
		if f72_local0 and f72_local1 then
			f72_local3 = not f72_local2
		else
			f72_local3 = true
		end
		return f72_local3
	end,
	IsAliensSolo = function ( f73_arg0 )
		return Engine.IsAliensMode() and Engine.GetDvarBool( "xblive_privatematch_solo" )
	end,
	IsAliensOnline = function ( f74_arg0 )
		return Engine.IsAliensMode() and not IsSystemLink()
	end,
	ShouldShowPlayNowButton = function ( f75_arg0 )
		local f75_local0 = LUI.FlowManager.GetScopedData( "CPLoadoutMenu" )
		if f75_local0.showPlayNowButton == true then
			return true
		else
			return false
		end
	end,
	IsSystemLink = function ( f76_arg0 )
		return IsSystemLink()
	end,
	IsAliensSoloOrSystemLink = function ( f77_arg0 )
		return CONDITIONS.IsAliensSolo() or CONDITIONS.IsSystemLink()
	end,
	AreCODPointsEnabled = function ( f78_arg0 )
		local f78_local0
		if not Engine.GetDvarBool( "killswitch_cod_points" ) then
			f78_local0 = CONDITIONS.IsStoreAllowed()
			if f78_local0 then
				f78_local0 = not Engine.IsTrialLicense()
			end
		else
			f78_local0 = false
		end
		return f78_local0
	end,
	AreBribeCratesEnabled = function ( f79_arg0 )
		return Engine.GetDvarBool( "bribe_crates_enabled" )
	end,
	ShouldShowAnnouncersMenu = function ( f80_arg0 )
		local f80_local0 = Engine.InFrontend()
		if f80_local0 then
			f80_local0 = Engine.IsCoreMode()
			if f80_local0 then
				f80_local0 = not Engine.GetDvarBool( "killswitch_announcers" )
			end
		end
		return f80_local0
	end,
	IsSpecificIntegerOmnvarEqualTo = function ( f81_arg0, f81_arg1 )
		return Game.GetOmnvar( f81_arg0 ) == f81_arg1
	end,
	IsSpecificIntegerOmnvarGreaterThan = function ( f82_arg0, f82_arg1 )
		return f82_arg1 < Game.GetOmnvar( f82_arg0 )
	end,
	IsSpecificIntegerOmnvarGreaterThanOrEqualTo = function ( f83_arg0, f83_arg1 )
		return f83_arg1 <= Game.GetOmnvar( f83_arg0 )
	end,
	IsSpecificIntegerOmnvarLessThan = function ( f84_arg0, f84_arg1 )
		return Game.GetOmnvar( f84_arg0 ) < f84_arg1
	end,
	IsSpecificIntegerOmnvarLessThanOrEqualTo = function ( f85_arg0, f85_arg1 )
		return Game.GetOmnvar( f85_arg0 ) <= f85_arg1
	end,
	IsSpecificOmnvarTrue = function ( f86_arg0 )
		return Game.GetOmnvar( f86_arg0 )
	end,
	IsEventIntegerOmnvarEqualTo = function ( f87_arg0, f87_arg1 )
		return Game.GetOmnvar( f87_arg0.value ) == f87_arg1
	end,
	IsEventIntegerOmnvarGreaterThan = function ( f88_arg0, f88_arg1 )
		return f88_arg1 < Game.GetOmnvar( f88_arg0.value )
	end,
	IsEventIntegerOmnvarGreaterThanOrEqualTo = function ( f89_arg0, f89_arg1 )
		return f89_arg1 <= Game.GetOmnvar( f89_arg0.value )
	end,
	IsEventIntegerOmnvarLessThan = function ( f90_arg0, f90_arg1 )
		return Game.GetOmnvar( f90_arg0.value ) < f90_arg1
	end,
	IsEventIntegerOmnvarLessThanOrEqualTo = function ( f91_arg0, f91_arg1 )
		return Game.GetOmnvar( f91_arg0.value ) <= f91_arg1
	end,
	IsEventOmnvarTrue = function ( f92_arg0 )
		return Game.GetOmnvar( f92_arg0.value )
	end,
	IsConsoleGame = function ( f93_arg0 )
		return Engine.IsConsoleGame()
	end,
	IsPS4 = function ( f94_arg0 )
		return Engine.IsPS4()
	end,
	IsPC = function ( f95_arg0 )
		return not Engine.IsConsoleGame()
	end,
	IsXboxOne = function ( f96_arg0 )
		return Engine.IsXB3()
	end,
	IsXboxLive = function ( f97_arg0 )
		local f97_local0 = Engine.IsXB3()
		if not f97_local0 then
			f97_local0 = Engine.IsPCApp()
		end
		return f97_local0
	end,
	IsPCApp = function ( f98_arg0 )
		return Engine.IsPCApp()
	end,
	IsPCDesktop = function ( f99_arg0 )
		return Engine.IsPC() and not Engine.IsPCApp()
	end,
	IsUserAGuest = function ( f100_arg0 )
		return Engine.IsUserAGuest( f100_arg0 )
	end,
	IsUserSignedIn = function ( f101_arg0 )
		return Engine.IsUserSignedIn( f101_arg0 )
	end,
	IsFateCardSlotUnlocked = function ( f102_arg0, f102_arg1 )
		return Engine.IsUnlocked( f102_arg0, "fatedecksize", f102_arg1, true )
	end,
	NumberOfPlayers = function ( f103_arg0, f103_arg1 )
		if tonumber( f103_arg1 ) == Game.GetNumPlayersOnTeam( Teams.allies ) then
			return true
		else
			return false
		end
	end,
	CharacterImagesAreLoaded = function ( f104_arg0 )
		if DataSources.inGame.CP.playerCharacter:GetValue( f104_arg0 ) ~= 4095 then
			return true
		else
			return false
		end
	end,
	SecretCharacterSelection = function ( f105_arg0, f105_arg1 )
		local f105_local0 = Engine.GetPlayerDataEx( f105_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "characterSelect" )
		local f105_local1 = false
		if f105_local0 == tonumber( f105_arg1 ) then
			f105_local1 = true
		end
		return f105_local1
	end,
	MusicPlaylistOnCheck = function ( f106_arg0 )
		if Engine.GetDvarFloat( "profileMenuOption_licensedMusicVolume" ) == 0 then
			return false
		else
			return true
		end
	end,
	HasSeenFateCardTips = function ( f107_arg0 )
		if Engine.GetPlayerDataEx( f107_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "fateTipsOff" ) == 1 then
			return true
		else
			return false
		end
	end,
	HasCardPacks = function ( f108_arg0 )
		if ARMORY.GetTotalFortunePacks( f108_arg0 ) > 0 then
			return true
		else
			return false
		end
	end,
	IsSpaceland = function ( f109_arg0 )
		return Engine.GetDvarString( "ui_mapname" ) == "cp_zmb"
	end,
	IsRave = function ( f110_arg0 )
		return Engine.GetDvarString( "ui_mapname" ) == "cp_rave"
	end,
	IsDLC2 = function ( f111_arg0 )
		return Engine.GetDvarString( "ui_mapname" ) == "cp_disco"
	end,
	IsDLC3 = function ( f112_arg0 )
		return Engine.GetDvarString( "ui_mapname" ) == "cp_town"
	end,
	IsDLC4 = function ( f113_arg0 )
		return Engine.GetDvarString( "ui_mapname" ) == "cp_final"
	end,
	IsDirectorsCutOn = function ( f114_arg0 )
		if Engine.GetPlayerDataEx( f114_arg0, CoD.StatsGroup.Coop, "dc" ) == true then
			return true
		else
			return false
		end
	end,
	IsDirectorsCutAvailable = function ( f115_arg0 )
		if Engine.GetPlayerDataEx( f115_arg0, CoD.StatsGroup.Coop, "dc_available" ) == true and not Engine.GetDvarBool( "scr_boss_battles_enabled" ) then
			return true
		else
			return false
		end
	end,
	HasMapTalisman = function ( f116_arg0, f116_arg1 )
		local f116_local0 = Engine.GetPlayerDataEx( f116_arg0, CoD.StatsGroup.Coop, "haveItems", f116_arg1 )
		local f116_local1 = false
		if f116_local0 == true then
			f116_local1 = true
		end
		return f116_local1
	end,
	HasBeatenMeph = function ( f117_arg0 )
		if Engine.GetPlayerDataEx( f117_arg0, CoD.StatsGroup.Coop, "meritState", "mt_dlc4_troll2" ) == 1 then
			return true
		else
			return false
		end
	end,
	IsShuffleOn = function ( f118_arg0 )
		if Engine.GetPlayerDataEx( f118_arg0, CoD.StatsGroup.Coop, "zombiePlayerLoadout", "lobbySong" ) == 22 then
			return true
		else
			return false
		end
	end,
	hasSongsUnlocked = function ( f119_arg0 )
		if Engine.GetPlayerDataEx( f119_arg0, CoD.StatsGroup.Coop, "hasSongsUnlocked", "any_song" ) == 1 then
			return true
		else
			return false
		end
	end,
	ShouldShowTips = function ( f120_arg0 )
		if CONDITIONS.IsSplitscreen( f120_arg0 ) then
			return false
		elseif Engine.GetDvarString( "ui_mapname" ) == "cp_zmb" then
			return true
		else
			return false
		end
	end,
	IsBossBattleOn = function ( f121_arg0 )
		if Engine.GetDvarBool( "online_zombie_boss_battle" ) then
			return true
		else
			return false
		end
	end,
	IsBossBattlOnAndAliensMode = function ( f122_arg0 )
		if Engine.GetDvarBool( "online_zombie_boss_battle" ) and Engine.IsAliensMode() then
			return true
		else
			return false
		end
	end,
	JustPlayedBossBattle = function ( f123_arg0 )
		if Engine.GetDvarInt( "scr_direct_to_grey" ) == 1 or Engine.GetDvarInt( "scr_direct_to_super_slasher" ) == 1 or Engine.GetDvarInt( "scr_direct_to_rat_king" ) == 1 or Engine.GetDvarInt( "scr_direct_to_crab_boss" ) == 1 or Engine.GetDvarInt( "scr_direct_to_rhino_fight" ) == 1 or Engine.GetDvarInt( "scr_direct_to_meph_fight" ) == 1 then
			return true
		else
			return false
		end
	end,
	IsEuropa = function ( f124_arg0 )
		return Game.GetMapName() == "europa"
	end,
	IsPearlHarbor = function ( f125_arg0 )
		local f125_local0 = Game.GetMapName()
		local f125_local1
		if f125_local0 ~= "phparade" and f125_local0 ~= "phstreets" and f125_local0 ~= "phspace" then
			f125_local1 = false
		else
			f125_local1 = true
		end
		return f125_local1
	end,
	IsMoon = function ( f126_arg0 )
		local f126_local0 = Game.GetMapName()
		local f126_local1
		if f126_local0 ~= "moon_port" and f126_local0 ~= "moonjackal" then
			f126_local1 = false
		else
			f126_local1 = true
		end
		return f126_local1
	end,
	IsTitan = function ( f127_arg0 )
		local f127_local0 = Game.GetMapName()
		local f127_local1
		if f127_local0 ~= "titan" and f127_local0 ~= "titanjackal" then
			f127_local1 = false
		else
			f127_local1 = true
		end
		return f127_local1
	end,
	IsRogue = function ( f128_arg0 )
		return Game.GetMapName() == "rogue"
	end,
	IsPrisoner = function ( f129_arg0 )
		return Game.GetMapName() == "prisoner"
	end,
	IsHeist = function ( f130_arg0 )
		local f130_local0 = Game.GetMapName()
		local f130_local1
		if f130_local0 ~= "heist" and f130_local0 ~= "heistspace" then
			f130_local1 = false
		else
			f130_local1 = true
		end
		return f130_local1
	end,
	IsMars = function ( f131_arg0 )
		return Game.GetMapName() == "marsbase"
	end,
	IsYard = function ( f132_arg0 )
		return Game.GetMapName() == "yard"
	end,
	IsInCredits = function ( f133_arg0 )
		local f133_local0 = Engine.GetDvarBool( "credits_active" )
		if not f133_local0 then
			f133_local0 = Engine.GetDvarInt( "ui_play_credits" ) == 1
		end
		return f133_local0
	end,
	IsStoreAllowed = function ( f134_arg0 )
		return not Engine.GetDvarBool( "killswitch_store" )
	end,
	IsTrialLicense = function ( f135_arg0 )
		return Engine.IsTrialLicense()
	end,
	IsGameBattlesAllowed = function ( f136_arg0 )
		return Engine.GetDvarBool( "cg_mlg_gamebattles_enabled" ) and not Engine.IsTrialLicense()
	end,
	IsQuarterMasterAllowed = function ( f137_arg0 )
		return not Engine.GetDvarBool( "killswitch_quartermaster" )
	end,
	IsMPLeaderboardsAllowed = function ( f138_arg0 )
		return not Engine.GetDvarBool( "killswitch_mp_leaderboards" )
	end,
	IsCPLeaderboardsAllowed = function ( f139_arg0 )
		return not Engine.GetDvarBool( "killswitch_cp_leaderboards" )
	end,
	IsLeaderboardsKillswitched = function ( f140_arg0 )
		local f140_local0
		if Engine.IsCoreMode() then
			f140_local0 = Engine.GetDvarBool( "killswitch_mp_leaderboards" )
			if not f140_local0 then
				f140_local0 = Engine.IsAliensMode()
				if f140_local0 then
					f140_local0 = Engine.GetDvarBool( "killswitch_cp_leaderboards" )
				end
			end
		else
			f140_local0 = Engine.IsAliensMode()
			if f140_local0 then
				f140_local0 = Engine.GetDvarBool( "killswitch_cp_leaderboards" )
			end
		end
		return f140_local0
	end,
	IsCombatRecordKillswitched = function ( f141_arg0 )
		return Engine.GetDvarBool( "killswitch_combat_record" )
	end,
	AreContractsEnabled = function ( f142_arg0 )
		return Engine.GetDvarBool( "mission_team_contracts_enabled" ) and IsPublicMatch()
	end,
	IsMk2TutorialAllowed = function ( f143_arg0 )
		return not Engine.GetDvarBool( "killswitch_mk2_tutorial" )
	end,
	IsEventCrateAllowed = function ()
		return Rewards.IsEventActive()
	end,
	IsEventCrateValid = function ( f145_arg0 )
		if DataSources.frontEnd.MP.armory.eventCrate == nil or DataSources.frontEnd.MP.armory.eventCrate.identifier == nil then
			return false
		end
		local f145_local0 = DataSources.frontEnd.MP.armory.eventCrate.identifier:GetValue( f145_arg0 )
		local f145_local1
		if f145_local0 == nil or f145_local0 == "" then
			f145_local1 = false
		else
			f145_local1 = true
		end
		return f145_local1
	end,
	IsMWRAllowed = function ( f146_arg0 )
		return Engine.IsConsoleGame()
	end,
	IsJapanese = function ( f147_arg0 )
		return IsLanguageJapanese()
	end,
	IsArabic = function ( f148_arg0 )
		return IsLanguageArabic()
	end,
	IsArabicSKU = function ( f149_arg0 )
		return IsArabicSKU()
	end,
	IsDoubleXPActive = function ()
		return Cac.IsDoubleXPActive()
	end,
	IsDoubleWeaponXPActive = function ()
		return Cac.IsDoubleWeaponXPActive()
	end,
	IsDoubleMissionTeamXPActive = function ()
		return Cac.IsDoubleMissionTeamXPActive()
	end,
	HasDoubleXPTokens = function ( f153_arg0 )
		return Cac.HasDoubleXPToken( f153_arg0 )
	end
}
