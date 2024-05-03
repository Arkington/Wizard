/// @desc Meter fill SFX/anim
if (prev_progress != progress) {
	if (prev_progress < 1 and progress >= 1) {
		audio_play_sound(sndMeterFull, 0, false);
	} else if (progress > prev_progress and prev_progress < 1) {
		audio_play_sound(sndMeterAdd, 0, false, 1, 0, 0.6 + progress/5);
	}
	prev_progress = progress;
}

// Bar filling animation
bar_fill = ceil(precision*(bar_fill + fill_rate*(progress - bar_fill)))/precision;