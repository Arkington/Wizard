function OnHitStandard(_attack){
	// Damage
	hp -= _attack.damage;
	if (hp <= 0) { instance_destroy(); }
	
	// SFX
	audio_play_sound(_attack.hit_sfx, 0, false);
	
	// Effects
	switch _attack.type {
		case ATK_TYPE.STUN:
			stunned = true;
			break;
	}
	
	
	
	
	
	
	
	
	// Attack is destroyed
	instance_destroy(_attack);
}