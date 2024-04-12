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

test_conversation = {
	test_1: TextNode(
	    [
	        Page(spkNone, "Hello!\nIt's me!\nHatrick the hat!"),
	        Page(spkNone, "I'm so weeeeeeeeeeeee very coooooooooooool and super niiiiiiiiiiiiiiiice and let me tellllllllllllllllllllllllllll you I can't speakkkkkkkkkkkkkkkkkkk"),
			Page(spkNone, "This line is wayyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy too big."),
	    ],
	    [
	        Choice("Yay", "fin"),
	        Choice("Woo", "fin")
	    ]
	),
	fin: TextNode(
	    [
	        Page(spkNone, "Well there ya go")
	    ],
	    NO_CHOICES,
	    NO_NEXT_NODE
	),
}

hatrick_intro_conversation = {

	main_1: TextNode(
	    [
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
	        Page(spkHatrickNeutral, "That's cool. Cool to meet you. Umm, I mean, nice to meet you.")
	    ],
	    [
	        Choice("What's you name?", "main_2"),
	        Choice("Ok bye.", "early_bye")
	    ]
	),
	early_bye: TextNode(
	    [
	        Page(spkHatrickSad, "WAIT don't go I haven't talked to anyone in a really long time..."),
	        Page(spkAxel, "...")
	    ],
	    NO_CHOICES,
	    "main_2"
	),


	main_2 : TextNode(
	    [
	        Page(spkHatrickNeutral, "I'm... umm... hat... Hat... yeah.")
	    ],
	    [
	    	Choice("Nice to meet you, Hat.", "name_hat"),
	    	Choice("Short for Hatrick?", "name_hatrick"),
	    	Choice("I'm gonna call you Hatty.", "name_hatty")
	    ]
	),
	name_hat: TextNode(
	    [
	        Page(spkHatrickHappy, "Heeee... nice to meet you too.")
	    ],
	    NO_CHOICES,
	    NO_NEXT_NODE
	),
	name_hatrick: TextNode(
	    [
	        Page(spkHatrickHappy, "Yeah... yeah that sounds cool!"),
	        Page(spkHatrickNeutral, "Short for Hatrick.")
	    ],
	    NO_CHOICES,
	    NO_NEXT_NODE
	),
	name_hatty: TextNode(
	    [
	        Page(spkHatrickNeutral, "!"),
	        Page(spkHatrickHappy, "I... I have a nickname..."),
	        Page(spkHatrickHappy, "..."),
	        Page(spkHatrickNeutral, "This is the best.")
	    ],
	    NO_CHOICES,
	    NO_NEXT_NODE
	),
}

hatrick_fav_food = {
	main_1: TextNode(
	    [
	        Page(spkHatrickNeutral, "MY FAVOURITE FOOD"),
	    ],
	    [
	        Choice("APPEL", "hf2"),
	        Choice("BANAN", "hf2"),
	        Choice("PER", "hf2")
	    ]
	),
	hf2: TextNode(
	    [
	        Page(spkHatrickNeutral, "YES"),
	    ],
	    [
	        Choice("ok...", "hf2"),
	        Choice("Hatrick why are you doing this", "hf2"),
	        Choice("THIS WASN'T SUPPOSED TO BE IN THE GAME WHY IS IT IN THE GAME", "hf2")
	    ]
	)
}

hes_here_too = {
	main_1: TextNode(
	    [
	        Page(spkHCViaBird, "I'm here too"),
	    ],
	    [
	        Choice("APPEL", "hf2"),
	        Choice("BANAN", "hf2"),
	        Choice("He's here too. But why?", "hf2")
	    ]
	),
	hf2: TextNode(
	    [
	        Page(spkHCViaBird, "YES"),
	    ],
	    [
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	        Choice("AAAAAAAAA", "hf2"),
	    ]
	)
}
