k   j�  _finished >  ��  >  d�  
  7#  >  ��  shoot_finished 
  0#     �  
  U)  
  )     ��     �? B
  �     �? B
  �     �? B
  �     �?    �? B
  �     �? B
  �     �? B
  �     �? B
  �     �? B
  �  /   o? B
  �  cloneGreyIdle 
  X#  masterGreyIdle 
  X#  c   q? iw7_zapper_grey prop_mp_dome_shield_scr quest_ufo_spawn_minialiens j
  �( clone_complete B
  %n  clone_complete B
  Ln      F�  idle duplicating_attack 
  X#  duplicating_attack d   � game_ended clone_complete B
  *n  clone_complete B
  >n  �   �#  grey player 2   ��  update_mobile_shield_visibility B   �|  [
  ��  9   ��  7   x     6{  �   ! game_ended axis zombie_grey �
  �    &�  s   ��  script_model tag_origin tag_origin I   nQ  tag_origin zombie_grey_start_duplicate /   ,�  death death tag_origin zombie_grey_start_duplicate /   @3 death death tag_origin zombie_grey_start_duplicate �   ��  stop_health_light_monitor park_alien_gray_small 4   1A  6   p  5   r  +   ��  )   ��  5   q     ��     ��  T   OB  jump_left jump_right jump_back jump_left 3   ;�  death duplicating_attack 
  X#  end 
   ��  F   r? grey play regen off backpack_dome_shield on regen_beam     actually_doing_regen 
  _#  (   p? on backpack_dome_shield off regen_beam    s? end 
  g#  $   t? early_end 
  g#  early_end 
  0#  E   v? grey_shockwave_build shock_wave_damage 
  g#  shockwave_deploy update_mobile_shield_visibility grey_shockwave /   �>  B
  �  mini_grey_melee 
  X#  master_grey_melee 
  X#  A   u? prop_mp_dome_shield_scr start_summon_zombies 
  g#  early_end 
  g#  D   � ,  � ground_spawn_no_boards spawn_ground generic_zombie a   B
  �  summon_zombie_energy_ring zmb_grey_energy_ring_activate zmb_grey_energy_ring_activate_lp B
  ��  intro_vignette_done death B
  *7 B
  �  zmb_grey_energy_ring_deactivate 3   e( B
  � a  ��  �   
�  zombie_grey_shockwave_begin shockwave_deploy B
  47 shockwave_deploy zombie_grey_shockwave_deploy �   @]  end regen_pain_in early_end regen_pain_loop shock_wave_damage shockwave script_model tag_origin tag_origin zombie_grey_teleport_trail death movedone B
  +7 &   }  �   S�  [
  ��  z  ��  l   y? teleport_summon .  ��  .      set_next_melee_time 
  )  P   x? teleport_dash .  ��  .      set_next_melee_time 
  )  �   w? update_mobile_shield_visibility teleport_attack .  ��  .      set_next_melee_time 
  )  update_mobile_shield_visibility y       get_teleport_end_pos ufo_zombie_spawn_loc targetname B
  ��  B
  /x  B
  ]  E       clear_from_players T   �W  teleport_summon summon teleport_summon ^   �W  teleport_attack attack teleport_attack �   L script_model tag_origin grey_teleport_start on teleport_attack_trail start movedone grey_teleport_end low zmb_comment_vo quest_ufo_alien_teleport j
  �( off teleport_attack_trail end    A  death death     ��  
  X#  end 
   ��  P    fire zmb_grey_teleport_attack �   B start_summon_zombies B
  �  2   �|  B
  �  ,   �|  [
  ��     �|  L   �|  B
  �"  B
  /x  B   7& �   �|  B
  /x  B
  �  B
  �"  B
  y"  �   z? update_mobile_shield_visibility update_mobile_shield_visibility L   �|  B
  �"  B
  �"  B
  �"  B
  "  B
  "  B
  "  k   
{  B
  ]  1   {  B
  ]  J   	{  position `   �|  fraction position m   �  zombie_grey_teleport script_model tag_origin tag_origin zombie_grey_teleport_trail movedone N   �  zombie_grey_teleport_trail movedone zombie_grey_teleport �   �  B
  � script_model grey_bubbleshield_start script_model prop_mp_domeshield_col J       setpartstates death death active plant neutral plant active armed *   �M  grey_bubbleshield_end *   �X  grey_bubbleshield_end death death U   ��  *   ��  on spawn_beam <  ��  (   ��  on spawn_beam 
  _#     ��  off spawn_beam    �  B
  �  �   ��  
  %)  face angle abs face enemy face angle abs B
  � _finished 
  )  end 
  0#  �   �X  
  %)  
  %)  B
  �  5  �  
  E#  early_end start_melee fire stop end  ^   ��  B
  ]  B
  ]     F�  e   h�  targetname mini_grey_shock_arc_trigger B
  �  (   b|  B
  k�  �   m  zombie_mini_grey_shock_arc B
  �6 stop_shock_arc_trigger_monitor s   'x  B   :�  stop_shock_arc_trigger_monitor trigger B
  �6 e   �z  targetname mini_grey_shock_arc_trigger B
  �  ?   �7  #   5_  grey_duplicating_attack_timer grey_duplicating_attack_timer grey_duplicating_attack_end z  h( o   DF  _   =F     �\  force_drop_max_ammo B
  >n  