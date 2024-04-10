var _to_play = MusicOnRoomEntry();

// Stop/play the default room track on room entry
if (_to_play == NONE) {
	StopMusic();
} else {
	PlayMusic(_to_play);
}