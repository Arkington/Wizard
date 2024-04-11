/// @desc Default textbox params
text = DEFAULT_TEXT;
scale = 1;
alpha = 1;

// Speaker
portrait = NO_PORTRAIT;
voices = [vDefault];
pitch_factor = 1;
pitch_variance = 0;

// Sprites
textbox_sprite = sMenubox;
textbox_font = fntText;
fade_in = true;
portrait_border_sprite = sPortraitBorder;
portrait_border_width = 4;

// Screen position params
textbox_width = DEFAULT_TEXTBOX_WIDTH;
textbox_height = DEFAULT_TEXTBOX_HEIGHT;
screenpos_x = TEXTBOX_BOTTOM_X;
screenpos_y = TEXTBOX_BOTTOM_Y;
x_buffer = DEFAULT_BUFFER;
y_buffer = DEFAULT_BUFFER;

// Text effect params
text_speed = TEXT_SPEED_MID;
text_pause_length = TEXT_PAUSE_LENGTH_MID;
text_pause_voice_length = TEXT_PAUSE_VOICE_LENGTH_MID;
wave_sep = TEXT_WAVE_SEP_MID;
wave_speed = TEXT_WAVE_SPEED_MID;
wave_height_factor = TEXT_WAVE_HEIGHT_FACTOR_MID;
shake_intensity_x = TEXT_SHAKE_INTENSITY_MID;
shake_intensity_y = TEXT_SHAKE_INTENSITY_MID;
shake_ave_time = TEXT_SHAKE_AVE_TIME_MID;

SetupTextbox();