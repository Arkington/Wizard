// Load textnode
if !active { exit; }

if !loaded {
	load_textnode(text_source, key);
	loaded = true;
}

// Complete condition
if (global.text_handler.activeTextNode == noone) {
	complete = true;
}