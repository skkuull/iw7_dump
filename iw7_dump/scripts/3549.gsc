
   =3    >3  disconnect death c4 spawn ?
  ?  specialty_rugged_eqp ?
  ?      hasruggedeqp ?
  j?  ?
      monitordisownedgrenade missile_stuck power_c4 ?
  N?  ?
  ʹ  tag_use ?
  ??  Lethal_Static     scripts/mp/sentientpoolmanager     registersentient ?  K?  active plant ?
  ??  ?
  >?  %   53  death disconnect J   83  c4 triggered ?
  ?  neutral plant active explode /   23  neutral plant active destroy _   03  death ?
  ??  B
  ?"  c4_update E   93  death disconnect game_ended detonateExplosive ?   33  death disconnect emp_damage emp_grenade_mp ?
      playersareenemies ?
  ??  ch_tactical_emp_eqp ?
  ??  ?
      playersareenemies ?
  ??  destroyed_equipment ?  ??       hasruggedeqp ?
  ??  hitequip ?
  ?.     43  death bro_shot_start game_ended B
  *7 ?       c4_validdetonationstate ?
  ?  ?
  Ɵ  ?  ߝ        isusingreaper    /3  >   @3  death disconnect c4_unset game_ended watchForDetonation watchForDetonation detonate ?   ?3  death disconnect c4_unset game_ended watchForAltDetonation watchForAltDetonation B
  ?6 E   63         c4_resetaltdetonpickup power_c4 ?
  ?  /   .3     ;3      <3  disconnect death 