c   ?  enable_analytics_log        analyticsactive    b  enable_analytics_log    ??  ;   ?6  5   3: connected ?   1: disconnect spawned_player reload_start weapon_fired jumped adjustedStance B
  57 adjustedStance jumped weapon_fired reload_start spawned_player l   \: disconnect sprint_slide_begin doubleJumpEnd doubleJumpBegin B
  57 doubleJumpBegin doubleJumpEnd sprint_slide_begin ?   ~: disconnect scr_playtest +actionslot 3 log_user_event_start -actionslot 3 log_user_event_end +gostand log_user_event_generic_event log_user_event_start log_user_event_generic_event log_user_event_end B
  47 log_user_event_generic_event Event Logged Generic User Event /   L>  prone crouch ?   ??  ?
  ?  B
  ?6 0   O?  B
  ?    ?A  n   2  prone crouch ?   2  archetype= ; powerPrimary= ; powerSecondary= ; weaponPrimary	 = ?
  $2  ; weaponSecondary = ?
  $2  ; x   2   allies alliesBucket= allies ; axis axisBucket= axis ; ^   ??  playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f action %i health %i gamemp_path ?   ??  Normal Buddy B
  ? playerid %i x %f y %f z %f orientx %f orienty %f orientz %f loadout %s type %s team %s gamemp_spawn_in v   ??  ?
  ?6  playerid %i player_name %s player_xuid %s player_super_name %s gamemp_player_connect R  ??  s axis a l None B
  ? s axis a l None B
  ? playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f weapon %s mean_of_death %s attackerid %i action %i server_death_id %i victim_life_index %d attacker_life_index %d victim_team %s attacker_team %s attacker_pos_x %f attacker_pos_y %f attacker_pos_z %f attacker_gun_orientx %f attacker_gun_orienty %f attacker_gun_orientz %f victim_weapon %s gamemp_death generic B
  ? ?   ??  -1 B
  ? None B
  ? None B
  ? playerid %i x %f y %f z %f gun_orientx %f gun_orienty %f gun_orientz %f weapon %s mean_of_kill %s victimid %i action %i attacker_health %i victim_pixel_count %i gamemp_kill ]   ??  playerid %i x %f y %f z %f orientx %f orienty %f orientz %f duration %i type %s gamemp_explosion ?   ??  B
  ? B
  ? axis axis B
  ? allies allies B
  ? x %f y %f z %f allies_score %i axis_score %i allies_max_score %i axis_max_score %i state %s gamemp_spawn_point @   ??  startx %f starty %f endx %f endy %f axis_centerx %f axis_centery %f allies_centerx %f allies_centery %f, state %i gamemp_front_line 2   ??  uniqueid %i x %f y %f z %f ownerid %i type %s state %s gamemp_object ,   ??  ownerid %s x %f y %f z %f message %s gamemp_message    ??  message %s gamemp_matchtags X   ??  ownerid %i x %f y %f z %f orientx %f orienty %f orientz %f type %s state %s gamemp_power 4   ??  ownerid %i score %i gamemp_scoreboard m   ??  targetname minimap_corner cornera_x %f cornera_y %f cornerb_x %f cornerb_y %f north %f gamemp_map !   ??  playerid %i server_death_id %i weapon %s gamemp_assists    ??  S   D  spectator playing dead e   ʯ   scr_analytics_tag  ?
  ??  OnlineMatch xblive_privatematch PrivateMatch onlinegame OfflineMatch S   ??  super_name %s time_to_use %i num_hits %i num_kills %i player_id %i analytics_mp_supers I   ??  match_time %i player_id %i analytics_mp_super_earned L   ??  killstreak_name %d match_time %i player_id %i analytics_mp_killstreak_earned L   ??  killstreak_name %s time_to_activate %i player_id %i analytics_mp_killstreak    ??  award_message %s analytics_mp_awards S   ??  current_prestige %d current_level %d xp_gained %d xp_source %s player_id %i analytics_mp_player_xp V   ??  weapon %s current_prestige %d current_level %d xp_gained %d xp_source %s player_id %i analytics_mp_weapon_xp ?   ??   player1_index %d player1_xuid %s player2_index %d player2_xuid %s player3_index %d player3_xuid %s player4_index %d player4_xuid %s player5_index %d player5_xuid %s player6_index %d player6_xuid %s player7_index %d player7_xuid %s player8_index %d player8_xuid %s player9_index %d player9_xuid %s player10_index %d player10_xuid %s player11_index %d player11_xuid %s player12_index %d player12_xuid %s analytics_match_player_index_init    j  enable_analytics_spawn_log 
   ˜  M   k  spawnCount spawnIdsToBeInstrumented nextSpawnToBeInstrumented *   ^  ?   `  spawnCount spawnIdsToBeInstrumented nextSpawnToBeInstrumented analytics_spawn_event_log_count B
  ?"  ^   e  ?   h  ?
  ?~  ?   g  ?
  ?  axis allies ?  f  axis allies B  ]  war dom conf front sd dm koth ctf tdef siege gun sr grind ball =   ??  score_type %d score_points %d score_eventid %d game_time %d player_id %d analytics_mp_score_event =   ??  score_type %d score_points %d score_eventid %d game_time %d player_id %d analytics_mp_score_event /   ??  score_type %d score_points %d game_time %d player_id %d analytics_mp_score_event 