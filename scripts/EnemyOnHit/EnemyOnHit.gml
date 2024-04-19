function OnHitStandard(_attack) {
	// Damage
	hp -= _attack.damage;
	
	// Report death to the wave
	if (hp <= 0) {
		if (wave != NONE) {
			var _enemies_remaining = max(struct_get(wave.get_em, object_get_name(object_index)) - 1, 0);
			struct_set(wave.get_em, object_get_name(object_index), _enemies_remaining);
		}
		instance_destroy();
	}
	
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