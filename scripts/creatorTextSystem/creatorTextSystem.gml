/// @param page
function create_textbox(_page) {
	textbox = instance_create_layer(0, 0, LAYER_TEXT, objTextbox);
	textbox.text = _page.text;
	return textbox;
}

/// @param choices
function create_choice_menu(_choices) {
	choice_menu = instance_create_layer(0, 0, LAYER_TEXT, objChoiceMenu);
	choice_menu.choices = _choices;
	return choice_menu;
}
