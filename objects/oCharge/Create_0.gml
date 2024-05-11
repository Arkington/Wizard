/// @desc
t = 0;

charge_time_s = 10;
shapes_per_sec = 4;
pull_time_s = 0.4;
size_min = 1;
size_max = 2;
r_min = 8;
r_max = 12;

shapes = [];

enum SHAPE_TYPE {
	SQUARE,
	CIRCLE,
	N
}

audio_play_sound(sndCharge, 0, true);