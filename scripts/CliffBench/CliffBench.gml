/// @desc Triggered on interact with the rCliffBench bench
function CliffBench_BenchCheck(_id) {
	BenchInteract(_id);
	if (!global.state.GWG_OPEN and !global.state.CLIFF_THOUGHT_SWIRL) {
		CreateThoughtSwirl("cliff_thought_swirl");
	}
}


// Text
initializeSpeakers();
cliff_thought_swirl = {
	"What am I doing?": function() { load_text("textCliffBench", "what"); },
	"The sea is nice.": function() { load_text("textCliffBench", "sea"); },
	"I'm going to be late.": function() { load_text("textCliffBench", "late"); },
}


textCliffBench = {
	what : [
		Page(spkAxel, "What... what am I doing here?"),
		Page(spkAxel, "..."),
		Page(spkAxel, "I got all the way to the gate and then I turned around."),
		Page(spkAxel, "..."),
		Page(spkAxel, "Sigh."),
		Page(spkAxel, "At least there's a nice breeze going on."),
		Page(spkAxel, "Whoosh... wheesh..."),
		Page(spkAxel, "..."),
		CodePage(function() { global.state.CLIFF_THOUGHT_SWIRL = true; }),
	],
	sea : [
		Page(spkAxel, "I like this spot. It's so calm."),
		Page(spkAxel, "I can smell the salt of the ocean."),
		Page(spkAxel, "..."),
		Page(spkAxel, "I wonder..."),
		Page(spkAxel, "If I brought an omelette here on a plate... and just let it hang out in the breeze..."),
		Page(spkAxel, "...would the salty sea air give it some extra flavour?"),
		CodePage(function() { global.state.CLIFF_THOUGHT_SWIRL = true; }),
	],
	late : [
		Page(spkAxel, "I'll probably be late to class if I keep sitting here."),
		Page(spkAxel, "And yet... I don't really want to move."),
		Page(spkAxel, "The teacher will probably say something like |S|\"Why are you late to my class?\"", {shake_intensity_x: 0}),
		Page(spkAxel, "And I'm going to have to tell them |V|\"Well it was because I was staring at the ocean.\"/V/"),
		Page(spkAxel, "And they will say |S|\"Why didn't you just get up and come to class?/S/\"", {shake_intensity_x: 0}),
		Page(spkAxel, "And I will tell them that I didn't really want to move."),
		Page(spkAxel, "And that I was thinking about what they, the teacher, would say when I showed up late..."),
		Page(spkAxel, "...and told them I was staring at the ocean."),
		Page(spkAxel, "..."),
		Page(spkAxel, "Ha..."),
		CodePage(function() { global.state.CLIFF_THOUGHT_SWIRL = true; }),
	],
}