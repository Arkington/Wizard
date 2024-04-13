function initializeSpeakers() {

	// Default
	spkNone = Speaker(NO_PORTRAIT, [vDefault]);

	// Silent
	spkSilent = Speaker(NO_PORTRAIT, [NO_VOICE]);

	// Axel
	spkAxel = Speaker(
		porAxelTest,
		[vDefault],
		{
			wave_height_factor: TEXT_WAVE_HEIGHT_FACTOR_LOW,
		}
	);
	spkAxelInner = struct_copy(spkAxel); struct_set(spkAxelInner, "voices", NO_VOICE);

	// HC, via bird
	spkHCViaBird = Speaker(
		porBird,
		[
			vHC1,
			vHC2,
			vHC3,
			vHC4
		],
		{
			pitch_factor: 0.9,
			pitch_variance: 0.3,
			pitch_alter: function() { return 0.9 + (random(1) - 0.5)/3; },
			text_pause_voice_length: 8
		}
	);

	// Gecko Wizard
	spkGeckoWizard = Speaker(NO_PORTRAIT, [vDefault]);

	// Hatrick
	spkHatrickNeutral = Speaker(
		porHatrick,
		[
			vHatrickSad2,
			vHatrickNeutral7,
			vHatrickNeutral8
		],
		{
			pitch_variance: 0.5,
			pitch_alter: function() { return 1 + (random(1) - 0.5)/2; },
			text_pause_voice_length: 8
		}
	);
	spkHatrickSad = Speaker(
		porHatrickSad,
		[
			vHatrickSad1,
			vHatrickSad2,
			vHatrickSad5
		],
		{
			pitch_factor: 0.9,
			pitch_variance: 0.33,
			pitch_alter: function() { return 0.9 + (random(1) - 0.5)/3; },
			text_pause_voice_length: 8
		}
	);
	spkHatrickHappy = Speaker(
		porHatrickHappy,
		[
			vHatrickHappy1,
			vHatrickHappy3,
			vHatrickHappy5
		],
		{
			pitch_variance: 0.67,
			pitch_alter: function() { return 1 + (random(1) - 0.5)/1.5; },
			text_pause_voice_length: 8
		}
	);
	
	// Misc NPCs
	spkBubblegum = Speaker(
		porBubblegum,
		[vDefault],
		{
			text_speed: TEXT_SPEED_LOW,
			pause_text_length: TEXT_PAUSE_LENGTH_HIGH,
			text_pause_voice_length: TEXT_PAUSE_VOICE_LENGTH_HIGH,
		}
	);
}