?   ?I  type fxid angles origin    ?     "?     ?~            ?   ?I  soundfx type No FX fxid nil soundalias angles origin server_culled serverCulledSounds 1 server_culled A   ?I  soundfx_interval type delay_min delay_max )   ?I  ?  ?I  exploder type normal exploder_type fxid No FX fxid soundalias nil soundalias loopsound nil loopsound angles angles origin origin exploder exploder flag nil flag delay delay delay    ?I  B
  ?I  exploder ?   J  origin reactive_radius fxid No FX fxid reactive_fx type nil soundalias 4   ??  origin angles 6   ??  angles up angles forward ?   ?I  black script_origin vfx/core/expl/grenadeexp_default frag_grenade_explode axis_guide_createfx_rot axis_guide_createfx createfx_saving B
  9n  createfx_started B
  9n  createfx_common_done ?   ^?  g_speed s   m?  escape BUTTON_LSHLDR BUTTON_RSHLDR mouse1 ctrl 4  ?  selected loopfx highlighted loopfx default loopfx selected oneshotfx highlighted oneshotfx default oneshotfx selected exploder highlighted exploder default exploder selected rainfx highlighted rainfx default rainfx selected soundfx highlighted soundfx default soundfx selected soundfx_interval highlighted soundfx_interval default soundfx_interval selected reactive_fx highlighted reactive_fx default reactive_fx   ?I  createfx_map  createfx_map B
  ?|  3
  {?  ui_hide_hud  createfx_filter 0 createfx_vfxonly createfx_use_f4  createfx_no_autosave  createfx_started B
  >n  none 3
  ??  BUTTON_LSHLDR ctrl shift BUTTON_A mouse1 BUTTON_A mouse1 3
  ?H  F5 createfx_use_f4 F4 scr_createfx_dump F2 z ins del escape space u g exploder flag g F1 h BUTTON_LSTICK BUTTON_RSTICK c v g 3
  k?  origin none 3
  ??  +  3?  ctrl . , ?   M?  right left    ? ?   ?  creation 3
  ??  Pick effect type to create: 1. One Shot FX 2. Looping FX 3. Looping sound 4. Exploder 5. One Shot Sound 6. Reactive FX 2. Looping sound 3. Exploder 4. One Shot Sound 5. Reactive FX (c) Cancel > (x) Exit > ?   қ   type type fxid fxid soundalias soundalias W  ??  createfx_filter createfx_scaleid 3
  4f  3
  ?V  highlighted default selected 9  U[  type origin origin origin B
  ?= angles angles angles ?   ?I  type reactive_radius fxid No FX createfx_vfxonly ?   ?{  type reactive sound:  soundalias reactive FX:  fxid soundalias fxid reactive_fx soundfx_interval soundfx     ??  select_by_name 3
  ??  3
  =[  ?  [?  selected_ents selected_ents Selected Ent Mode move Mode: Rate: Snap2Normal: Snap2Angle: rotate Mode: p enter v move Mode: origin origin ?   ??  BUTTON_X shift s r l end BUTTON_RSHLDR tab e u  4?  shift ctrl = - Rate:    ? 0   ? Snap2Normal: f   ? Snap2Angle: v   ;F  new_ent_selection angles angles \   ??  new_ent_selection angles =   ?  3
  4f  3
  4f  s   ]  origin origin position origin }   ??  createfx_exploder_reset exploder exploder B
  ?i  ?   :[  createfx_drawdist createfx_drawdist origin ?   ?I  300 createfx_autosave_time createfx_autosave_time createfx_saving B
  Zn  createfx_no_autosave ?   ?  new_ent_selection origin angles    ?Q  r   ??  name    d?  ?   ?Q  stop_loop ?   i?  position origin origin normal normal angles ?   ?E  type oneshotfx none 3
  ??  3
  pz  3
  ?V      ??  ?   ??  k   AF     ??  I   M?     ?     ?x  origin origin origin ?   l?  origin    ?e  death $   >?  ?  ??  name type mask 3
  ȳ  type fx 3
  ȳ  fxid type exploder exploder type / type string  nil ent.v[ " " ] = " "; ent.v[ " " ] =  ; O   >f  highlight change highlight change Q   ?f  highlight change highlight change    A  >   ??  +   ? X   ??  new_ent_selection    ?e  ?   eR  new_ent_selection    ??  5   ?e  ^   MA     #[  _   ??  script_model #   ??     2[  D   ?    ?I     ?I  new_createfx_centerprint new_createfx_centerprint ?  I|  DPAD_UP kp_uparrow DPAD_DOWN kp_downarrow DPAD_RIGHT kp_rightarrow DPAD_LEFT kp_leftarrow BUTTON_Y BUTTON_B q  ??  DPAD_UP kp_uparrow DPAD_DOWN kp_downarrow DPAD_LEFT kp_leftarrow DPAD_RIGHT kp_rightarrow BUTTON_Y BUTTON_B _   !. type reactive_fx    ? 
    stop_loop G   ?t  B
  :  c   ??  type <
  oI  <
  I  <
  I  <
  I  oneshotfx loopfx soundfx_interval soundfx X   q?  type reactive_fx <
  4  ?  x?  script_origin angles angles origin origin script_origin angles script_origin angles angles ?    position MOD_EXPLOSIVE position position code_damageradius 0  ?  Help: Insert          Insert entity L               Drop selected entities to the ground A               Add option to the selected entities P               Reset the rotation of the selected entities V               Copy the angles from the most recently selected fx onto all selected fx. Delete          Kill the selected entities ESCAPE          Cancel out of option-modify-mode, must have console open Ctrl-C          Copy Ctrl-V          Paste F2              Toggle createfx dot and text drawing F5              SAVES your work Dpad            Move selected entitise on X/Y or rotate pitch/yaw A button        Toggle the selection of the current entity X button        Toggle entity rotation mode Y button        Move selected entites up or rotate roll B button        Move selected entites down or rotate roll R Shoulder      Move selected entities to the cursor L Shoulder      Hold to select multiple entites L JoyClick      Copy R JoyClick      Paste N               UFO T               Toggle Timescale FAST Y               Toggle Timescale SLOW [               Toggle FX Visibility ]               Toggle ShowTris F11             Toggle FX Profile    +w  1  > 	 //_createfx generated. Do not touch!! #include scripts\common\utility; #include scripts\common\createfx;
  main() { // CreateFX   entities placed:  scr_map_exploder_dump type oneshotfx ent = createOneshotEffect( " fxid " ); type loopfx ent = createLoopEffect( " fxid " ); type exploder exploder ent = createExploderEx( " fxid ", " exploder " ); ent = createExploder( " fxid " ); type soundfx ent = createLoopSound(); type soundfx_interval ent = createIntervalSound(); type reactive_fx fx fxid No FX ent = createReactiveEnt( " fxid " ); sound fxid No FX ent = createReactiveEnt(); ent set_origin_and_angles(  origin ,  angles  );  }   ?   ?I  origin angles origin angles ?   ?x  type U   ?x  fx oneshotfx loopfx exploder reactive_fx soundfx soundfx_interval reactive_fx P   ?=  fxid No FX fx fxid No FX sound r   ??  type reactive_fx type 6  ?I  soundfx oneshotfx exploder soundfx_interval reactive_fx loopfx type    ?;  B
  l     ?;  B
  l  ?   ?;   B
  d?  B
  ?|  _ .gsc backup_ .gsc B
  ?|  _ .gsc backup.gsc B
  ?|  /share/ /scripts/ /maps/ /gen/ B
  l  $   ?{  devraw raw &   ?y  B
  ??  cp B
  d?  sp mp ?  b?  mouse1 BUTTON_RSHLDR BUTTON_LSHLDR BUTTON_RSTICK BUTTON_LSTICK BUTTON_A BUTTON_B BUTTON_X BUTTON_Y DPAD_UP DPAD_LEFT DPAD_RIGHT DPAD_DOWN shift ctrl escape F1 F5 F4 F2 a e g c h i k l m p r s u v x z del end tab ins add space enter 1 2 3 4 5 6 7 8 9 0 - = , . [ ] leftarrow rightarrow uparrow downarrow     ??     _?  R   ?          ?2  "   ?2  (   ?2  (   ?2  ?  *?  left center p   ??  center middle <   RA     ??  b   ??   g   ?     ?K     ?A   d   ?  left '   
}  ?   ??  ?   ??  select_by_substring   select_by_substring fxid :   ??  6   dR  