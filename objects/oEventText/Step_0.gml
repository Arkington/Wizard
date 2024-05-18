// Load textnode
if !active { exit; }

if !begun {
	LoadText(text_source, key);
	begun = true;
}

// Complete condition
if (global.text_handler.page_array == NONE) {
	complete = true;
}