?   wy  B
  ? B
  ? B
  ? soldier  allies "  ĕ  emp anti_grav_border_wm debug_emp emp_force_delete B
  9n  emp_dof_enabled B
  9n  vfx/core/equipment/emp_grenade/vfx_iw7_equip_emp_gren_mini_exp.vfx c12_impact vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_inplayerface.vfx player_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_pointbeam.vfx emp_energy_strand_ptp vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c12_peeloff.vfx c12_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c12_kill.vfx c12_death vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_peeloff.vfx c8_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c12_kill.vfx c8_death vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_peeloff.vfx seeker_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_kill.vfx seeker_death vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_peeloff.vfx c6_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_kill.vfx c6_death vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_peeloff.vfx c6i_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_c6_kill.vfx c6i_death vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_human.vfx soldier_shock vfx/iw7/core/equipment/emp/vfx_equip_emp_gren_hit_human_kill.vfx soldier_death vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_thegreatzapper.vfx vfx_equip_emp_a2_thegreatzapper vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_satellite.vfx vfx_equip_emp_a2_satellite vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_hitbyzapper.vfx vfx_equip_emp_a2_hitbyzapper vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_groundcov.vfx vfx_equip_emp_a2_groundcov vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_dud.vfx vfx_equip_emp_a2_dud vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_centerblast.vfx vfx_equip_emp_a2_centerblast vfx/iw7/core/equipment/emp/vfx_equip_emp_a2_centerblast_cheap.vfx vfx_equip_emp_a2_centerblast_cheap :   ?a  primary_equipment_change grenade_pullback emp_light_on emp offhand_end emp_light_off emp ?   3a  B
  ? emp_force_delete B
  Yn  emp_force_delete B
  Yn  ?  [a  emp     scripts/anim/battlechatter_ai ?g  entitydeleted death missile_stuck explode B
  47 emp_force_delete B
  Yn  emp_force_delete B
  Yn  d  ??  emp_force_delete B
  %n  B
  ?6 B
  ?"  sounddone B
  ?"  B
  ?"  B
  ?"  F    ?  k   ??  tag_origin antigrav_caltrop_trail B
  ?"  ?   ??  removing_all_emps_instantly removing_all_emps_instantly emp_force_delete B
  >n  B
  ?6 emp_force_delete B
  *n  stop soundemp_nade_plr_lp ?   ;a  vfx_equip_emp_a2_centerblast_cheap vfx_equip_emp_a2_centerblast B
  ? in_vr_mode B
  4n  in_vr_mode B
  %n  !  Ba    6a  D   2a  emp   ? trigger_radius   Ns    Ms  B
  'Q  trigger   ]8  debug_emp ^1 EMP can't trace to player   \8  D  ?W  civilian allies debug_emp ^5 was EMPd within the last 15 secs - aborting allies emp MOD_GRENADE_SPLASH 
  8)  pain ?      isactorwallrunning soldier shocked 
  |#  c12 c8  ?   ?6  seeker soldier c6i c12 c8 c6 M  ??  M  ?j  /  rW  death emp MOD_GRENADE_SPLASH j_spineupper j_spinelower j_knee_le j_ankle_ri j_elbow_le j_wrist_ri j_neck j_head c12 c8 ?   %=  emp_shock_short generic_death_falling_scream j_spine4 soldier_shock emp_electrocute_lp B
  ?  death ?  ?7 ?  ?  ?   ?  ?  ?  ?W  stop sound emp_nade_lp_end stop_looped_vfx pain     scripts/anim/face ??  j   &=  death death B
  k?  emp_energy_strand_ptp A   ??  death     forceempfriendlyfail m   ??  allies B
  ? M  ??  M  ?j  ?   ?6  seeker soldier c6i c12 c8 c6 M  ??  M  ?j  =   <a  death emp_force_delete B
  Yn  B
  ?"    D?  death player_retract_shield_active ?  ?e  B
  ?= debug_emp ?  ?T  M  ??  M  ?j  in_vr_mode B
  4n  in_vr_mode B
  4n  in_vr_mode B
  %n  gravity_explode_default c12_impact ?  ?T  B
  'Q  emp MOD_GRENADE_SPLASH M  ?j  debug_emp ^5Player Dist: ^3 ^5 Struntime: ^3 emp_force_delete B
  Yn  emp_force_delete B
  Yn  emp_plr_strain ?  /?  ?  ??  in_vr_mode B
  4n  in_vr_mode B
  %n  player_shock player_shock ?  ??  B
  GC  ges_shocknade_loop ges_shocknade_loop2 I  ??  damage_heavy 
  ?X  emp_dof_enabled B
  >n  B
  'Q  emp_nade_plr_lp B
  ?  ?  I  ?  ??  stop soundemp_nade_plr_lp emp_nade_plr_lp_end emp_nade_plr_lp_end damage_heavy done_shocked ?  I  G   ??  
  =X  emp_dof_enabled B
  *n  emp_dof_enabled B
  %n  
  =X  emp_dof_enabled B
  *n  N   E?  done_shocked emp_plr_strain ?  /?  ?   ??  death done_shocked i   S4  death pain_shock 
  |#  emp_force_delete B
  Yn  ?   L5  death c12_selfdestruct_beep B
  +?  B
  'Q  right left pain_emp_ 
  |#  emp_force_delete B
  Yn  c12_selfdestruct_beep B   ??  stop_messing_with_shooting stop_messing_with_shooting ?  -?  2   _3  death done_shocked ?  ?R  none head B
  k?  B
  k?  ~   	 debug_emp emp_shock_short emp_energy_strand_ptp ?   ra  emp_grenade_explode_default emp_nade_lp B
  ??  death emp_nade_lp emp_force_delete B
  Yn  emp_nade_lp_end B
  ?"  ?   V?  c8 B
  ? c12    @a  death soldier  generic_death_falling_scream gravity_explode_default j_spine4 _death c6 emp MOD_GRENADE_SPLASH emp MOD_GRENADE_SPLASH ?   Ra  death B
  ?"  head o   ?  soldier c12 c8 c6  ?   Ta  death emp_finished emp_electrocute_lp B
  ?  stop sound ?  -?  emp_finished ?  -?  emp_nade_lp_end ?  /?  B
  'Q  ?  ?|  tag_torso c8_death B
  ?"  c8_shock ?   Ua  death emp_finished emp_electrocute_lp B
  ?  stop sound ?  -?  emp_finished ?  -?  emp_nade_lp_end ?  /?  B
  'Q  ?  ?|  B
  ?"  tag_torso c12_death c12_shock ?   Va  j_spine4 soldier_shock emp_electrocute_lp B
  ?  death ?  ?7 ?  ?  ?   ?  ?  ?  ?W  stop sound emp_nade_lp_end stop_looped_vfx pain     scripts/anim/face ??  ?   Wa  death stop_looped_vfx generic_death_falling_scream ?  ?|  B
  ?"  soldier_shock generic_death_falling_scream ?   m?  death stop_looped_vfx in_vr_mode B
  4n  in_vr_mode B
  %n  B
  ?"  ?   ?6  ?  ? B
  ?n  B
  ?n  B
  ]  B
  ]  B
  ]  B
  ]  in_vr_mode B
  4n  in_vr_mode B
  %n  vfx_equip_emp_a2_groundcov vfx_equip_emp_a2_groundcov A   ?a  ?
  }I  ?
  ??  x   ?a  ?
  }I  ?
  ??  fraction fraction B
  ]  C  ? script_model anti_grav_border_wm script_model in_vr_mode B
  4n  in_vr_mode B
  %n  vfx_equip_emp_a2_satellite vfx_equip_emp_a2_satellite ?   ?a  in_vr_mode B
  4n  in_vr_mode B
  %n  vfx_equip_emp_a2_dud vfx_equip_emp_a2_dud ?  ?a  death    ?y     ??  \   ??  emp_force_delete B
  Yn  "   *Q  ?   +Q  death stop_delay_thread emp_force_delete B
  Yn  ~   -?  script_origin sounddone emp_force_delete sounddone B
  *7 