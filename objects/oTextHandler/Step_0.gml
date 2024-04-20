page_rendered = (active_textbox != noone) && (active_textbox.char_count >= active_textbox.text_length);
next_page_choice = (page + 1 < array_length(page_array)) && (page_array[page + 1].type == PAGE_TYPE.CHOICE);

pause_page_timer--;

state();