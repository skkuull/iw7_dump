?  q#  zombie_grey 
  .#  ?  q#  c6_start zombie_grey 
  #  anim deltas face current death_generic pain_stand shoot_grey <  ?>  <  ??  enter_combat 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand noncombat_stand_idle <  ?>  <  P?  noncombat_stand_idle 
  t#  x  ?? regen_start 
  u#  x  ?? being_cloned 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  exposed_exit 
  u#  walk 
  ??  move_walk_loop 
  u#  exposed_idle 
  u#  enter_combat 
  u#  anim deltas face current death_generic <  ?>  8  ?3  c6_start 
  t#  intro_spawn 
  u#  intro_vignette 
  u#  death_generic <  ?>  exposed_aimset 
  t#  death_generic <  ?>  strafe_aimset 
  t#  anim deltas face enemy death_generic <  ?>  <  ??  melee_charge_to_ready 
  t#  end 
  ?h  melee_attack 
  u#  anim deltas face enemy melee_attack death_generic x  ?>  x  ??  melee_attack 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face enemy death_generic <  ?>  <  ??  melee_stand_to_ready 
  t#  end 
  ?h  melee_attack 
  u#  anim deltas face enemy death_generic <  ?>  <  P?  melee_charge 
  t#  
  S)  melee_charge_to_ready 
  u#  
  O)  exposed_idle 
  u#  <  ?>  4  ?  death_generic 
  t#  4   ?  4  ?  death_standing 
  t#  4  ?>  4  ?  death_crouching 
  t#  4  ?>  4  ?  death_moving 
  t#  4  ?>  4  ?  death_cover 
  t#  anim deltas face current death_generic 7  ?>  7  	A  7  ??  pain_stand 
  t#  end 
  ?h  should_regen 
  u#  anim deltas face current death_moving 7  ?>  7  	A  7  ??  pain_run 
  t#  end 
  ?h  stand_run_loop 
  u#  death_generic 7  ?>  7  	A  7  ??  pain_crouch 
  t#  death_generic <  ?>  7  	A  7  ??  pain_prone 
  t#  cover_right death_cover 7  ?>  7  	A  7  ?  pain_cover_right 
  t#  cover_stand death_cover 7  ?>  7  	A  7  ?  pain_cover_stand 
  t#  cover_crouch death_cover 7  ?>  7  	A  7  ?  pain_cover_crouch 
  t#  cover_left death_cover 7  ?>  7  	A  7  ?  pain_cover_left 
  t#  death_generic <  ?>  7  ??  pain_on_back 
  t#  cover_left death_cover 7  ?>  7  	A  7  ?  pain_cover_left_suppress 
  t#  cover_right death_cover 7  ?>  7  	A  7  ?  pain_cover_right_suppress 
  t#  anim deltas face current reload death_generic pain_stand U  ?>  8  `  exposed_reload 
  t#  x  ?? regen_start 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  end 
  ?h  exposed_idle 
  u#  anim deltas face current throwgrenade death_generic pain_stand 9  ?>  9  ??  exposed_throw_grenade 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand U  ?>  8  ??  exposed_weaponswitch 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand 8  
?  8  j?  exposed_stand_turn 
  t#  x  ?? regen_start 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  end 
  ?h  exposed_idle 
  u#  finish early 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand aim x  o? 8  m?  exposed_idle 
  t#  start_exposed_shoot 
  u#  U  h& exposed_transitions_out 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_stand_to_prone 
  t#  end 
  ?h  exposed_prone 
  u#  anim deltas face current death_generic pain_prone prone _aim_5 <  ?>  8  m?  exposed_prone 
  t#  stand 
  I)  exposed_prone_to_stand 
  u#  
  ??  exposed_prone_to_stand 
  u#  crouch 
  I)  exposed_prone_to_crouch 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_prone_to_stand 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_stand_to_crouch 
  t#  end 
  ?h  exposed_crouch 
  u#  anim deltas face current death_crouching pain_crouch shoot_grey crouch aim _aim_5 <  ?>  8  m?  exposed_crouch 
  t#  stand 
  I)  exposed_crouch_to_stand 
  u#  
  ??  exposed_crouch_to_stand 
  u#  prone 
  I)  exposed_crouch_to_prone 
  u#  8  ??  exposed_crouch_turn 
  u#  exposed_reload_crouch 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_crouch_to_stand 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_prone_to_crouch 
  t#  end 
  ?h  exposed_crouch 
  u#  anim deltas face current death_generic <  ?>  <  ??  exposed_crouch_to_prone 
  t#  end 
  ?h  exposed_prone 
  u#  anim deltas face current death_generic pain_stand 8  
?  8  j?  exposed_crouch_turn 
  t#  end 
  ?h  exposed_crouch 
  u#  finish early 
  ?h  exposed_crouch 
  u#  anim deltas face current reload death_generic pain_stand U  ?>  8  `  exposed_reload_crouch 
  t#  end 
  ?h  exposed_crouch 
  u#  anim deltas face current death_generic pain_stand shoot_grey aim <  ?>  <  ??  exposed_shoot 
  t#  end_exposed_shoot 
  u#  death_generic <  ?>  <  ??  exposed_transitions_out 
  t#  x  ?? regen_start 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  sprint_loop 
  u#  exposed_throw_grenade 
  u#  8  ?  exposed_weaponswitch 
  u#  8  ??  exposed_stand_turn 
  u#  combat 
  ??  exposed_exit 
  u#  exposed_crouch_exit 
  u#  exposed_crouch_exit 
  u#  noncombat_stand_idle 
  u#  
  S)  melee_attack 
  u#  exposed_reload 
  u#  crouch 
  I)  exposed_stand_to_crouch 
  u#  prone 
  I)  exposed_stand_to_prone 
  u#  death_generic <  ?>  <  ??  start_exposed_shoot 
  t#  end 
  ?h  exposed_shoot 
  u#  death_generic <  ?>  <  ??  end_exposed_shoot 
  t#  end 
  ?h  exposed_shoot_out 
  u#  death_generic <  ?>  <  ??  exposed_shoot_out 
  t#  exposed_reload 
  u#  U  h& exposed_idle 
  u#  death_generic <  ?>  stand_run_loop :  f?  step_up_24 
  t#  death_generic <  ?>  stand_run_loop :  f?  iw6_jumpdown_40 
  t#  death_generic <  ?>  stand_run_loop :  f?  step_down_24 
  t#  death_generic <  ?>  stand_run_loop <  ??  combatrun_forward_72 
  t#  death_generic <  ?>  stand_run_loop :  ]?  wall_hop 
  t#  death_generic <  ?>  stand_run_loop :  f?  jumpdown_130 
  t#  death_generic <  ?>  stand_run_loop :  f?  jumpdown_96 
  t#  death_generic <  ?>  stand_run_loop :  ^?  double_jump_temp 
  t#  death_generic <  ?>  stand_run_loop :  `?  traverse_external 
  t#  death_moving Cover Right :  ?>  :  ??  cover_right_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_right_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_moving Exposed :  ?>  :  ??  exposed_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_moving ;  ?>  ;  ??  exposed_exit 
  t#  x  ?? regen_start 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  
  P)  melee_attack 
  u#  code_move 
  ?h  stand_run_loop 
  u#  code_move face motion death_moving pain_run stand (none) run <  ?>  <  ??  stand_run_loop 
  t#  x  ?? regen_start 
  u#  
  S)  melee_attack 
  u#  
  S)  melee_charge_to_ready 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  run_turn ;  ??  run_turn 
  u#  Cover Right :  ?  cover_right_arrival 
  u#  Cover Left :  ?  cover_left_arrival 
  u#  Exposed :  ?  exposed_arrival 
  u#  Cover Stand :  ?  cover_stand_arrival 
  u#  Cover Crouch :  ?  cover_crouch_arrival 
  u#  Cover Left Crouch :  ?  cover_left_crouch_arrival 
  u#  Cover Right Crouch :  ?  cover_right_crouch_arrival 
  u#  Exposed Crouch :  ?  exposed_crouch_arrival 
  u#  sprint_loop 
  u#  exposed_idle 
  u#  stand <  ?  start_stand_run_strafe 
  u#  6  p  stand_run_n_gun_loop 
  u#  6  o  stand_run_n_gun_backwards_loop 
  u#  crouch <  ?  crouch_run_strafe_loop 
  u#  death_moving pain_run ;  ?>  ;  ?  run_turn 
  t#  x  ?? teleport_to_loner 
  u#  x  ?? duplicating_attack 
  u#  x  ?? regen_start 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  code_move 
  ?h  stand_run_loop 
  u#  death_moving Cover Left :  ?>  :  ??  cover_left_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_left_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_crouch_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_moving Cover Crouch :  ?>  :  ??  cover_crouch_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_stand_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_moving Cover Stand :  ?>  :  ??  cover_stand_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_generic pain_stand shoot_grey stand aim <  ?>  ;  ??  stand_run_strafe_loop 
  t#  
  S)  melee_attack 
  u#  U  h& stop_stand_run_strafe 
  u#  stand <  ??  stand_run_loop 
  u#  
  P)  stand_run_loop 
  u#  x  ?? teleport_to_loner 
  u#  x  ?? teleport_attack 
  u#  x  ?? teleport_summon 
  u#  x  ?? teleport_dash 
  u#  death_moving pain_run shoot_grey <  ?>  6  ? 6  ?  stand_run_n_gun_loop 
  t#  6  o  stand_run_n_gun_backwards_loop 
  u#  run_turn ;  ??  run_turn 
  u#  exposed_reload 
  u#  6  ?  stand_run_loop 
  u#  death_generic pain_run shoot_grey move_back <  ?>  6  ? 6  ?  stand_run_n_gun_backwards_loop 
  t#  6  p  stand_run_n_gun_loop 
  u#  run_turn ;  ??  run_turn 
  u#  6  ?  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_left_crouch_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_right_crouch_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  death_generic Cover Left Crouch :  ?>  :  ??  cover_left_crouch_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_generic Cover Right Crouch :  ?>  :  ??  cover_right_crouch_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_moving Exposed Crouch :  ?>  :  ??  exposed_crouch_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  end 
  ?h  exposed_crouch 
  u#  death_generic ;  ?>  ;  ??  exposed_crouch_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  code_move face motion death_generic pain_run 6  ?>  <  ??  sprint_loop 
  t#  
  S)  melee_attack 
  u#  stand_run_loop 
  u#  death_generic pain_stand shoot_grey stand aim <  ?>  ;  ??  crouch_run_strafe_loop 
  t#  crouch <  ??  stand_run_loop 
  u#  
  P)  stand_run_loop 
  u#  death_generic <  ?>  <  ??  start_stand_run_strafe 
  t#  
  S)  melee_attack 
  u#  end 
  ?h  stand_run_strafe_loop 
  u#  code_move face motion death_generic pain_stand <  ?>  <  ??  move_walk_loop 
  t#  noncombat_stand_idle 
  u#  death_generic <  ?>  <  ??  should_regen 
  t#  x  ?? regen_start 
  u#  U  h& exposed_idle 
  u#  anim deltas face current death_generic <  ?>  x  p? x  r? regen 
  t#  regen_stop 
  u#  anim deltas face current death_generic <  ?>  x  v? shockwave 
  t#  shock_wave_damage 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic <  ?>  x  z? teleport_to_loner 
  t#  noncombat_stand_idle 
  u#  anim deltas face current death_generic <  ?>  x  q? duplicating_attack 
  t#  noncombat_stand_idle 
  u#  anim deltas face current death_generic <  ?>  <  ??  being_cloned 
  t#  noncombat_stand_idle 
  u#  death_generic <  ?>  <  ??  regen_start 
  t#  early_end 
  ?h  end_regen_start 
  u#  death_generic <  ?>  <  ??  regen_stop 
  t#  x  ?? regen_pain_in 
  u#  U  h& regen_to_stand 
  u#  death_generic <  ?>  <  ??  regen_to_stand 
  t#  end 
  ?h  exposed_idle 
  u#  death_generic <  ?>  x  u? regen_summon 
  t#  early_end 
  ?h  regen 
  u#  death_generic <  ?>  x  ??  x  ??  intro_vignette 
  t#  x  ?  noncombat_stand_idle 
  u#  death_generic <  ?>  U  X+  stop_stand_run_strafe 
  t#  x  ?? regen_summon 
  u#  x  ?? duplicating_attack 
  u#  exposed_idle 
  u#  exposed_reload 
  u#  face enemy death_generic <  ?>  x  w? teleport_attack 
  t#  noncombat_stand_idle 
  u#  death_generic <  ?>  <  ??  end_regen_start 
  t#  x  ?? regen_summon 
  u#  U  h& regen 
  u#  death_generic <  ?>  x  s? regen_pain_in 
  t#  end 
  ?h  regen_pain_loop 
  u#  death_generic <  ?>  x  t? regen_pain_loop 
  t#  early_end 
  ?h  shockwave 
  u#  death_generic <  ?>  x  ??  x  ??  intro_spawn 
  t#  x  ?  noncombat_stand_idle 
  u#  face enemy death_generic <  ?>  x  y? teleport_summon 
  t#  noncombat_stand_idle 
  u#  face enemy death_generic <  ?>  x  x? teleport_dash 
  t#  noncombat_stand_idle 
  u#  
  '#     ?" 
  U)     ?" 
  A)     ?" 
  A)     ?    ?    K! x  ?     ?  
  Y)     X! x  ?     p! sprint 
  V)     j! 
  ?)  ,   c! 
  U)  combat <  ?8 0   d! <  ?8    m! 
  A)     g! 
  Y)     W! 
  Y)     ?% sprint 
  V)     `% 
  U)     ?% 
  Y)     % sprint 
  V)     ?" 
  U)     $ x  ??    ?% x  ??    ?  x  ??    ? x  ??    ?% 
  U)     ?% 
  Y)     ?% x  ??    ?% x  ??    ?% x  ?? 