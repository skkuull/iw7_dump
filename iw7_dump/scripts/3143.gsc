?  5  death begin_rodeo left right left right arm_pitch aimset_right 
  V#  arm_rail aimset_right 
  V#  arm_pitch aimset_left 
  V#  arm_rail aimset_left 
  V#  aim_knob aimset_minigun 
  V#  B
  ?P  j_spineupper B
  @  B
  `  B
  X  B
  q      inrodeo right ?  t}  B
  ?"  tag_player =  Q    5  rodeo_left left rodeo_right jump_ 
  V#  RodeoJump RodeoJump rodeo 
  #  mount 
  V#  miss 
  V#  right hit 
  V#  RodeoHit RodeoHit rodeo 
  #  left struggle 
  V#  RodeoStruggle struggle_succeeded =  ?P  success 
  V#  RodeoDismount left fire rodeo_right 
  V#  RodeoDismount rodeo 
  #  fail 
  V#  knockoff B
  %{  RodeoKnockOff RodeoKnockOff rodeo 
  #    5      inrodeo end_rodeo (   E?  death ;   6  aimset_ arm_rail 
  V#  arm_pitch 
  V#  W  ?5  death hit_start B
  %{  hit_end B
  %{  RodeoHitPlayer RodeoHitPlayer rodeo 
  #  light_1s Can HIT NOW  Cannot HIT ?  ?5  death struggle rodeo_right 
  V#  B
  ? tag_origin HINT_BUTTON steady_rumble cg_fov B
  ?6 mash_end stop_temperature_sfx B
  ?6 j_neck vfx_c12_joint_selfdestruct_head_buildup rodeofinal head j_neck c12_rodeo_head_explo ?  1?  
  ?)  j_neck j_neck steady_rumble heavy_1s     brodeostrugglesucceeded struggle_succeeded F   ?5  mash_end death B
  ?6   ?5  death j_weaponshoulder_le ?  ??     a?  death vfx_c12_knife_sparks ?   ? ui_helmet_meter_temperature ui_show_temperature_gauge scn_c12_rodeo_plr_on_fire ui_helmet_meter_temperature ui_show_temperature_gauge ui_helmet_meter_temperature p   ?5  script_origin ui_c12_rodeo_temperature_warning_lp_start death stop_temperature_sfx B
  *7 ui_c12_rodeo_temperature_warning_lp ui_c12_rodeo_temperature_warning_lp_end (       c12_rodeo_temperature_sfx_lp stop_temperature_sfx death ui_c12_rodeo_temperature_warning_lp   sm  death weap_c12_minigun_spinup weap_c12_minigun_fire tag_weapon_rotate_le fire rodeo_right 
  V#  struggle rodeo_right 
  V#  impfx vfx_imp_cstm_rodeo_a vfx_imp_cstm_rodeo_b vfx_imp_cstm_rodeo_c vfx_imp_cstm_rodeo_d vfx_imp_cstm_rodeo_e vfx_imp_cstm_rodeo_final headseq titan_c12_rodeo_bullet_hits_lp     brodeostrugglesucceeded     brodeostrugglesucceeded rodeo head ?
  ??  entity entity j_helmet light_1s j_head ?  ??  B
   tag_brass_le .   ?-    ?     ??  T   3?  death death ?   	J  j_missile_backcover_ri left tag_brass_le B
  ? +melee HINT_BUTTON SCRIPT_C12_RODEO_MELEE h   6  script_model player currentViewModel  titan_c12_rodeo_gun_player_struggle /  ??   --- PlayerRig_Jump rodeoJump right  titan_c12_rodeo_player_jump_front  titan_c12_rodeo_player_jump_left  titan_c12_rodeo_player_jump_rear  titan_c12_rodeo_player_jump_right rear front left right  titan_c12_rodeo_gun_player_jump_front  titan_c12_rodeo_gun_player_jump_left  titan_c12_rodeo_gun_player_jump_rear  titan_c12_rodeo_gun_player_jump_right rear front left right double_jump_boost_plr doublejumpboost_start j_spineupper j_spineupper     scripts/anim/shared +Y  \   ??   --- PlayerRig_Mount rodeoMount  titan_c12_rodeo_player_mount left  titan_c12_rodeo_gun_player_mount j_spineupper j_spineupper     scripts/anim/shared +Y  \   ??   --- PlayerRig_Hit rodeoHit  titan_c12_rodeo_player_hit left  titan_c12_rodeo_gun_player_hit j_spineupper j_spineupper     scripts/anim/shared +Y  c   ??   --- PlayerRig_HitQuickMiss rodeoQuickMiss right  titan_c12_rodeo_player_miss_quick j_spineupper j_spineupper  titan_c12_rodeo_gun_player_miss_quick     scripts/anim/shared +Y  c   ??   --- PlayerRig_Idle rodeoIdle right  titan_c12_rodeo_player_idle j_spineupper j_spineupper  titan_c12_rodeo_gun_player_idle     scripts/anim/shared +Y  A   ?   --- PlayerRig_Struggle rodeoStruggle j_spineupper j_spineupper     scripts/anim/shared +Y  e   ??   --- PlayerRig_Dismount rodeoDismount  titan_c12_rodeo_player_dismount left  titan_c12_rodeo_gun_player_dismount j_spineupper j_spineupper     scripts/anim/shared +Y  g   ??   --- PlayerRig_KnockOff rodeoKnockOff  titan_c12_rodeo_player_miss_knockoff left  titan_c12_rodeo_gun_player_miss_knockoff j_spineupper j_spineupper     scripts/anim/shared +Y     ?5    ??    ?    ??  right tag_knife_attach2 tag_accessory_left asm_c12_rodeo_rocket asm_c12_rodeo_rocket asm_c12_viewmodel_knife left j_weaponshoulder_le vfx_c12_knife_sparks tag_brass_le titan_c12_rodeo_fire_loop ?  ??  tag_knife_fx tag_knife_fx vfx_c12_knife_oneshot asm_c12_viewmodel_knife tag_knife_attach2 jump_off tag_player light_1s weapons_free jump_off rocket_pop fire_minigun knife_hit detach_rocket attach_rocket rumble detach_knife attach_knife   ??      playerwillunlink jump_off ?
  ?  B
  @  B
  `  left c12AchievementRodeoLeft 
  46  w  ??  B
  q  B
  X  right can_damage_rocket =  ?P  specialty_quickdraw B  ??  perk_quickDrawSpeedScaleSP perk_quickDrawSpeedScaleSniperSP bg_quickWeaponSwitchSpeedScaleSP perk_quickDrawSpeedScaleSP perk_quickDrawSpeedScaleSniperSP bg_quickWeaponSwitchSpeedScaleSP perk_quickDrawSpeedScaleSP perk_quickDrawSpeedScaleSniperSP bg_quickWeaponSwitchSpeedScaleSP specialty_quickdraw B  P?     _D  \   m}  sniper mg spread pistol smg rifle rocketlauncher  f   q}  sniper mg spread pistol smg rifle rocketlauncher  ?  P?  death tag_knife_attach2 tag_knife_attach2 script_model asm_c12_rodeo_rocket j_neck can_damage_rocket ?  ??  damage j_spineupper scn_C12_rodeo_exp c12_implode_pre_explosion vox_c12_death vox_c12_death right_leg left_leg implode F  95  j_spinelowerbottom heavy_1s c12AchievementRodeoRight 
  46  c12_self_destruct B
  +?  h   	 script_model asm_c12_rodeo_rocket_nocoll j_weaponshoulder_ri   ??      playerwillunlink heavy_1s =  ?P  right tag_brass_ri tag_missile_bottom_back_le B
  q  B
  X  B
  @  B
  `     ??  ?   ?  end_rodeo death     playerwillunlink =  ?P  B
  @  B
  `  B
  X  B
  q      inrodeo 