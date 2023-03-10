C  q#  c6_mp 
  .#  @  q#  c6_start c6_mp 
  #  anim deltas face current death_generic pain_stand shoot_mp <  ?>  <  ??  enter_combat 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand noncombat_stand_idle <  ?>  <  P?  noncombat_stand_idle 
  t#  exposed_exit 
  u#  walk 
  ??  move_walk_loop 
  u#  exposed_idle 
  u#  8  ??  exit 
  u#  8  ??  introloop 
  u#  enter_combat 
  u#  anim deltas face current death_generic <  ?>  8  ?3  c6_start 
  t#  8  ??  introloop 
  u#  noncombat_stand_idle 
  u#  death_generic <  ?>  exposed_aimset 
  t#  death_generic <  ?>  strafe_aimset 
  t#  anim deltas face enemy death_generic <  ?>  <  ??  melee_charge_to_ready 
  t#  end 
  ?h  melee_attack 
  u#  dismember 
  u#  anim deltas face enemy melee_attack death_generic <  ?>  5  ??  melee_attack 
  t#  end 
  ?h  exposed_idle 
  u#  dismember 
  u#  anim deltas face enemy death_generic <  ?>  <  ??  melee_stand_to_ready 
  t#  end 
  ?h  melee_attack 
  u#  dismember 
  u#  anim deltas face enemy death_generic <  ?>  <  P?  melee_charge 
  t#  
  S)  melee_charge_to_ready 
  u#  
  O)  exposed_idle 
  u#  dismember 
  u#  <  ?>  4  ?  death_generic 
  t#  4   ?  4  ?  death_standing 
  t#  4  ?>  4  ?  death_crouching 
  t#  4  ?>  4  ?  death_moving 
  t#  4  ?>  4  ?  death_cover 
  t#  anim deltas face current death_generic 7  ?>  7  	A  7  ??  pain_stand 
  t#  dismember 
  u#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_moving 7  ?>  7  	A  7  ??  pain_run 
  t#  dismember 
  u#  end 
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
  t#  anim deltas face current reload death_generic U  ?>  8  `  exposed_reload 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current throwgrenade death_generic pain_stand 9  ?>  9  ??  exposed_throw_grenade 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand U  ?>  8  ??  exposed_weaponswitch 
  t#  end 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic 8  
?  8  ? 8  j?  exposed_stand_turn 
  t#  end 
  ?h  exposed_idle 
  u#  finish early 
  ?h  exposed_idle 
  u#  anim deltas face current death_generic pain_stand shoot_mp aim _aim_5 <  ?>  8  m?  exposed_idle 
  t#  exposed_throw_grenade 
  u#  8  ?  exposed_weaponswitch 
  u#  8  ??  exposed_stand_turn 
  u#  
  S)  melee_stand_to_ready 
  u#  exposed_crouch_exit 
  u#  exposed_crouch_exit 
  u#  8  ?  noncombat_stand_idle 
  u#  
  P)  melee_charge 
  u#  combat 
  ??  exposed_exit 
  u#  exposed_reload 
  u#  crouch 
  I)  exposed_stand_to_crouch 
  u#  prone 
  I)  exposed_stand_to_prone 
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
  u#  anim deltas face current death_crouching pain_crouch shoot_mp crouch aim _aim_5 <  ?>  8  m?  exposed_crouch 
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
  u#  anim deltas face current death_generic 8  
?  8  j?  exposed_crouch_turn 
  t#  end 
  ?h  exposed_crouch 
  u#  finish early 
  ?h  exposed_crouch 
  u#  anim deltas face current reload death_generic U  ?>  8  `  exposed_reload_crouch 
  t#  end 
  ?h  exposed_crouch 
  u#  death_generic <  ?>  stand_run_loop :  f?  step_up_24 
  t#  death_generic <  ?>  stand_run_loop :  f?  iw6_jumpdown_40 
  t#  death_generic <  ?>  stand_run_loop :  f?  step_down_24 
  t#  death_generic <  ?>  stand_run_loop <  ??  combatrun_forward_72 
  t#  death_generic <  ?>  stand_run_loop :  ]?  wall_hop 
  t#  death_generic <  ?>  stand_run_loop :  f?  jumpdown_130 
  t#  death_generic <  ?>  stand_run_loop :  f?  jumpdown_96 
  t#  death_generic <  ?>  stand_run_loop :  ^?  double_jump_temp 
  t#  death_generic <  ?>  stand_run_loop :  `?  traverse_external 
  t#  death_generic <  ?>  stand_run_loop :      playtraverseanim_gravity jump_down_fast 
  t#  death_generic <  ?>  stand_run_loop :  f?  wall_over_40 
  t#  face current death_generic <  ?>  U  X+  dismember 
  t#  dismember_stand_choose_prone 
  u#  dismember_stand_choose_sit 
  u#  face current death_crouching <  ?>  <  ??  dismember_stand_l_leg_to_prone 
  t#  end 
  ?h  dismember_prone_idle 
  u#  face current death_crouching <  ?>  <  ??  dismember_stand_r_leg_to_prone 
  t#  end 
  ?h  dismember_prone_idle 
  u#  code_move face motion death_crouching shoot_mp <  ?>  <  ??  dismember_prone_crawl 
  t#  dismember_prone_idle 
  u#  dismember_fast_crawl 
  u#  face enemy death_crouching shoot_mp <  ?>  <  ??  dismember_prone_idle 
  t#  dismember_prone_crawl 
  u#  face enemy death_crouching shoot_mp <  ?>  <  ??  dismember_prone_sit_idle 
  t#  dismember_prone_sit_to_prone 
  u#  face current death_crouching <  ?>  <  ??  dismember_stand_l_leg_to_sit 
  t#  end 
  ?h  dismember_prone_sit_idle 
  u#  face current death_crouching <  ?>  <  ??  dismember_stand_r_leg_to_sit 
  t#  end 
  ?h  dismember_prone_sit_idle 
  u#  face current death_generic <  ?>  U  X+  dismember_stand_choose_prone 
  t#  right_leg 
  E)  dismember_stand_r_leg_to_prone 
  u#  dismember_stand_l_leg_to_prone 
  u#  face current death_generic <  ?>  U  X+  dismember_stand_choose_sit 
  t#  right_leg 
  E)  dismember_stand_r_leg_to_sit 
  u#  dismember_stand_l_leg_to_sit 
  u#  face current death_crouching <  ?>  <  ??  dismember_prone_sit_to_prone 
  t#  end 
  ?h  dismember_prone_crawl 
  u#  death_crouching <  ?>  6  w?  dismember_fast_crawl 
  t#  dismember_prone_idle 
  u#  death_moving Cover Right :  ?>  :  ??  cover_right_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  death_moving ;  ?>  ;  ??  cover_right_exit 
  t#  code_move 
  ?h  stand_run_loop 
  u#  anim deltas face current death_moving Exposed :  ?>  :  ??  exposed_arrival 
  t#  abort 
  ?h  stand_run_loop 
  u#  end 
  ?h  exposed_idle 
  u#  dismember 
  u#  anim deltas face current death_moving ;  ?>  ;  ??  exposed_exit 
  t#  
  P)  melee_charge 
  u#  dismember 
  u#  code_move 
  ?h  stand_run_loop 
  u#  code_move face motion death_moving pain_run stand (none) run <  ?>  <  ??  stand_run_loop 
  t#  run_turn ;  ??  run_turn 
  u#  Cover Right :  ?  cover_right_arrival 
  u#  Cover Left :  ?  cover_left_arrival 
  u#  Exposed :  ?  exposed_arrival 
  u#  Cover Stand :  ?  cover_stand_arrival 
  u#  Cover Crouch :  ?  cover_crouch_arrival 
  u#  Cover Left Crouch :  ?  cover_left_crouch_arrival 
  u#  Cover Right Crouch :  ?  cover_right_crouch_arrival 
  u#  Exposed Crouch :  ?  exposed_crouch_arrival 
  u#  sprint_loop 
  u#  
  P)  melee_charge 
  u#  
  S)  melee_charge_to_ready 
  u#  dismember 
  u#  exposed_idle 
  u#  stand <  ?  stand_run_strafe_loop 
  u#  6  p  stand_run_n_gun_loop 
  u#  6  o  stand_run_n_gun_backwards_loop 
  u#  crouch <  ?  crouch_run_strafe_loop 
  u#  death_moving pain_run ;  ?>  ;  ?  run_turn 
  t#  code_move 
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
  u#  code_move face enemy death_generic pain_stand shoot_mp stand aim <  ?>  ;  ??  stand_run_strafe_loop 
  t#  exposed_idle 
  u#  exposed_idle 
  u#  stand <  ??  stand_run_loop 
  u#  
  P)  stand_run_loop 
  u#  code_move face motion death_moving pain_run shoot_mp <  ?>  6  ? 6  ?  stand_run_n_gun_loop 
  t#  6  o  stand_run_n_gun_backwards_loop 
  u#  run_turn ;  ??  run_turn 
  u#  exposed_reload 
  u#  6  ?  stand_run_loop 
  u#  code_move face enemy death_generic pain_run shoot_mp move_back <  ?>  6  ? 6  ?  stand_run_n_gun_backwards_loop 
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
  t#  stand_run_loop 
  u#  dismember 
  u#  code_move face enemy death_generic pain_stand shoot_mp stand aim <  ?>  ;  ??  crouch_run_strafe_loop 
  t#  crouch <  ??  stand_run_loop 
  u#  
  P)  stand_run_loop 
  u#  code_move face motion death_generic pain_stand <  ?>  <  ??  move_walk_loop 
  t#  noncombat_stand_idle 
  u#  death_generic <  ?>  8  ? 8  ??  intro 
  t#  end 
  ?h  noncombat_stand_idle 
  u#  death_generic <  ?>  8  ??  exit 
  t#  death_generic <  ?>  8  ??  introloop 
  t#  introdone 
  ?h  intro 
  u#  
  '#     ?" 
  U)     ?" 
  A)     ?" 
  A)     ?    e" 
  B)     `" 
  B)     ?" 
  B)     c" 
  B)  $   ?# 
  B)  stand $   ?# 
  B)  stand    %! 
  ?)  ,   ?  
  U)  combat <  ?8 0   ?  <  ?8    ! 
  Y)     ?  
  Y)     ?  B
  GC     ?     ?  
  U)     ?  3  !)     ?  
  U)     ?  
  U)     ?     ?     ?  
  U)     ?  
  B)     ?  
  B)     |% sprint 
  V)     U% 
  B)     ]% 
  U)     ?% 
  U)     ?% 
  Y)     ?% 
  Y)     % sprint 
  V)     ?$ 
  B)     ?" 
  U)  