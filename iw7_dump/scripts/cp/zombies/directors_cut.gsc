*   ?  vfx/iw7/levels/cp_final/pap/vfx_filmreel_golden_anim.vfx directors_cut_golden_film vfx/iw7/levels/cp_final/pap/vfx_soulkey_place.vfx soul_key_place F       start_directors_cut game_ended E      log_using_dc_mode        store_no_dc_mode_in_player_data E      log_using_dc_mode        allow_directors_cut     scripts/cp/zombies/direct_boss_fight     should_directly_go_to_boss_fight )       directors_cut_player_connect_monitor game_ended connected /       give_directors_cut_benefits_to disconnect spawned_player     scripts/cp/maps/cp_zmb/cp_zmb_ghost_wave     set_consumable_meter_scalar        give_perkaholic_to     have_permanent_perks     scripts/cp/maps/cp_zmb/cp_zmb_ghost_wave ?_         give_unlimited_self_revive     max_self_revive_machine_use     have_gns_perk         try_drop_talisman game_ended ?       drop_talisman d e a t h cp_final cp_town cp_disco cp_rave cp_zmb script_model directors_cut_origin talisman_flames     talisman 7       should_drop_talisman <       enable_talisman_pick_up_for_players .       enable_talisman_pick_up_for     players_who_can_pick_up     players_who_can_pick_up     players_who_can_pick_up     players_who_can_pick_up        player_can_earn_talisman dc cp ?       set_up_soul_jar_interaction targetname pap_machine open_soul_jar open_soul_jar      disable_guided_interactions open_soul_jar Y
  \         try_open_soul_jar ?       make_talisman_pick_up_interaction talisman_pick_up talisman_pick_up      disable_guided_interactions talisman_pick_up Y
  \  *       talisman_player_connect_monitor game_ended talisman_pick_up_complete connected $       remove_talisman_interaction disconnect game_ended spawned_player Y
  ?         talisman_hint_func DIRECTORS_CUT_PICK_UP_TALISMAN DIRECTORS_CUT_UNABLE_PICK_UP_TALISMAN        soul_jar_hint_func  G       pick_up_talisman Y
  ?      players_who_can_pick_up B
  ?"      players_who_can_pick_up     talisman ,       update_talisman_interaction_after_pick_up     players_who_can_pick_up Y
  ?  talisman_pick_up_complete     talisman       mark_talisman_possession item_1 item_2 item_3 item_4 item_5 cp_final cp_town cp_disco cp_rave cp_zmb haveItems cp ui_mapname mt_tali_1 ^
  ??  mt_tali_2 ^
  ??  mt_tali_3 ^
  ??  mt_tali_4 ^
  ??  mt_tali_5 ^
  ??  cp_final cp_town cp_disco cp_rave cp_zmb        activate_directors_cut_global_benefits 	       give_unlimited_fnf_refill     unlimited_fnf        allow_max_pap_from_start ?       insert_fuses_into_pap_machine ui_mapname targetname pap_machine close door upgraded machine neutral reels on reels open_idle door     player_pap_machines upgraded machine cp_zmb  	       upgrade_magic_wheel     magic_wheel_upgraded_pap1 A      add_wonder_weapons_to_magic_wheel iw7_dischord_zm_pap1 dischord iw7_facemelter_zm_pap1 facemelter iw7_headcutter_zm_pap1 headcutter iw7_shredder_zm_pap1 shredder iw7_harpoon1_zm acidrain iw7_harpoon2_zm benfranklin iw7_harpoon3_zm+akimbo trapomatic iw7_harpoon4_zm whirlwind iw7_nunchucks_zm_pap1 nunchucks iw7_cutie_zm+cutiecrank+cutiegrip+cutieplunger cutie iw7_venomx_zm_pap1 venomx cp_final cp_town cp_disco cp_rave cp_zmb  7  ?z  8       get_pre_perkaholic_wait_time cp_final cp_town cp_disco cp_rave cp_zmb        open_soul_jar dc_available cp       open_soul_jar_sequence targetname pap_machine targetname pap_machine soul_key_place targetname pap_machine j_top_wheel j_bottom_wheel ?       make_lost_reel targetname pap_machine script_model directors_cut_origin on lost_reel ?       can_open_soul_jar dc_available cp soul_key_1 haveSoulKeys cp soul_key_2 haveSoulKeys cp soul_key_3 haveSoulKeys cp soul_key_4 haveSoulKeys cp soul_key_5 haveSoulKeys cp R       try_play_lost_reel_vfx_on_machine     lost_reel_vfx_on_machine B
  ??      lost_reel_vfx_on_machine targetname pap_machine tag_origin directors_cut_golden_film ?       set_directors_cut_is_activated     directors_cut_is_activated     directors_cut_is_activated        directors_cut_is_activated     directors_cut_is_activated B
  ??         directors_cut_activated_for dc cp        get_directors_cut_starting_currency z       start_level_specific_easter_eggs cp_final cp_town cp_disco cp_rave cp_zmb  I       give_dc_player_extra_xp_for_carrying_newb c
  ?  ?       get_num_of_newbs_in_game soul_key_1 soul_key_2 soul_key_3 soul_key_4 soul_key_5 cp_final cp_town cp_disco cp_rave cp_zmb haveSoulKeys cp        cp_zmb_directors_cut_easter_egg     glasses_drop_change_increase   ?B  coaster_started script_model cp_final_talisman_alt ride_finished M       talisman_visibility_manager B
  ??        shoot_talisman_monitor disconnect ride_finished B
  ??  +Attack shoot_while_riding_coaster +attack_akimbo_accessible shoot_while_riding_coaster shoot_while_riding_coaster souvenir_pickup cp_zmb dcq cp hitaliensoft O
  ?. mt_dc_1 ^
  ??  B
  ??  any_song hasSongsUnlocked cp song_7 hasSongsUnlocked cp         cp_rave_directors_cut_easter_egg     dc_wheel_of_misfortune_start_func     enable_slasher_weapon     enable_slasher_weapon E      dc_wheel_of_misfortune_start_func     dc_wheel_of_misfortune_start_func script_model cp_final_talisman_alt arcade_game_over_for_player talisman_hit_by_knife w
  ,7 talisman_hit_by_knife souvenir_pickup cp_rave dcq cp hitaliensoft O
  ?. mt_dc_2 ^
  ??  B
  ??  any_song hasSongsUnlocked cp song_8 hasSongsUnlocked cp ?       talisman_damage_monitor timeout damage iw7_cpknifethrow_mp talisman_hit_by_knife P       cp_disco_directors_cut_easter_egg script_model cp_final_talisman_alt +      disco_talisman_damage_monitor death damage     got_disco_talisman B
  ??      got_disco_talisman crafting_pickup cp_disco dcq cp hitaliensoft O
  ?. mt_dc_3 ^
  ??  B
  ??  any_song hasSongsUnlocked cp song_9 hasSongsUnlocked cp 2       talisman_clean_up_monitor death regular_wave_starting G       disco_talisman_visibility_manager )       disco_player_connect_monitor death connected ?       cp_town_directors_cut_easter_egg script_model directors_cut_origin on small_red_talisman regular_wave_starting 2       town_player_connect_manager death connected ?       town_talisman_visibility_manager =       town_talisman_player_shoot_manager       shoot_small_talisman_monitor disconnect death +Attack try_shoot_at_small_talisman +attack_akimbo_accessible try_shoot_at_small_talisman try_shoot_at_small_talisman sb_quest_item_pickup cp_town dcq cp hitaliensoft O
  ?. mt_dc_4 ^
  ??  B
  ??  any_song hasSongsUnlocked cp song_10 hasSongsUnlocked cp        facing_the_right_angles b      cp_final_directors_cut_easter_egg     abandoned_shooting_gallery_interactions regular_wave_starting event_wave_starting B
  *7     abandoned_shooting_gallery_interactions Y
  ?  ?       set_up_abandoned_shooting_gallery_interaction_at abandoned_shooting_gallery abandoned_shooting_gallery      disable_guided_interactions abandoned_shooting_gallery     abandoned_shooting_gallery_interactions     abandoned_shooting_gallery_interactions Y
  \         abandoned_shooting_gallery_hint_func  ?       try_abandoned_shooting_gallery     played_abandoned_shooting_gallery B
  ??      played_abandoned_shooting_gallery B
  k?  R       talisman_fly_over_shooting_gallery script_model cp_final_talisman_alt m       talisman_start_flying death movedone %      flying_talisman_damage_monitor death damage sb_quest_item_pickup cp_final dcq cp hitaliensoft O
  ?. mt_dc_5 ^
  ??  B
  ??  any_song hasSongsUnlocked cp song_11 hasSongsUnlocked cp 