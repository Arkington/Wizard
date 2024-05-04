function CaveCloset_CutsceneShowcase() {
	EventPlayerStateCutscene();
	EventFace(oPlayer, RIGHT);
	EventWait(1);
	EventFace(oPlayer, DOWN);
	EventWait(2);
	EventText("cutscene_showcase", "cs1");
	WaitForEvents();
	EventCode(CaveCloset_CutsceneShowcase_2);
}

function CaveCloset_CutsceneShowcase_2() {
	
	switch GetState("cs_dir") {
		case UP:
			EventText("cutscene_showcase", "cs_up");
			WaitForEvents();
			EventMove(oPlayer, 168, 96);
			break;
		case DOWN:
			EventText("cutscene_showcase", "cs_down");
			WaitForEvents();
			EventMove(oPlayer, 168, 192);
			break;
		case LEFT:
			EventText("cutscene_showcase", "cs_left");
			WaitForEvents();
			EventMove(oPlayer, 88, 144);
			break;
		case RIGHT:
			EventText("cutscene_showcase", "cs_right");
			WaitForEvents();
			EventMove(oPlayer, 248, 144);
			break;
	}
	
	WaitForEvents();
	EventMove(oPlayer, 168, 144);
	EventText("cutscene_showcase", "cs2");
	WaitForEvents();
	EventMove(oHatrick, 176, 80);
	WaitForEvents();
	EventWait(2);
	EventMove(oPlayer, 176, 96);
	EventWait(2);
	EventFace(oPlayer, DOWN);
	EventPlayerStateFree();
}




initializeSpeakers();
/*
	key: TextNode(
	    [
	        Page("")
	    ],
	    [
	        Choice("", "key"),
	        Choice("", "key")
	    ]
	),
*/
cutscene_showcase = {
	cs1: [
		Page(spkAxel, "Hi! Welcome to the cutscene showcase."),
		Page(spkAxel, "Now that cutscenes have become extensively implemented, there's no limit to what we can do."),
		Page(spkAxel, "For example, I can stop speaking and walk whatever direction you pick!"),
		ChoicePage(
			Choice("Up!", NO_NEXT_NODE, function() { SetState("cs_dir", UP)}),
			Choice("Down!", NO_NEXT_NODE, function() { SetState("cs_dir", DOWN)}),
			Choice("Left!", NO_NEXT_NODE, function() { SetState("cs_dir", LEFT)}),
			Choice("Right!", NO_NEXT_NODE, function() { SetState("cs_dir", RIGHT)}),
		)
	],
	cs_up: [
		Page(spkAxel, "Great choice! Going up!"),
	],
	cs_down: [
		Page(spkAxel, "Great choice! Going down!"),
	],
	cs_left: [
		Page(spkAxel, "Great choice! Going left!"),
	],
	cs_right: [
		Page(spkAxel, "Great choice! Going right!"),
	],
	cs2: [
		Page(spkAxel, "Phew!"),
		Page(spkAxel, "That was a lot of walking."),
		CodePage(function() {
			EventMove(oHatrick, 240, 80);
			WaitForEvents();
			EventMove(oHatrick, 176, 80);
			WaitForEvents();
			EventMove(oHatrick, 240, 80);
			WaitForEvents();
			EventMove(oHatrick, 176, 80);
			WaitForEvents();
			EventMove(oHatrick, 240, 80);
			WaitForEvents();
			EventMove(oHatrick, 176, 80);
			WaitForEvents();
		}),
		Page(spkAxel, "..."),
		Page(spkAxel, "What are you doing?"),
		Page(spkHatrickNeutral, "..."),
		Page(spkHatrickNeutral, "Tee hee"),
		CodePage(function() {
			for (var i = 0; i < 10; i++) {
				EventMove(oHatrick, floor(random_range(72, 264)), floor(random_range(40, 168)), 5);
				WaitForEvents();
			}
		}),
		Page(spkHatrickNeutral, "|S|I'm moving while talking, silly!/S/"),
		Page(spkHatrickNeutral, "|S|Anything is possible with the new event system!/S/"),
	],
}



hat_intro_2 = {

	main_1: [
	    Page(spkHatrickNeutral, "hi... Hi!"),
	    Page(spkAxel, "Hi."),
	    Page(spkHatrickNeutral, "Hi. Hey. I... kinda saw you shoot that guy... with |S|MAGIC/S/! It was... kinda cool."),
	    Page(spkAxel, "Thanks."),
	    Page(spkHatrickNeutral, "...you must be some sort of wizard, right?"),
	    Page(spkHatrickNeutral, "...some kinda |S|MAGIC/S/ man???"),
	    Page(spkAxel, "It's literally my first day learning magic."),
	    Page(spkHatrickNeutral, "No way."),
	    Page(spkAxel, "Yes way."),
	    Page(spkHatrickNeutral, "Wow, I've never seen magic like that before in my entire life."),
	    Page(spkAxel, "Really?"),
	    Page(spkHatrickNeutral, "Yeah for real. Never seen it. Who are you?"),
	    Page(spkAxel, "I'm Axel."),
	    Page(spkHatrickNeutral, "That's cool. Cool to meet you. Umm, I mean, nice to meet you."),
	    ChoicePage(
	        Choice("What's you name?", "main_2"),
	        Choice("Ok bye.", "early_bye")
	    )
	],
	early_bye: [
	    Page(spkHatrickSad, "WAIT don't go I haven't talked to anyone in a really long time..."),
	    Page(spkAxel, "..."),
		GoToPage("main_2")
	],
	main_2 : [
        Page(spkHatrickNeutral, "I'm... umm... hat... Hat... yeah."),
		ChoicePage(
	    	Choice("Nice to meet you, Hat.", "name_hat"),
	    	Choice("Short for Hatrick?", "name_hatrick"),
	    	Choice("I'm gonna call you Hatty.", "name_hatty")
	    )
	],
	name_hat: [
	    Page(spkHatrickHappy, "Heeee... nice to meet you too.")
	],
	name_hatrick: [
	    Page(spkHatrickHappy, "Yeah... yeah that sounds cool!"),
	    Page(spkHatrickNeutral, "Short for Hatrick.")
	],
	name_hatty: [
	    Page(spkHatrickNeutral, "!"),
	    Page(spkHatrickHappy, "I... I have a nickname..."),
	    Page(spkHatrickHappy, "..."),
	    Page(spkHatrickNeutral, "This is the best.")
	],
}







