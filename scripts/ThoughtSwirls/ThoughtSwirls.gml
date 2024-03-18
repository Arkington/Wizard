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
	        Page(spkAxelNeutral, "I'm happy. Today is a good day."),
			Page(spkAxelNeutral, "Yeah.... that's all I had to say.")
	    ]
	),
	"I'm thoughtful." : TextNode(
	    [
	        Page(spkAxelNeutral, "I'm thoughtful. Today is a thinky day."),
			Page(spkAxelNeutral, "Yeah.... that's all I had to thonk.")
	    ]
	),
	"I'm schmoovin'." : TextNode(
	    [
	        Page(spkAxelNeutral, "I'm schmoovin'. Today is a schnice day."),
			Page(spkAxelNeutral, "Yeah.... I'm pretty based...")
	    ]
	),
}