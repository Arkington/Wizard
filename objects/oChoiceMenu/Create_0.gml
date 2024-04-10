event_inherited();

choices = [
	Choice("Default dialogue choice 1"),
	Choice("Default dialogue choice 2"),
	Choice("You get the idea"),
];

choice_made = undefined;

// Choice menu properties
scale = CHOICE_MENU_SCALE;
box_per_choice = true;

min_width *= scale;
min_height *= scale;
selector_width *= scale;
selector_height *= scale;
selector_xoffset *= scale;
selector_yoffset *= scale;
line_height *= scale;
x_buffer *= scale;
y_buffer *= scale;
width *= scale;
height *= scale;