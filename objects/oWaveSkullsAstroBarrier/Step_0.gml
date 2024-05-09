/// @desc

// Keep king skull moving against player
if (enemies[0] != ENEMY_DOWN) {
	enemies[0].x = 2*MID_X - oCore.x;
	enemies[0].y = MID_Y - sqrt(sqr(r) - sqr(oCore.x - MID_X)) + 32;
}
