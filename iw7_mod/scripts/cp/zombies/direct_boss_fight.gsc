u         disable_start_spawn_on_navmesh     bosstimer     calculate_time_survived_func     disableplayerdamage #       init_boss_fight_data E      log_using_boss_fight_playlist E      log_boss_fight_result E      log_using_boss_fight_playlist        check_direct_boss_fight        should_directly_go_to_boss_fight     direct_to_boss_fight B
  î  	       activate_direct_to_boss_fight     direct_to_boss_fight        get_direct_to_boss_fight_starting_currency 4       get_direct_to_boss_spawn_point targetname afterlife_arcade B
        additional_afterlife_arcade_start_point     additional_afterlife_arcade_start_point B
  "        disable_things_in_afterlife_arcade game_ended afterlife_spectate_door afterlife_selfrevive_door basketball_game_afterlife laughingclown_afterlife clown_tooth_game_afterlife game_race bowling_for_planets_afterlife shooting_gallery_afterlife arcade_icehock arcade_hero arcade_seaques arcade_boxing arcade_oink arcade_crackpo arcade_plaque arcade_keyston arcade_spider arcade_robottank arcade_riverraid arcade_pitfall arcade_demon arcade_barnstorming arcade_starmaster arcade_cosmic script_noteworthy B
    Y
  à  shooting_gallery_afterlife       enable_things_in_afterlife_arcade afterlife_spectate_door afterlife_selfrevive_door basketball_game_afterlife laughingclown_afterlife clown_tooth_game_afterlife game_race bowling_for_planets_afterlife shooting_gallery_afterlife arcade_icehock arcade_hero arcade_seaques arcade_boxing arcade_oink arcade_crackpo arcade_plaque arcade_keyston arcade_spider arcade_robottank arcade_riverraid arcade_pitfall arcade_demon arcade_barnstorming arcade_starmaster arcade_cosmic script_noteworthy B
    Y
  \  shooting_gallery_afterlife Â       direct_boss_fight_activated scr_direct_to_grey scr_direct_to_super_slasher scr_direct_to_rat_king scr_direct_to_crab_boss scr_direct_to_rhino_fight scr_direct_to_meph_fight cp_final cp_town cp_disco cp_rave cp_zmb         is_meph_fight scr_direct_to_meph_fight        set_up_perk_purchase_board        clean_up_perk_purchase_board     perk_purchase_board     perk_purchase_structs     candy_box     perk_purchase_light_fx     perk_purchase_light_fx     perk_purchase_interactions Y
  à  É       clean_up_weapon_purchase_board stop_weapon_purchase_board     weapon_purchase_interactions Y
  à      weapon_purchase_boards     weapon_board_light_vfx     weapon_board_light_vfx     weapon_purchase_models        clean_up_activation_interaction     boss_fight_activation_interaction Y
  à  =       create_perk_purchase_candy_boxes     perk_purchase_structs         create_perk_purchase_candy_box script_model     perk_purchase_board     candy_box     perk_purchase_structs     perk_purchase_structs F       get_candy_box_loc     perk_purchase_board     perk_purchase_board ±       get_candy_box_struct_loc     perk_purchase_board     perk_purchase_board     perk_purchase_board     perk_purchase_board w       create_perk_purchase_board p7_cafe_wall_menu_01 script_noteworthy afterlife_spectate_door B
  ~  script_model     perk_purchase_board d       player_use_monitor game_ended death B
  ÷6        check_candy_box_looking_at     perk_purchase_structs     candy_box     candy_box_looking_at     candy_box_looking_at (       mark_candy_box_looking_at     candy_box_looking_at Y
  nŞ  [       push_candy_box_forward     num_times_being_looked_at     num_times_being_looked_at     num_times_being_looked_at     num_times_being_looked_at     perk_purchase_board 9       clear_candy_box_looking_at     candy_box_looking_at     candy_box_looking_at     candy_box_looking_at     candy_box_looking_at Y
  nŞ  )       push_candy_box_back     num_times_being_looked_at     num_times_being_looked_at        in_perk_purchase_range S       create_perk_purchase_interaction game_ended     perk_purchase_interactions     perk_purchase_board     perk_purchase_board     perk_purchase_board B
  ]  ´       set_up_perk_purchase_interaction_at perk_purchase perk_purchase      disable_guided_interactions perk_purchase     perk_purchase_interactions     perk_purchase_interactions Y
  \  Â       perk_purchase_hint_func     candy_box_looking_at      kung_fu_mode B
  î       candy_box_looking_at w
  ¾  COOP_PERK_MACHINES_REMOVE_PERK     have_gns_perk B
  î  COOP_PERK_MACHINES_PERK_SLOTS_FULL c
  {  COOP_INTERACTIONS_NEED_MONEY perk_machine_revive w
    COOP_PERK_MACHINES_SELF_REVIVE ,       try_perk_purchase     candy_box_looking_at     kung_fu_mode B
  î  )      perk_purchase_internal disconnect     have_permanent_perks B
  î      have_permanent_perks     candy_box_looking_at w
  ¾  perk_machine_remove_perk perk_machine_remove_perk     current_perk_list     current_perk_list     current_perk_list B
  ©"      current_perk_list ]  \ c
  ù  Y
  nŞ      have_gns_perk B
  î      candy_box_looking_at c
  {  perk c
  E     current_perk_list     current_perk_list     current_perk_list B
  V      current_perk_list ]  N  )       get_board_forward_dist cp_zmb  )       get_board_left_dist cp_zmb  ¸       get_perk_list perk_machine_boom perk_machine_fwoosh perk_machine_flash perk_machine_more perk_machine_rat_a_tat perk_machine_tough perk_machine_run perk_machine_revive perk_machine_zap perk_machine_smack B
  y"  perk_machine_deadeye B
  y"  perk_machine_smack B
  y"  perk_machine_change B
  y"  perk_machine_deadeye B
  y"  cp_final cp_town cp_disco cp_rave cp_zmb        get_perk_cost w
    perk_machine_deadeye perk_machine_zap perk_machine_run perk_machine_more perk_machine_flash perk_machine_fwoosh perk_machine_rat_a_tat perk_machine_smack perk_machine_boom perk_machine_change perk_machine_tough perk_machine_revive ©       get_perk_box_model zmb_candybox_bomb_closed zmb_candybox_quickies_closed zmb_candybox_trail_closed zmb_candybox_mule_closed zmb_candybox_bang_closed zmb_candybox_up_closed zmb_candybox_racin_closed cp_disco_candybox_closed zmb_candybox_tuff_closed cp_town_candybox_change_closed zmb_candybox_blue_closed zmb_candybox_slappy_closed perk_machine_deadeye perk_machine_zap perk_machine_run perk_machine_more perk_machine_flash perk_machine_fwoosh perk_machine_rat_a_tat perk_machine_smack perk_machine_boom perk_machine_change perk_machine_tough perk_machine_revive `       create_perk_purchase_light cp_town     perk_purchase_board     perk_purchase_board script_model direct_boss_fight_origin on perk_board_light     perk_purchase_light_fx #       set_up_weapon_purchase_board h       player_weapon_purchase_monitor game_ended stop_weapon_purchase_board B
  ÷6        check_weapon_looking_at     weapon_purchase_structs     weapon_purchase_looking_at     weapon_purchase_looking_at (       mark_weapon_looking_at     weapon_purchase_looking_at Y
  nŞ  9       clear_weapon_looking_at     weapon_purchase_looking_at     weapon_purchase_looking_at     weapon_purchase_looking_at     weapon_purchase_looking_at Y
  nŞ  e       push_weapon_forward     num_times_being_looked_at     num_times_being_looked_at     num_times_being_looked_at     num_times_being_looked_at script_noteworthy afterlife_spectate_door B
  ~  )       push_weapon_back     num_times_being_looked_at     num_times_being_looked_at [       get_weapon_purchase_range_edge_x_value script_noteworthy afterlife_spectate_door B
  ~  cp_zmb        in_weapon_purchase_range ¨       create_weapon_purchase_boards ch_corkboard_metaltrim_4x8 script_noteworthy afterlife_spectate_door B
  ~      weapon_purchase_boards script_model     weapon_purchase_boards     weapon_purchase_boards c       get_weapon_purchase_board_start_pos script_noteworthy afterlife_spectate_door B
  ~  )       get_weapon_purchase_board_up_start_offset cp_zmb  +       get_weapon_purchase_board_back_start_offset cp_zmb  +       get_weapon_purchase_board_left_start_offset cp_zmb  à       create_weapon_board_lights cp_rave     weapon_board_light_vfx script_noteworthy afterlife_spectate_door B
  ~  script_model direct_boss_fight_origin on weapon_board_light     weapon_board_light_vfx     weapon_board_light_vfx        create_weapon_purchase_models game_ended     weapon_purchase_structs     weapon_purchase_models script_noteworthy afterlife_spectate_door B
  ~  x      get_weapon_list iw7_kbs_zm iw7_dischord_zm iw7_facemelter_zm iw7_headcutter_zm iw7_shredder_zm iw7_m8_zm iw7_longshot_zm iw7_lmg03_zm iw7_mauler_zm iw7_minilmg_zm iw7_unsalmg_zm iw7_sdflmg_zm iw7_fhr_zm iw7_m4_zm iw7_ake_zml iw7_vr_zm iw7_ar57_zm iw7_fmg_zm iw7_arclassic_zm iw7_crdb_zm iw7_mp28_zm iw7_ripper_zmr iw7_erad_zm iw7_ump45_zml iw7_tacburst_zm iw7_ump45c_zm iw7_sdfshotty_zm iw7_spas_zmr iw7_devastator_zm iw7_g18_zmr iw7_kbs_zm iw7_harpoon1_zm iw7_harpoon2_zm iw7_harpoon3_zm+akimbo iw7_harpoon4_zm iw7_m8_zm iw7_longshot_zm iw7_lmg03_zm iw7_mauler_zm iw7_minilmg_zm iw7_unsalmg_zm iw7_sdflmg_zm iw7_fhr_zm iw7_m4_zm iw7_ake_zml iw7_vr_zm iw7_ar57_zm iw7_fmg_zm iw7_arclassic_zm iw7_crdb_zm iw7_mp28_zm iw7_ripper_zmr iw7_erad_zm iw7_ump45_zml iw7_tacburst_zm iw7_ump45c_zm iw7_sdfshotty_zm iw7_spas_zmr iw7_devastator_zm iw7_g18_zmr iw7_katana_zm_pap1 crane snake dragon tiger iw7_nunchucks_zm_pap2 iw7_longshot_zm iw7_lmg03_zm iw7_mauler_zm iw7_minilmg_zm iw7_unsalmg_zm iw7_sdflmg_zm iw7_fhr_zm iw7_m4_zm iw7_ake_zml iw7_vr_zm iw7_ar57_zm iw7_fmg_zm iw7_arclassic_zm iw7_crdb_zm iw7_mp28_zm iw7_ripper_zmr iw7_erad_zm iw7_ump45_zml iw7_tacburst_zm iw7_ump45c_zm iw7_sdfshotty_zm iw7_spas_zmr iw7_devastator_zm iw7_g18_zmr iw7_kbs_zm iw7_longshot_zm iw7_cutie_zm+cutiecrank+cutiegrip+cutieplunger iw7_gauss_zm iw7_cheytac_zmr iw7_lmg03_zm iw7_mauler_zm iw7_minilmg_zm iw7_unsalmg_zm iw7_fhr_zm iw7_m4_zm iw7_vr_zm iw7_ar57_zm iw7_fmg_zm iw7_arclassic_zm iw7_crdb_zm iw7_mp28_zm iw7_ripper_zmr iw7_erad_zm iw7_ump45_zml iw7_tacburst_zm iw7_sdfshotty_zm iw7_devastator_zm iw7_g18_zmr iw7_kbs_zm iw7_longshot_zm iw7_venomx_zm_pap2 iw7_gauss_zm iw7_cheytac_zmr iw7_lmg03_zm iw7_mauler_zm iw7_minilmg_zm iw7_unsalmg_zm iw7_fhr_zm iw7_m4_zm iw7_vr_zm iw7_ar57_zm iw7_fmg_zm iw7_arclassic_zm iw7_crdb_zm iw7_mp28_zm iw7_ripper_zmr iw7_erad_zm iw7_ump45_zml iw7_tacburst_zm iw7_sdfshotty_zm iw7_devastator_zm iw7_g18_zmr cp_final cp_town cp_disco cp_rave cp_zmb 2       get_weapon_model_pos *       get_vertical_space cp_final cp_town  ^       get_weapon_model_start_pos script_noteworthy afterlife_spectate_door B
  ~  *       get_start_down_offset cp_final cp_town  ı      create_weapon_purchase_model script_model     weapontogive w
  Ø  none     pap_2_camo     no_pap_camos     no_pap_camos B
  "  iw7_dischord_zm iw7_facemelter_zm iw7_headcutter_zm iw7_shredder_zm iw7_harpoon1_zm iw7_harpoon2_zm iw7_harpoon3_zm+akimbo iw7_harpoon4_zm harpoon3 harpoon2 harpoon1 harpoon4 shredder dischord headcutter facemelter  axe iw7_axe_zm_pap2 nunchucks iw7_nunchucks_zm_pap2 katana iw7_katana_zm_pap1 camo222 script_noteworthy afterlife_spectate_door B
  ~  venomx iw7_venomx_zm_pap2 forgefreeze iw7_forgefreeze_zm_pap2 cutie iw7_cutie_zm+cutiecrank+cutiegrip+cutieplunger replace_me g18_z akimbo B
  ©"  silencer arcane ark B
  ©"  + + k
  iä  k
  iä  k
  iä  script_weapon script_weapon     weapontogive     camotogive     weapon_purchase_structs     weapon_purchase_structs     weapon_purchase_models     weapon_purchase_models @       get_weapon_model_angles nunchuck katana 5       is_kung_fu tiger snake crane dragon  A       get_kung_fu_string CP_DISCO_CHALLENGES_SNAKE CP_DISCO_CHALLENGES_TIGER CP_DISCO_CHALLENGES_CRANE CP_DISCO_CHALLENGES_DRAGON tiger snake crane dragon A       get_gourd_model weapon_zmb_gourd_crane_wm weapon_zmb_gourd_snake_wm weapon_zmb_gourd_dragon_wm weapon_zmb_gourd_tiger_wm tiger snake crane dragon h       is_wonder_weapon iw7_cutie_zm+cutiecrank+cutiegrip+cutieplunger iw7_harpoon4_zm iw7_harpoon3_zm+akimbo iw7_harpoon2_zm iw7_harpoon1_zm iw7_venomx_zm_pap2 iw7_headcutter_zm iw7_facemelter_zm iw7_dischord_zm iw7_shredder_zm  V       return_pap_attachment replace_me pap2 spiked golf two katana nunchucks machete         create_weapon_purchase_interaction game_ended     weapon_purchase_interactions script_noteworthy afterlife_spectate_door B
  ~  B
  ]  µ       set_up_weapon_purchase_interaction_at weapon_purchase weapon_purchase      disable_guided_interactions weapon_purchase     weapon_purchase_interactions     weapon_purchase_interactions Y
  \        weapon_purchase_hint_func     weapon_purchase_looking_at      kung_fu_mode B
  î       weapon_purchase_looking_at     direct_boss_get_kung_fu_func     weapon_purchase_looking_at  CP_DISCO_CHALLENGES_DRINK_GOURD     weapon_purchase_looking_at     weapontogive c
  {      weapon_purchase_looking_at     weapontogive COOP_INTERACTIONS_NEED_MONEY CP_ZMB_INTERACTIONS_BUY_WEAPON CP_RAVE_BUY_WEAPON CP_DISCO_INTERACTIONS_BUY_WEAPON CP_TOWN_INTERACTIONS_BUY_WEAPON CP_TOWN_INTERACTIONS_BUY_WEAPON cp_final cp_town cp_disco cp_rave cp_zmb DIRECT_BOSS_FIGHT_WEAPON_REFUND w       have_weapon w
  ÷}  B
  î  w
  ÷}  §       try_weapon_purchase     weapon_purchase_looking_at     kung_fu_mode B
  î       weapon_purchase_looking_at     weapontogive     direct_boss_get_kung_fu_func     weapon_purchase_looking_at     weapon_purchase_looking_at     weapontogive     direct_boss_give_kung_fu_func     weapon_purchase_looking_at     weapontogive æ      direct_boss_purchase_weapon c
  {      weapon_purchase_looking_at     weapontogive weapon     weapon_purchase_looking_at     weapontogive c
  E     weapon_purchase_looking_at     weapontogive k
  »  w
  Ø  w
  Ø  c  ¦ÿ  w
  Ø  weapon_taken B
  î      weapon_purchase_looking_at     camotogive w
  Æ  w
  >  B
  "  alt_ w
  Ø  weapon_level_changed <       take_fists_weapon iw7_fists U       apply_weapon_build_kit_options w
  Ø  pap2 B
  "  k
  iä  K       weapon_to_take_for_refund     weapon_purchase_looking_at     weapontogive w
  Ø  N       direct_boss_refund_weapon     weapon_purchase_looking_at     weapontogive c
  ù  super_default_zm D       should_issue_refund B
  î        directbossgetvalidtakeweapon none B
  "  B
  "  w
  B      last_valid_weapon     last_valid_weapon     last_valid_weapon none B
  "  B
  "  w
  B  none B
  "  B
  "  w
  B  super_default_zm frag_grenade_zm        create_activation_interaction game_ended script_noteworthy afterlife_spectate_door B
  ~  cp_zmb B
  ]  °       set_up_boss_fight_activation_interaction_at boss_fight_activation boss_fight_activation      disable_guided_interactions boss_fight_activation     boss_fight_activation_interaction -       activate_boss_fight_hint_func boss_fight_ready_soon B
  4n  boss_fight_ready_soon B
  %n  CP_TOWN_BOSS_FIGHT_READY_SOON DIRECT_BOSS_FIGHT_ACTIVATION        try_activate_boss_fight M       made_direct_boss_fight_purchase     made_direct_boss_fight_purchase     made_direct_boss_fight_purchase B
  î  start_boss_fight_activation        wait_to_activate game_ended start_boss_fight_activation Y
  \      direct_boss_fight_flag_wait boss_fight_ready_soon B
  9n  boss_fight_ready_soon B
  >n      direct_boss_fight_flag_wait B
  Ln  boss_fight_ready_soon B
  *n  Y
  nŞ  j      wait_all_players_press_use game_ended start_direct_boss_fight B
  î  B
  î  B
  î  B
  î  B
  î  B
  î  B
  ÷6 A       start_direct_boss_fight start_direct_boss_fight     disableplayerdamage     boss_fight_activation_interaction Y
  à      start_direct_boss_fight_func     start_direct_boss_fight_func        delay_restore_afterlife_arcade game_ended h       teleport_players_to_boss_fight        get_start_look_at_loc cp_final cp_town cp_disco cp_rave cp_zmb       get_start_stand_loc_list cp_final cp_town cp_disco cp_rave cp_zmb +       level_specific_setup game_ended     setup_direct_boss_fight_func     setup_direct_boss_fight_func        disable_weapon_upgrade_interaction targetname interaction B
    weapon_upgrade Y
  à  7  Æ      open_sesame_func     open_sesame_func B
  î  targetname door_buy open_sesame trigger targetname chi_door open_sesame damage     team_killdoors     team_killdoors L      open_team_killdoor targetname interaction B
    script_noteworthy B
    B
  "  B
  ©"  Y
    team_door_switch 9  /0 restorepower_step1 B
  4n  restorepower_step1 B
  >n  6       start_all_generators Q  Ww  ·       get_players_best_times zm_boss_splash enter_fast_travel zm_boss_time_p1 zm_boss_time_p2 zm_boss_time_p3 zm_boss_time_p4 D       get_player_best_time cp_final bestscore alienPlayerStats cp duration cp H       set_player_best_time cp_final bestscore alienPlayerStats cp duration cp A       boss_fight_splash zm_boss_id zm_boss_splash zm_boss_splash zm_boss_id E       run_boss_timer game_ended boss_beat zm_boss_splash     bosstimer     bosstimer zm_boss_timer f       run_pre_match_timer game_ended enter_fast_travel zm_boss_splash     prebossfighttime     prebossfighttime     prebossfighttime zm_boss_timer     prebossfighttime s      success_sequence boss_beat boss_spaceland boss_rave boss_disco boss_town boss_final boss_dc boss_spaceland  W
  Q c
    E      log_boss_fight_result     bosstimer E      log_wave_dur_boss_fight zm_boss_splash zm_boss_id win allies )       try_set_personal_best_time     bosstimer        should_set_personal_best_time        get_direct_boss_fight_time_survived     bosstimer ÷       move_player_through_portal_tube disconnect   (×      isfasttravelling delete_equipment D    fast_travel_tube_end fast_travel_tube_start     boss_fight_post_portal_tube_func     boss_fight_post_portal_tube_func D  ®à  papRoom w
  æà      kicked_out     isfasttravelling fast_travel_complete   .×  p5_ town_comment_vo fasttravel_exit j
  ( _  ¼  game_ended disconnect move_through_tube targetname targetname fast_travel w
  À  w
  \  zmb_portal_travel_lr script_origin D  ®à  fast_travel w
  æà  w
  :  w
  \  D    (       unlinkplayerafterduration B
  î      rewindmover B
  ÷6 D      teleport_to_portal_safe_spot     teleport_spots w
  1 B
  î      rewindmover   .×      portal_end_origin        adjust_wave_num     wave_num_when_joined all_escape zombie_wave_number U       get_victory_wave_num     bosstimer w       get_fail_wave_num     bosstimer _       get_best_time cp_final cp_town cp_disco cp_rave cp_zmb       get_best_time_for_player_count       cp_final cp_town cp_disco cp_rave cp_zmb @      get_weapon_cost w
  Ø  spas ake gauss sdfar devastator sdfshotty ump45c tacburst mp28 ump45 fmg vr m4 lmg03 sdflmg g18 crdb fhr mauler minilmg unsalmg cutie longshot harpoon3 harpoon2 harpoon1 arclassic ar57 erad ripper m8 cheytac kbs katana nunchucks venomx harpoon4 shredder dischord headcutter facemelter 