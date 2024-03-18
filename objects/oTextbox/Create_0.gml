
text = DEFAULT_TEXT;
scale = 1;
alpha = 1;

// Speaker
portrait = NO_PORTRAIT;
voices = [vDefault];
pitch_alter = function() { return 1; }

// Sprites
textbox_sprite = sMenubox;
textbox_font = fntText;
portrait_border_sprite = sMenubox;
portrait_border_width = 3;
	
// Screen position params
textbox_width = DEFAULT_TEXTBOX_WIDTH;
textbox_height = DEFAULT_TEXTBOX_HEIGHT;
screenpos_x = TEXTBOX_BOTTOM_X;
screenpos_y = TEXTBOX_BOTTOM_Y;
x_buffer = DEFAULT_BUFFER;
y_buffer = DEFAULT_BUFFER;
	
// Text effect params
text_speed = TEXT_SPEED_MID;
pause_text_length = TEXT_PAUSE_LENGTH_MID;
pause_sound_length = TEXT_VOICE_PAUSE_LENGTH_MID;
wave_sep = TEXT_WAVE_SEP_MID;
wave_speed = TEXT_WAVE_SPEED_MID;
wave_height_factor = TEXT_WAVE_HEIGHT_FACTOR_MID;
shake_intensity = TEXT_SHAKE_INTENSITY_MID;
shake_ave_time = TEXT_SHAKE_AVE_TIME_MID;

SetupTextbox();