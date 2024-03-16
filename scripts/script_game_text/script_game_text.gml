// @param text_id
function script_game_text(_text_id){
	switch(_text_id) {

		case "npc1":
			scr_text("Hi I'm npc1");
			scr_text("Hi I like apples");
			scr_text("...and girls!");
				scr_option("Cool", "npc1 - cool");
				scr_option("Gross!", "npc1 - gross");
			break;
			
			case "npc1 - cool":
				scr_text("I think so!");
				break;
			case "npc1 - gross":
				scr_text("Hey ur gross...");
				break;

		case "npc2":
			scr_text("Hi I'm npc2");
			scr_text("Hi I like oranges");
			scr_text("...and boys!");
			break;

		case "npc3":
			scr_text("Hi I'm npc3");
			scr_text("I will stab you");
			break;

	}
}