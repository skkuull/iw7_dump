?  k*  passive_support_drop ?  ??  ?  ??  cancel_jackal KILLSTREAKS_AIR_SPACE_TOO_CROWDED ?
  " none killstreak_finished_with_weapon_ cancel_jackal called_in_jackal targetname airstrikeheight wardenKSCount wardenKSCount ch_warden_double ?
  ??  ?  ? veh_mil_air_ca_dropship_mp jackal_turret_mp veh_mil_air_ca_dropship_mp_turret jackal_cannon_mp veh_mil_air_ca_dropship_turret_missile KILLSTREAKS_HINTS_JACKAL_GUARD follow_player ?
      getrarityforlootitem  _ passive_extra_flare ?  ??  passive_moving_fortress ?  ??  jackal_turret_mp veh_mil_air_ca_dropship_mp_turret passive_support_drop ?  ??  guard_location veh_jackal_mp     turreton     turretweapon     cannonweapon     cannonon Killstreak_Air ?  C  tag_turret misc_turret Machine_Gun tag_turret manual_target tag_origin misc_turret Cannon tag_origin manual_target tag_origin script_model tag_origin B
  ?"  killstreak_jackal_mp j_body ?  ?n  dropship_enemy_hover_world_grnd ?  ?n  tag_turret_front script_model tag_turret_front passive_moving_fortress ?  ??  tag_turret_rear passive_support_drop ?  ??  jackaldrop     dropcrates ?  C~  ?  ?I  tag_origin     dropcrates     dropcrates fly thrusters ?   ?     ?P  death ?
  7 dropship_killstreak_flyby    Q  death ?
  7 b  ?P  death leaving dropship_killstreak_thrust_change     dropcrates goal     dropcrates slow thrusters     dropcrates all_crates_gone B
  67 follow_player ?  t?  ?   ?e  engagePrimary engagePrimary leaving death     turreton ?
  ??  stop_firing follow_player noTargetsFound ?   ?e  engageSecondary engageSecondary leaving death     cannonweapon     cannonon ?
  ??  passive_moving_fortress ?  ??  stop_firing ?
  7 5  Fr  death leaving guard_location priority_target jackal_crashing disconnect following_player slow thrusters ?
  ??  following_player begin_evasive_maneuvers goal B
  *7 ?
  7       guardposition death leaving follow_player jackal_crashing disconnect slow thrusters ?
  ??  following_player begin_evasive_maneuvers goal B
  *7        patrolfield death leaving guard_location priority_target jackal_crashing disconnect slow thrusters     patroltarget     patroltarget     patroltarget specialty_blindeye     patroltarget     patroltarget     patroltarget     patroltarget     patroltarget     patroltarget ?
  7 ?       jackalfindfirstopenpoint     initialpatrolpoint     initialpatrolpoint     initialpatrolpoint     initialpatrolpoint     initialpatrolpoint 4       jackalcanseelocation ?
  ?H  ?
  ??  j       jackalcanseeenemy ?
  ?H  j_head j_mainroot tag_origin ?
  ??  :      jackalmovetoenemy     patroltarget     patroltarget ?
  ??  ?
  ?H  ?
  ??  hittype hittype_none position position position position patrol begin_evasive_maneuvers goal B
  *7 ?       jackalfindclosestenemy specialty_blindeye B
  ?6 =       isjackalenemyindoors ?
  ?H  ?
  ??  @       watchpatroltarget death leaving jackal_crashing disconnect disconnect death     patroltarget B
  67     patroltarget ?       jackalmovetolocation ?
  ??  begin_evasive_maneuvers goal B
  *7 >  ?  death leaving ?
  ??  fast thrusters ?
  ??  dropship_killstreak_flyby goal fly thrusters ?
  ??  dropship_killstreak_flyby goal jackal_gone ?   ??  killstreak ended - jackal ?
  ?  `   &?  death game_ended passive_extra_flare ?  ??  ?
  7 jackal_end ?
  ??     ?: death leaving game_ended n   ??  randomJackalMovement randomJackalMovement death acquiringTarget leaving randomMovement ?
  z[  goal ?   ??  0  ?  death acquiringTarget leaving C   T?  +   Q?  I  {m  leaving explode death target_timeout ?
  ??  ?
  ?  jackal_fire ?
  8?  killstreak_personal orange ?
  ??  target_timeout turret_on_target plr_killstreak_target ?
  ??  start_firing     turretweapon passive_moving_fortress ?  ??  ?
  ?  ?
  7 E  ym  leaving explode death target_cannon_timeout target_cannon_timeout turret_on_target plr_killstreak_target ?
  ??  passive_moving_fortress ?  ??  start_firing     cannonweapon passive_moving_fortress ?  ??  ?
  ?  ?
  7 ?
  ?  "       watchmissilelaunch death missile_fire V       setmissilekillcament leaving explode death target_cannon_timeout missile_fire ?   K: death leaving stop_firing disconnect death B
  67 timeout Machine_Gun ?
  ??  stop_firing    ?  death leaving ?   s  death leaving priority_target ?
  ??  attackTarget >   o  death leaving ]   ??  death leaving $  ??  death playing team team team spectator specialty_blindeye ?
  ?  ?
  ??  entity L  ~  death tag_origin chargeshot lockon passive_moving_fortress ?  ??  ?   ??  death damage ?
  ?< aamissile_projectile_mp nuke_mp MOD_EXPLOSIVE ?  X7  team ?  ߝ  ?  ?  ?  ??   ?
  ?. ?
  ??  ?
      getrarityforlootitem callout_destroyed_harrier  _ jackal_destroyed destroyed_jackal jackal ?
  H?  $   >~  ?   ?  death tag_engine_left tag_engine_left tag_engine_right tag_engine_right ?
  7 tag_engine_left2 tag_engine_left2 tag_engine_right2 tag_engine_right2 tag_engine_left heavy_smoke damage ?   ??  jackal_gone death ?
  ??  ?
  ?A  ?
  7 C   ??  dropship_explode_mp explode j_body jackal_explosion B
  ?~  j   ??  explode jackal_crashing explode engine ?
  7 U   ? death acquiringTarget leaving randMove ?
  ?	 surfacetype surftype_none ?   ? death acquiringTarget leaving     dropcrates     dropcrates ?
  ?	 position position 9   ?B  goal death R   ??  death leaving disconnect joined_team B
  *7   ?: disconnect death leaving game_ended trigger ?
  Ɵ  ?
  ??  guard_location ?
  ?H  ?
  ??  KILLSTREAKS_CANNOT_BE_CALLED ?
  " guard_location follow_player KILLSTREAKS_HINTS_JACKAL_FOLLOW jackal_guard ?
  8?  mp_killstreak_warden_switch_mode guard_location KILLSTREAKS_HINTS_JACKAL_GUARD mp_killstreak_warden_switch_mode ?
  7 ?  t?     ?]  ?
  7 dropship_killstreak_thrust_change !   &?  follow_player guard_location follow_player >   l?  game_ended ?  &%  ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction ?
  ??  fraction I   ??  javelin_clu_lock B
  ??  ?
  7 javelin_clu_lock C   ??  javelin_clu_aquiring_lock ?
  7 javelin_clu_aquiring_lock A   e*  death begin_evasive_maneuvers begin_evasive_maneuvers death B
  67 timeout ?   ?: death leaving following_player ?
  ??  ?
  7 "       watchdropcratesearly dropped_crates     dropcrates death ?       dropcrates ?  ?  ?  n?  ?  m?  ?      handlenavobstacle dropped_crates         watchforcapture death captured B
  *7 crate_captured_ F       watchjackalcratepickup death leaving crate_captured_2 crate_captured_1 crate_captured_0 B
  *7     dropcrates all_crates_gone 