function initializeSpeakers() {

	// Default
	spkNone = Speaker(NO_PORTRAIT, [vDefault]);

	// Silent
	spkSilent = Speaker(NO_PORTRAIT, [NO_VOICE]);

	// Axel
	spkAxelNeutral = Speaker(porAxelTest, [vDefault]);

	// Hatrick
	spkHatrickNeutral = Speaker(
		porHatrickTest,
		[
			vHatrickSad2,
			vHatrickNeutral7,
			vHatrickNeutral8
		],
		{
			pitch_alter: function() { return 1 + (random(1) - 0.5)/2; },
			pause_sound_length: 8
		}
	)
	spkHatrickSad = Speaker(
		porHatrickSadTest,
		[
			vHatrickSad1,
			vHatrickSad2,
			vHatrickSad5
		],
		{
			pitch_alter: function() { return 0.9 + (random(1) - 0.5)/3; },
			pause_sound_length: 8
		}
	)
	spkHatrickHappy = Speaker(
		porHatrickHappyTest,
		[
			vHatrickHappy1,
			vHatrickHappy3,
			vHatrickHappy5
		],
		{
			pitch_alter: function() { return 1 + (random(1) - 0.5)/1.5; },
			pause_sound_length: 8
		}
	)
}