state = ThoughtSwirlStateWaiting;
key = {};

follow_obj = instance_exists(oPlayer) ? oPlayer : oCore;
rotate_speed = instance_exists(oPlayer) ? THOUGHT_ROTATE_SPEED : THOUGHT_BATTLE_ROTATE_SPEED;
lifetime = 0;
alpha = 0;
aim_lock = false;
aim_reset_timer = 0;
angle = 90;
hover_thought = NONE;
thought_picked = NONE;