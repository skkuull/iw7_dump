j   ]5 vr_unfold_left_rig vr_unfold_right_rig 0  ?  .  ?  B
  Ln  default default_vroutline ?  ??  player_grenade_thrown vr_enemy_human ?  ?"  /  ?  ^   f  ui_in_vr ui_close_vr_pause_menu in_vr_mode B
  >n  default X  ??     k5 r_hudoutlineWidth 0.122 0.235 0.425 0.500 cg_hud_outline_colors_5 ?  ?m  reset_vr B
  ?"  B
  ?"  vr_course_complete shipcrib_hud_complete_simulation vr_tut_leave ?  ?V  vr_tutorial_leave_shown B
  ?n  ?  ؚ  reset_vr vr_delete_thrown_grenades B
  >n  passive vr_ring _intro_show_geo B
  ?6 scn_vr_rotate_90 active passive vr_delete_thrown_grenades B
  *n  ?  ֚  reset_vr vr_delete_thrown_grenades B
  >n  shipcrib_hud_loading_simulation scn_vr_enter vr_intro_part1 intro_finished vr_delete_thrown_grenades B
  *n  intro_finished ?   9?  reset_vr vr_intro_part1   ?  passive vr_intro_part1   5  vr_ring _intro_show_geo ?   B?  reset_vr active passive scn_vr_enter_cap intro_finished ?  ?f  reset_vr shipcrib_hud_activate_simulation negative_90 positive_180 positive_90 negative_90 positive_180 positive_90 negative_90 negative_180 positive_90 shipcrib_hud_cleared_simulation vr_delete_thrown_grenades B
  >n  scn_vr_rotate_90 scn_vr_unfold_side B
  ?P  scn_vr_rotate_180 scn_vr_unfold_side B
  ?P  negative_180 positive_90 positive_180 negative_90  ring_spinning ?  ?e  segment_dropping_geo ?  ?e  F  i& reset_vr ring_spinning ?  ?e  active positive_90 negative_90 positive_180 negative_180 rotation_done passive ring_spinning ?  ?e  left right corner_dropping_geo ?   k& reset_vr active positive_180 negative_180 passive active script_model vr_unfold_left passive ?   s& reset_vr left tag_corner0_bottom tag_corner1_bottom tag_corner2_bottom tag_corner3_bottom right tag_corner1_top tag_corner2_top tag_corner3_top tag_corner0_top z  ?+ reset_vr vr_unfold_ _rig ?  9 tag_segment tag_corner_bottom active ring_unfolding ?  ?e  vr_unfold   5  passive corner_dropping_geo ?  -?  segment_dropping_geo ?  ?e  ring_unfolding ?  ?e  ?  >?  passive active ?  ??  reset_vr vr_ring _intro_show_geo passive active ?  tk  reset_vr segment_dropping_geo ?  ?e  vr_blocks_in_and_hit_01 vr_blocks_in_and_hit_02 vr_blocks_in_and_hit_03 vr_blocks_in_and_hit_04 left vr_blocks_in_bridge_left vr_blocks_in_bridge_right unfold unfold segment_dropping_geo ?  ?e  R   rk  /   
/  ?   ?M  data_box_moving reset_vr data_box_moving ?   ?M  killcounter_appear killcounter_disappear vr_flicker_done ?   1  vr_flicker reset_vr vr_flicker vr_flicker_done 3  G?  front_top_right rear_top_left rear_top_right tag_num tag_num tag_boxcounter tag_boxcounter 9   F?  reset_vr killcounter_animating ?  ?e  killcounter_animating ?  ?e  update   5  killcounter_animating ?  ?e  6  ? reset_vr equipment_range_enemies_dead equipment_range_enemies_dead ring_unfolding ?  ?e  equipment_range_enemies_dead ?   ?  selectedLoadout weapon weaponSetups loadouts weapon weaponSetups loadouts J  ?1  J  ?1  medium ?   ?x  medium medium close long close close medium medium sniper mg smg rifle beam spread pistol  ?   ?y  long medium close B
  ?"  B
  ?"  B
  ?"  long close medium B
  ?"  2  _ reset_vr left targetname vr_enemy_spawn B
  +?  vfx_vr_enemy_spawn ?   n   ?  reset_vr death ?  PU  default_vroutline ?  ??  a   	?  reset_vr death ?  PU  default_vroutline ?  ??  ?  =d  B
  ?"  B
  ?"  equipment_range_enemies_dead j_head j_chest j_shoulder_ri j_shoulder_le j_elbow_ri j_elbow_le j_hip_ri j_hip_le j_knee_ri j_knee_le targetname start_vr_chamber vfx_vr_enemy_death J_Neck vr_enemy_death B
  +?  k  <d  B
  ?"  B
  ?"  equipment_range_enemies_dead targetname start_vr_chamber vfx_vr_enemy_death J_Neck vr_enemy_death B
  +?     m3  j_head j_spineupper j_shoulder_ri j_shoulder_le j_elbow_ri j_elbow_le j_hip_ri j_hip_le j_knee_ri j_knee_le left_leg 
  5|  dismember j_hip_le j_knee_le B
  ?"  right_leg 
  5|  dismember j_hip_ri j_knee_ri B
  ?"  left_arm 
  5|  dismember j_shoulder_le j_elbow_le B
  ?"  right_arm 
  5|  dismember j_shoulder_ri j_elbow_ri B
  ?"  torso 
  5|  dismember j_spineupper B
  ?"  y   *?  j_spine4 _death %  f5 reset_vr vr_delete_thrown_grenades B
  %n  seeker seeker emp emp anti_grav antigrav frag frag foam coverwall drone drone vr_delete_thrown_grenades B
  %n  &  ??  seeker_force_delete B
  Zn  %  ??  emp_force_delete B
  Zn  !  ??  antigrav_force_delete B
  Zn    ??  coverwall_force_delete B
  Zn    ??  frag_force_delete B
  Zn  -  9Q  drone coverwall antigrav emp frag seeker  drone vfx_vr_equipment_derez N   ??  explode missile_stuck death entitydeleted reset_vr targetname vr_thrown_grenade_trigger B
  ?6 ?   ??  reset_vr seeker_force_delete B
  Zn  emp_force_delete B
  Zn  antigrav_force_delete B
  Zn  coverwall_force_delete B
  Zn  frag_force_delete B
  Zn  ?   ??  -  9Q  -  8Q  vfx_vr_equipment_derez ?   ??  vfx_vr_equipment_derez vfx_vr_equipment_derez &  ??  ]   ??  vfx_vr_equipment_derez %  ??  ]   ??  vfx_vr_equipment_derez !  ??  ?   ??  vfx_vr_equipment_derez   ??  T   ??  vfx_vr_equipment_derez   ??  v   ??  reset_vr B
  ?~  emp_shock_short B
  +?  B
  ?"  ?   ??  reset_vr B
  ?6 B
  ?~  emp_shock_short B
  +?  B
  ?"     ??  reset_vr rotation_done vr_delete_thrown_grenades B
  *n  Q   Х  reset_vr targetname vr_trigger_kill_equipment trigger seeker vfx_vr_equipment_derez &  ??    :  reset_vr weapon_fired offhand_fired weapon_switch_started reload_start B
  *7 ?  ?{  ?  =|  ?  ?|  ?  ?|  none none none none /
  @?  chargeshot penetrationrail steeldragon lockon ?   :e  reset_vr death tag_origin B
  ?6 [   ;e  reset_vr death ?   ??  B
  ?~  B
  ?~  B
  ?~     +?  H       create_fx_pause exploder B
  ??  H       create_fx_resume exploder ?  ??  6  A?  reset_vr stop_delay_call stand X  ??  default X  ??  vr_delete_thrown_grenades B
  *n  B
  ?6 tag_origin ring_spinning ?  ?e  ring_unfolding ?  ?e  ?   _F  j_corner    ??   j_segment v   sk   $   ?W  A   ?+ ?  ??  tag_num tag_num0 ?  ?  root  root  root killcounter_animating ?  ?e    ?5 luinotifyserver vr_tutorial_leave_shown B
  >n  1 bg_cinematicAboveUI 1 bg_cinematicFullScreen 1 bg_cinematicCanPause vr_tutorial_leave_shown B
  >n  1 bg_cinematicAboveUI 1 bg_cinematicFullScreen 1 bg_cinematicCanPause acceped_vr B
  4n  acceped_vr B
  *n  ui_in_vr in_vr_mode B
  *n  ?  ?  player_vr_exit_request player_vr_reset_request 2  ?  targetname start_vr_chamber axis ?  ?(  ?  ( shipcrib shipcrib combat_vr normal ?  &?  ?  w+  B
  R  B
  v  B
  `  mantle_enable cg_drawCrosshair ui_hide_weapon_info ui_hide_hud ?  ?  ?    ?  5  ??  axis ?  ?(  shipcrib ?  ( B
  R  B
  v  B
  `  mantle_enable cg_drawCrosshair ui_hide_weapon_info ?  ?+        waittilbinkend B
  ?6 0 bg_cinematicAboveUI ?   ??  playing_vr_tranistion_bink playing_vr_tranistion_bink ship_enter_vr 1 bg_cinematicFullScreen 0 bg_cinematicCanPause 1 bg_cinematicAboveUI weapon_loadout_terminal_intro weapon_loadout_terminal_transition B
  ?6 vr_transition_bink_full_opacity ui_close_vr_pause_menu B
  ?6 