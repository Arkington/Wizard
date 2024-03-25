mus_loop_start = {
	"musSpacewalk": 2.22222222
}

function LoopStart(_mus) {
	return struct_get(global.mus_loop_start, audio_get_name(_mus));
}