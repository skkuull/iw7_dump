Z  �  
  �)  
  0)  end throwgrenade 
  /#  
  ��  max time min time min energy end throwgrenade 
  /#  �   �>  exposed_grenade 
  V#  grenade_throw �   �>  exposed_seeker_throw 
  V#  grenade_throw B   ��  _finished end 
  0#  &   ��     ��  ^  �A  #   ��  end throwgrenade 
  /#  "   ��  antigrav emp c8_grenade �  ��  
  +�  soldier 
  6#  killanimscript _finished start throwSeeker 
  /#  
  9#      scripts/anim/battlechatter_ai �g  
  i#  
  #  seeker_grenade_folded attach_seeker tag_accessory_left tag_accessory_left grenade_throw grenade throw tag_accessory_left grenade_fire end dont_reduce_giptp_on_killanimscript dont_reduce_giptp_on_killanimscript stop grenade check tag_accessory_left axis enemy_grenade_fire end done_grenade_throw weapon_switch_done end throwSeeker 
  /#     �  exposed_seeker_throw seeker equip_seeker_throw01 �   �W  script_model B
  yQ  death seeker_grenade_wm  thrown z  �( max time min time min energy min energy min time fraggrenade �   �~  soldier U   m~     1     7�  dont_reduce_giptp_on_killanimscript _finished �  �X  killanimscript _finished start throwgrenade 
  /#  
   )  Exposed Path face direction 
  9#      scripts/anim/battlechatter_ai �g  
  i#  
  #      scripts/anim/utility_common �~  none grenade_left grenade_right tag_accessory_right grenade_throw grenade throw c6 c6_grenade_launch end dont_reduce_giptp_on_killanimscript dont_reduce_giptp_on_killanimscript double_grenade stop grenade check none axis enemy_grenade_fire end done_grenade_throw weapon_switch_done T    
  �)  grenade_throw 
  +#  grenade throw 
  +#  grenade_right 
  +#  grenade_left 
  +#     �k     �$     A8 _finished killanimscript @   �S  stop grenade check     �: death   �: watchGrenadeTowardsPlayerTimeout flash_grenade q   ȅ  double_grenade g   ,�  "   �~  killanimscript _finished grenade_fire    �: watchGrenadeTowardsPlayerTimeout 4   �~  >   q�  