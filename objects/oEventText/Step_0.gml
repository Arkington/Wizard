// Load textnode
if !active { exit; }

if !begun {
	load_textnode(text_source, key);
	begun = true;
}

// Complete condition
if (global.text_handler.activeTextNode == noone) {
	complete = true;
}