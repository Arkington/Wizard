/// @desc Triggered on interact with the rCliffBench bench
function CliffBench_BenchCheck(_id) {
	BenchInteract(_id);
	if (!global.state.GWG_OPEN and !global.state.CLIFF_THOUGHT_SWIRL) {
		CreateThoughtSwirl("cliff_thought_swirl");
	}
}



initializeSpeakers();
/*
	"I have a thought!" : TextNode(
	    [
	        Page("")
	    ],
	    [
	        Choice("", "key"),
	        Choice("", "key")
	    ]
	),
*/

cliff_thought_swirl = {
	"What am I doing?" : TextNode(
	    [
	        Page(spkAxelNeutral, "What... what am I doing here?"),
	        Page(spkAxelNeutral, "..."),
			Page(spkAxelNeutral, "I got all the way to the gate and then I turned around."),
			Page(spkAxelNeutral, "..."),
			Page(spkAxelNeutral, "Sigh."),
			Page(spkAxelNeutral, "At least there's a nice breeze going on."),
			Page(spkAxelNeutral, "Whoosh... wheesh..."),
			Page(spkAxelNeutral, "...")
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.CLIFF_THOUGHT_SWIRL = true; }
	),
	"The sea is nice." : TextNode(
	    [
	        Page(spkAxelNeutral, "I like this spot. It's so calm."),
	        Page(spkAxelNeutral, "I can smell the salt of the ocean."),
	        Page(spkAxelNeutral, "..."),
			Page(spkAxelNeutral, "I wonder..."),
			Page(spkAxelNeutral, "If I brought an omelette here on a plate... and just let it hang out in the breeze..."),
			Page(spkAxelNeutral, "...would the salty sea air give it some extra flavour?")
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.CLIFF_THOUGHT_SWIRL = true; }
	),
	"I'm going to be late." : TextNode(
	    [
	        Page(spkAxelNeutral, "I'll probably be late to class if I keep sitting here."),
	        Page(spkAxelNeutral, "And yet... I don't really want to move."),
	        Page(spkAxelNeutral, "The teacher will probably say something like |S|\"Why are you late to my class?\""),
	        Page(spkAxelNeutral, "And I'm going to have to tell them \"Well it was because I was staring at the ocean.\""),
	        Page(spkAxelNeutral, "And they will say |S|\"Why didn't you just get up and come to class?/S/\""),
	        Page(spkAxelNeutral, "And I will tell them that I didn't really want to move."),
	        Page(spkAxelNeutral, "And that I was thinking about what they, the teacher, would say when I showed up late..."),
	        Page(spkAxelNeutral, "...and told them I was staring at the ocean."),
	        Page(spkAxelNeutral, "..."),
	        Page(spkAxelNeutral, "Ha..."),
	    ],
		NO_CHOICES,
		NO_NEXT_NODE,
		function() { global.state.CLIFF_THOUGHT_SWIRL = true; }
	),
}