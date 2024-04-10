/// @param _page
function create_textbox(_page, _fade_in = true) {
	textbox = instance_create_layer(0, 0, LAYER_TEXT, oTextbox);
	textbox_params = _page.textbox_params;
	with (textbox) {
		text = _page.text;
		
		// Add any optional parameters supplied in the Page()
		struct_foreach(other.textbox_params, function(_param, _value) {
			variable_instance_set(id, _param, _value);
		});
		// Specify fade in
		variable_instance_set(id, "fade_in", _fade_in);
		
		SetupTextbox();
	}
	return textbox;
}

/// @param _choices
function create_choice_menu(_choices) {
	var choice_menu = instance_create_layer(0, 0, LAYER_TEXT, oChoiceMenu);
	with choice_menu {
		choices = _choices;
		options = [];
		for (var i = 0; i < array_length(_choices); i++) {
			options[i] = _choices[i].text;
		}
	}
	return choice_menu;
}

/// @param {String} _text_source_name
/// @param {String} _key
function load_textnode(_text_source_name, _key = DEFAULT_TEXT_KEY) {
	with global.text_handler {
		if activeTextNode == noone {
			var _text_source = variable_global_get(_text_source_name);
			text_source = _text_source;
			activeTextNode = _text_source[$_key];
			if instance_exists(oPlayer) { player_state_prior = oPlayer.state; }
		}
	}
}

/// @desc Resets the global text handler
function ClearTextHandler() {
	with global.text_handler {
		nextTextNode = NO_NEXT_NODE;
		TextHandlerStateCleanUp();
	}
}