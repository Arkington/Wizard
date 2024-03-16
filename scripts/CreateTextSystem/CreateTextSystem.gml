/// @param _page
function create_textbox(_page) {
	textbox = instance_create_layer(0, 0, LAYER_TEXT, oTextbox);
	textbox_params = _page.textbox_params;
	with (textbox) {
		text = _page.text;
		
		// Add any optional parameters supplied in the Page()
		struct_foreach(other.textbox_params, function(_param, _value) {
			variable_instance_set(id, _param, _value);
		});
		
		SetupTextbox();
	}
	return textbox;
}

/// @param _choices
function create_choice_menu(_choices) {
	var choice_menu = instance_create_layer(0, 0, LAYER_TEXT, oChoiceMenu);
	choice_menu.choices = _choices;
	choice_menu.options = [];
	for (var i = 0; i < array_length(_choices); i++) {
	    choice_menu.options[i] = _choices[i].text;
	}
	return choice_menu;
}

/// @param {String} _text_source_name
/// @param {String} _key
function load_textnode(_text_source_name, _key = "main_1") {
	if global.text_handler.activeTextNode == noone {
		_text_source = variable_global_get(_text_source_name);
		global.text_handler.text_source = _text_source;
		global.text_handler.activeTextNode = _text_source[$_key];	
	}
}
