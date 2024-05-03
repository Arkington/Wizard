#macro ALPHABET "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
#macro DEFAULT_TEXT string("Default text for {0}.", object_get_name(object_index))
#macro EFFECT_CODE_LEN 3
#macro NO_PORTRAIT undefined
#macro NO_CHOICES undefined
#macro NO_NEXT_NODE undefined
#macro NO_VOICE undefined
#macro DEFAULT_TEXT_KEY "main_1"
#macro PAGE_PAUSE_S 2

// Special strings
#macro AXEL "[Axel]"


// Textbox size
#macro DEFAULT_TEXTBOX_WIDTH 304
#macro DEFAULT_TEXTBOX_HEIGHT 56
#macro DEFAULT_BUFFER 5

// Textbox locations
#macro TEXTBOX_BOTTOM_X 16
#macro TEXTBOX_BOTTOM_Y 156

// Textbox effects
#macro TEXTBOX_FADE_IN_FRAMES 4

#macro TEXT_SPEED_LOW 0.5
#macro TEXT_SPEED_MID 1
#macro TEXT_SPEED_HIGH 2

#macro TEXT_PAUSE_LENGTH_LOW 3
#macro TEXT_PAUSE_LENGTH_MID 6
#macro TEXT_PAUSE_LENGTH_HIGH 12

#macro TEXT_PAUSE_VOICE_LENGTH_LOW 2
#macro TEXT_PAUSE_VOICE_LENGTH_MID 4
#macro TEXT_PAUSE_VOICE_LENGTH_HIGH 8

#macro TEXT_WAVE_SEP_LOW 10
#macro TEXT_WAVE_SEP_MID 20
#macro TEXT_WAVE_SEP_HIGH 40
#macro TEXT_WAVE_SPEED_SLOW 3
#macro TEXT_WAVE_SPEED_MID 6
#macro TEXT_WAVE_SPEED_FAST 12
#macro TEXT_WAVE_HEIGHT_FACTOR_LOW 1
#macro TEXT_WAVE_HEIGHT_FACTOR_MID 2
#macro TEXT_WAVE_HEIGHT_FACTOR_HIGH 5

#macro TEXT_SHAKE_INTENSITY_LOW 0.5
#macro TEXT_SHAKE_INTENSITY_MID 1
#macro TEXT_SHAKE_INTENSITY_HIGH 2
#macro TEXT_SHAKE_AVE_TIME_LOW 1
#macro TEXT_SHAKE_AVE_TIME_MID 2
#macro TEXT_SHAKE_AVE_TIME_HIGH 5

// Choice menu stats
#macro CHOICE_MENU_BUFFER 2
#macro CHOICE_MENU_SCALE (2/3)
#macro CHOICE_MENU_X 160

// Thought swirl stats
#macro THOUGHT_FADE_SPEED 0.01
#macro THOUGHT_ROTATE_SPEED 0.5
#macro THOUGHT_BATTLE_ROTATE_SPEED 1
#macro THOUGHT_RADIUS 32
#macro THOUGHT_WIDTH 40
#macro THOUGHT_HEIGHT 20
#macro THOUGHT_TEXT_SCALE (1/3)
#macro HOVER_THOUGHT_SCALE 1.25
#macro HOVER_THOUGHT_SPEED 0.01

// Battle text params
#macro BATTLE_TEXT_LEFT {screenpos_x: 16, screenpos_y: 114, scale: 2/3, textbox_width: 272 }
#macro BATTLE_TEXT_RIGHT {screenpos_x: 149, screenpos_y: 114, scale: 2/3, textbox_width: 272 }