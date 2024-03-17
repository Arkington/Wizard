event_inherited();

if interact {
	switch options[pos] {
		case "Start Game":
			room_goto_next();
			break;
		case "Settings":
			break;
		case "Quit Game":
			game_end();
			break;
	}
}