/// @desc Bubblegame faces down after greeting

// Inherit the parent event
event_inherited();

if (global.state.BUBBLEGUM_GREETED) {
	direction = DOWN*90;
}