mus_loop_start = {
	"musNoMusicFound": 0,
	"musSpacewalk": 2.22222222,
	"musBeforeYourCourage": 5.21739,
}

function LoopStart(_mus) {
	return struct_get(global.mus_loop_start, audio_get_name(_mus));
}