7   0�  player equip_seeker_attack_player seekerMeleeGrab  equip_seeker_attack_win_player seekerMeleeGrab_win  equip_seeker_attack_lose_player seekerMeleeGrab_lose   '�  meleegrab_start �   K�  front right left back    �>  jump_ 
  X#     �>  loop_ 
  X#  9   r�  B
  �= on_screen 	   6�  _   21 w2 w1 w0 5 4 3 2 0 1 omr slt �  ��  _finished begin melee_attack 
  /#  B  ˵  UN SD _ _reaction_seeker_attack _victim 
  |#  ent_ _seeker_repulsor zonly_physics tag_sync 
  9#  B
  'Q  d  ��  
  #  
  9#  on_screen B
  �7 seeker_expl_beep ent_ _seeker_repulsor &  �  r   ��  ent_ _seeker_repulsor Y   H�  default_seeker �  ��  =  �  begin melee_attack 
  /#  
  d#  �   S�  =  � jumped_on_player seeker_expl_beep meleeAnim seekerMeleeGrab seekerMeleeGrab   �     scripts/anim/shared +Y  �   B�  +usereload bash_pressed +activate bash_pressed death B
  �7 j_body F  �H  F  ��  p   ?�  meleegrab_interupt bash_pressed B
  �7 timeout <   F�  meleegrab_interupt damage_light Z   C�  script_model j_hip_le  F  �H  meleegrab_interupt F  ��    A�  meleegrab_interupt SCRIPT_PLATFORM_HINT_MELEE_TAP center middle center middle death �   R�  tag_player seeker =  ��  tag_sync =  Q  =  Q  =  Q  =  ��  tag_player �   Q�  C   E�  disable_weapons unlink �   D�  death bt_stop_meleegrab meleegrab_interupt =  �P  =  Q  =  ��      @�  �   I�  seekerMeleeGrab_win =  �P  =  Q  meleeCounter meleeCounter   � meleeCounter     scripts/anim/shared +Y  
  6#  
  9#  seeker_expl_beep   � 
  A#  
  #  M   >�  &  �         post_meleeexplode \   �  death j_body ?
  VI  j_body ?
  ��  hittype hittype_none position R   G�  =  �F  seekerMeleeGrab_lose &  �  �   ��  _finished zonly_physics face angle B  ˵  d  ׵  
  9#  
  i#  pain     scripts/anim/face ��  d  ��  
  #  
  9#  d  ��  
  #  `   m�  