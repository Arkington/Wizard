mus_loop_start = {
	musNoMusicFound: 0,
	musSpacewalk: 2.22222,
	musBeforeYourCourage: 5.21739,
	musNervousApproach: 3.03797,
	musLaughingYouOutTheDoor: 2.96296,
}

sfx_loop_start = {
	sndFocusRing: 0.53828,
	sndCharge: 1.2,
}

function AudioSetLoopPoints() {
	var _all_sounds = struct_merge(global.mus_loop_start, global.sfx_loop_start);
	var _snd = struct_get_names(_all_sounds);
	for (var i = 0; i < array_length(_snd); i++) {
		audio_sound_loop_start(asset_get_index(_snd[i]), struct_get(_all_sounds, _snd[i]));
	}
}