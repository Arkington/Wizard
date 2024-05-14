battleGwtSkulls = Battle(
	oOpponentSkull,
	8,
	NextWave_GwtSkulls,
	NextEvent_GwtSkulls,
	FinalEvent_GwtSkulls
);


function NextWave_GwtSkulls() {
	if (n_wins == 0) {
		return oWaveSkullsHorizontal;
	} else if (n_wins == 1 and last_wave_win) {
		return oWaveSkullsCircle;
	} else if (n_wins == 2 and last_wave_win) {
		return oWaveSkullsMonoBounce;
	} else if (n_wins == 3 and last_wave_win) {
		return oWaveSkullsMultiBounce;
	} else if (n_wins == 4 and last_wave_win) {
		return oWaveSkullsSpaceInvaders;
	} else if (n_wins == 5 and last_wave_win) {
		return oWaveSkullsAstroBarrier;
	} else if (n_wins == 6) {
		return oWaveSkullsBigBoy;
	} else {
		// Return waves cleared or failed, with a few exceptions
		var _wave_choices = [];
		array_copy(_wave_choices, 0, waves_cleared, 0, array_length(waves_cleared));
		_wave_choices = array_remove_values(_wave_choices, [oWaveSkullsAstroBarrier, oWaveSkullsSpaceInvaders]);
		return array_choose(array_concat(_wave_choices, waves_failed));
	}
}

function NextEvent_GwtSkulls() {
	if (n_waves == 0) {
		// Set battle info
		battle_info = {
			mentioned_space_invaders: false,
			many_fails: false,
		}
		EventPlayMusic(musLaughingYouOutTheDoor);
		EventText("textBattleGwtSkulls", "init");
	}

	// Space invaders
	else if (last_wave == oWaveSkullsSpaceInvaders and !battle_info.mentioned_space_invaders) {
		battle_info.mentioned_space_invaders = true;
		EventText("textBattleGwtSkulls", "space_invaders")
	}

	// On success
	else if (last_wave_win and n_wins != 5) {
		if (battle_info.many_fails) {
			EventText("textBattleGwtSkulls", ["post_fail_10", $"win_{n_wins}"]);
			battle_info.many_fails = false;
		} else {
			EventText("textBattleGwtSkulls", $"win_{n_wins}");
		}
	}
	
	// On failure
	else if (!last_wave_win and (n_fails <= 4)) {
		EventText("textBattleGwtSkulls", $"fail_{n_fails}");
	}
	else if (!last_wave_win and (n_fails == 10)) {
		battle_info.many_fails = true;
		EventText("textBattleGwtSkulls", "fail_10");
	}
	
	WaitForEvents();
	EventBattleBreak();
}

function FinalEvent_GwtSkulls() {
	EventText("textBattleGwtSkulls", "final");
	WaitForEvents();
	EventWait(2);
	ExitBattle();
}



// Text
initializeSpeakers();
textBattleGwtSkulls = {
	init: [
		Page(spkHC, $"Alright {AXEL}, your first real opponent is staring you down.", BATTLE_TEXT_LEFT),
		Page(spkHC, "This might be rather confronting, but now you must do battle!", BATTLE_TEXT_LEFT),
	],
	win_1: [
		Page(spkHC, "Swiftly dealt with! And for someone who's never seen the heat of combat before!", BATTLE_TEXT_LEFT),
		Page(spkAxel, "Oh, I've been in a fight before.", BATTLE_TEXT_RIGHT),
		Page(spkHC, "?????", BATTLE_TEXT_LEFT),
	],
	win_2: [
		Page(spkHC, "An innocent youth such as yourself has been engaged in a |S|brawl?/S/", BATTLE_TEXT_LEFT),
		Page(spkHC, "|V|A veritable clashing of might???/V/", BATTLE_TEXT_LEFT),
		Page(spkAxel, "Yeah, a wizard attacked me this morning.", BATTLE_TEXT_RIGHT),
	],
	win_3: [
		Page(spkHC, "You were attacked on school grounds? What did you do?", BATTLE_TEXT_LEFT),
		SwirlPage(
			Choice("Broke her concentration.", "concentration"),
			Choice("She didn't like my vibe.", "vibe"),
			Choice("Nothing.", "nothing"),
		),
	],
	concentration: [
		Page(spkAxel, "I think I broke her concentration. She seemed real upset.", BATTLE_TEXT_RIGHT),
		Page(spkHC, $"Ah, {AXEL}, my student.", BATTLE_TEXT_LEFT),
		Page(spkHC, $"It is imperative to never break another wizard's concentration.", BATTLE_TEXT_LEFT),
		Page(spkAxel, "I didn't know--", BATTLE_TEXT_RIGHT),
		Page(spkHC, "Watch out!", BATTLE_TEXT_LEFT),
	],
	concentration_2: [
		Page(spkHC, "...because things like that can happen.", BATTLE_TEXT_LEFT),
	],	
	vibe: [
		Page(spkAxel, "She didn't like when I... uh, she didn't like my vibe.", BATTLE_TEXT_RIGHT),
		Page(spkHC, "Hmm... well I wouldn't think that warrants an all-out assault...", BATTLE_TEXT_LEFT),
		Page(spkHC, "Watch out!", BATTLE_TEXT_LEFT),
	],
	vibe_2: [
		Page(spkHC, "We'll simply have to train you to defend yourself!", BATTLE_TEXT_LEFT),
	],
	nothing: [
		Page(spkAxel, "Nothing. I just got attacked.", BATTLE_TEXT_RIGHT),
		Page(spkHC, "I see... Well the incident should be reported!", BATTLE_TEXT_LEFT),
		Page(spkHC, "The school should be a safe grounds for all.", BATTLE_TEXT_LEFT),
	],
	nothing_2: [
		Page(spkHC, "...er, or as safe as it can be.", BATTLE_TEXT_LEFT),
	],
	
	
	win_4: [
		Page(spkHC, "In any case, I'm impressed regardless.", BATTLE_TEXT_LEFT),
		Page(spkHC, "You make a fine example for the other students!", BATTLE_TEXT_LEFT),
		Page(spkHC, "...or you would have, if anyone else had shown up.", BATTLE_TEXT_LEFT),
	],
	space_invaders: [
		Page(spkHC, "A classic attack! Any aspiring wizard should know it well.", BATTLE_TEXT_LEFT),
	],

	win_6: [
		Page(spkHC, "Don't let your guard down! The enemy is starting to weaken!", BATTLE_TEXT_LEFT),
	],
	win_7: [
		Page(spkHC, $"Alright {AXEL}, one more victory should do it!", BATTLE_TEXT_LEFT),
	],
	win_8: [
		Page(spkHC, "This is it! You've taken down the enemy's defenses!", BATTLE_TEXT_LEFT),
		Page(spkHC, "Search deep within yourself, and |S|show them what you're made of!/S/", BATTLE_TEXT_LEFT),
	],
	
	
	
	fail_1: [
		Page(spkHC, $"That's alright, {AXEL}.", BATTLE_TEXT_LEFT),
		Page(spkHC, "Learning to harness your connection to magic shouldn't come easy.", BATTLE_TEXT_LEFT),
		Page(spkHC, "You have failed to win this turn, but the battle rages on!", BATTLE_TEXT_LEFT),
	],
	fail_2: [
		Page(spkHC, "Don't worry yourself. Give it another go!", BATTLE_TEXT_LEFT),
	],
	fail_3: [
		Page(spkHC, "You're still standing! Strike them down!", BATTLE_TEXT_LEFT),
	],

	fail_4: [
		Page(spkHC, "You'll get used to it. Keep at it!", BATTLE_TEXT_LEFT),
	],
	fail_10: [
		Page(spkHC, $"I do admire your willingness to persevere in the face of adversity, {AXEL}.", BATTLE_TEXT_LEFT),
		Page(spkHC, "Umm...", BATTLE_TEXT_LEFT),
		Page(spkHC, "Maybe just try shooting randomly until you hit enough of them?", BATTLE_TEXT_LEFT),
	],
	post_fail_10: [
		Page(spkHC, "There you go! I can see it in your eyes... you're improving!", BATTLE_TEXT_LEFT),
		Page(spkHC, "Anyway...", BATTLE_TEXT_LEFT),
	],
	final: [
		Page(spkHC, "...My goodness.", BATTLE_TEXT_LEFT),
		Page(spkHC, "...", BATTLE_TEXT_LEFT),
		Page(spkAxel, "...", BATTLE_TEXT_RIGHT),
		Page(spkHC, "...", BATTLE_TEXT_LEFT),
		PausePage(1.5),
		Page(spkHC, "|V|Huzzaahhhh!!/V/", BATTLE_TEXT_LEFT),
	],
}
