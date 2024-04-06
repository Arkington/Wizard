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

test_thought_swirl = {
	"I'm happy." : TextNode(
	    [
	        Page(spkAxel, "I'm happy. Today is a good day."),
			Page(spkAxel, "Yeah.... that's all I had to say.")
	    ]
	),
	"I'm thoughtful." : TextNode(
	    [
	        Page(spkAxel, "I'm thoughtful. Today is a thinky day."),
			Page(spkAxel, "Yeah.... that's all I had to thonk.")
	    ]
	),
	"I'm schmoovin'." : TextNode(
	    [
	        Page(spkAxel, "I'm schmoovin'. Today is a schnice day."),
			Page(spkAxel, "Yeah.... I'm pretty based...")
	    ]
	),
}