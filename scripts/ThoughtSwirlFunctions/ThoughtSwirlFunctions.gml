/// @desc Creates a thought swirl's textbox. Used in CreateThoughtSwirl().
function CreateThoughtTextbox(_thought) {
    return CreateTextbox(Page(
		Speaker(NO_PORTRAIT, NO_VOICE),
		_thought,
		{
			textbox_sprite : sMenubox,
			textbox_font : fntTextswirl,
			textbox_width : THOUGHT_WIDTH/THOUGHT_TEXT_SCALE,
			textbox_height : THOUGHT_HEIGHT/THOUGHT_TEXT_SCALE,
			//x_buffer : 4,
			//y_buffer : 4,
			scale : THOUGHT_TEXT_SCALE,
			alpha : 0.5
		}
	));
}

/// @desc Create a thought swirl from a thought:action struct.
function CreateThoughtSwirl(_thought_swirl_name, _secs_until_appear = 4, _secs_until_disappear = 10) {
	var _swirl = instance_create_layer(0, 0, LAYER_INSTANCES, oThoughtSwirl);
	with (_swirl) {
		
		// Setup Thought Swirl
		thought_swirl_name = _thought_swirl_name;
		thought_swirl = variable_global_get(thought_swirl_name);
		secs_until_appear = _secs_until_appear;
		secs_until_disappear = _secs_until_disappear;
		
		n_thoughts = 0;
		thought_angles = [];
		struct_foreach(thought_swirl, function(_thought, _action) {
		    thought_textboxes[n_thoughts] = CreateThoughtTextbox(_thought);
			actions[n_thoughts] = _action;
			thought_scales[n_thoughts] = THOUGHT_TEXT_SCALE;
		    n_thoughts++;
		});
		for (var i = 0; i < n_thoughts; i++) {
		    thought_angles[i] = 360 * i / n_thoughts;
		}
	}
}

function CreateBattleSwirl(_choices) {
	var _swirl = instance_create_layer(0, 0, LAYER_INSTANCES, oThoughtSwirl);
	with (_swirl) {
		
		// Setup Thought Swirl
		secs_until_appear = 0;
		secs_until_disappear = NONE;
		
		n_thoughts = 0;
		thought_angles = [];
		for (var i = 0; i < array_length(_choices); i++) {
		    thought_textboxes[n_thoughts] = CreateThoughtTextbox(_choices[i].text);
			thought_textboxes[n_thoughts].depth -= 1;
		    thoughts[n_thoughts] = _choices[i].text;
			next_keys[n_thoughts] = _choices[i].next_key;
			actions[n_thoughts] = function() {};
			thought_scales[n_thoughts] = THOUGHT_TEXT_SCALE;
		    n_thoughts++;
		};
		for (var i = 0; i < n_thoughts; i++) {
		    thought_angles[i] = 360 * i / n_thoughts;
		}
	}
	return _swirl;
}
