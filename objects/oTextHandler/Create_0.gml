fade_in = true; // First textbox is faded in
text_struct = NONE; // The text struct loaded into the handler
page_array = NONE; // Array of pages loaded into the handler
active_textbox = noone;
active_choice_menu = noone;
active_thought_swirl = noone;

page = 0;
page_rendered = false;
next_page_choice = false;
next_page_swirl = false;
player_state_prior = NONE;
pause_page_timer = 0;

state = TextHandlerStateAwaiting;