/// @desc
function SetupTextbox() {
	
    // Text effect arrays
    char_x = [];
    char_y = [];
    char_col = [];
    char_wave = [];
    char_shake = [];
	char_rainbow = [];
    
    draw_set_font(textbox_font);
    frame = 0;
    char_count = 0;
    text_pause_timer = 0;
	text_pause_voice_timer = 0;
	portrait_width = portrait != NO_PORTRAIT ? sprite_get_width(portrait) : 0;
	portrait_height = portrait != NO_PORTRAIT ? sprite_get_height(portrait) : 0;
	portrait_x_adj = portrait != NO_PORTRAIT ? portrait_width + 2*portrait_border_width : 0;
    line_width = textbox_width - 2*x_buffer - portrait_x_adj;
	line_height = string_height(ALPHABET);
	string_widths = []; // Track string width of each line
	n_lines = 0;
    
    // Auto add line breaks, colours, effects
    last_space_pos = -1;
    line_start_pos = 1;
    active_colour = WHITE;
    active_wave = false;
    active_shake = false;
    active_pulse = false;
	active_rainbow = false;
    for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c+1;
    	var char = string_char_at(text, c_pos);
    
    	// Check for effect triggers
    	if c <= string_length(text) - EFFECT_CODE_LEN {
    		var trigger = string_copy(text, c_pos, EFFECT_CODE_LEN);
    		var effect = true;
    		switch trigger {
    			case "|W|":
    				active_colour = WHITE;
    				break;
    			case "|R|":
    				active_colour = RED;
    				break;
    			case "|B|":
    				active_colour = BLUE;
    				break;
    			case "|T|":
    				active_colour = TEAL;
    				break;
				case "|P|":
					active_pulse = true;
					break;
				case "/P/":
					active_pulse = false;
					break;
				case "|X|":
					active_rainbow = true;
					break;
				case "/X/":
					active_rainbow = false;
					break;
    			case "|V|":
    				active_wave = true;
    				break;
    			case "/V/":
    				active_wave = false;
    				break;
    			case "|S|":
    				active_shake = true;
    				break;
    			case "/S/":
    				active_shake = false;
    				break;
    			default:
    				effect = false;
    				break;
    		}
    		if effect {
    			text = string_delete(text, c_pos, EFFECT_CODE_LEN);
    			c--;
    			continue;
    		}
    	}
    
    	// Create effects
    	char_col[c] = active_colour;
    	char_wave[c] = active_wave;
    	char_shake[c] = active_shake;
    	char_pulse[c] = active_pulse;
		char_rainbow[c] = active_rainbow;
    
    	var substr_to_pos = string_copy(text, line_start_pos, c_pos - line_start_pos + 1);
    	if string_width(substr_to_pos) > line_width {
    		if last_space_pos == -1 {
    			// If the line can't actually fit, just force it to a new line
    			text = string_insert("\n", text, c_pos);
    			line_start_pos = c_pos;
    		} else {
    			// Otherwise replace the last space with a newline
    			text = string_delete(text, last_space_pos, 1);
    			text = string_insert("\n", text, last_space_pos);
    			line_start_pos = last_space_pos;
    			last_space_pos = -1;
    		}
    	}
    	if char == " " {
    		last_space_pos = c_pos;
    	}
    }

	// Record the final line widths of each line
	// Note: must be done after the above loop since Effect Codes need to already be removed
    line_start_pos = 0;
	for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c + 1;
    	if string_char_at(text, c_pos) == "\n" {
			string_widths[n_lines] = string_width(string_copy(text, line_start_pos, c_pos - line_start_pos));
			n_lines++;
    		line_start_pos = c_pos;
    	}
	}
	// Record the width of the last line
	string_widths[n_lines] = string_width(string_copy(text, line_start_pos, c_pos - line_start_pos))

    // Get coords of each character
    running_x_pos = 0;
    running_y_pos = 0;
    line_start_pos = 1;
	line = 0;
    for (var c = 0; c < string_length(text); c++) {
    	var c_pos = c + 1;
    	var substr_to_c = string_copy(text, line_start_pos, c_pos - line_start_pos);
    	running_x_pos = string_width(substr_to_c);
    	char_x[c] = running_x_pos + (center_text)*(line_width - string_widths[line])/2;
    	char_y[c] = running_y_pos;
    	if string_char_at(text, c_pos) == "\n" {
    		line_start_pos = c_pos;
    		running_y_pos += line_height;
			line++;
    	}
    }
    
    text_length = string_length(text);
}