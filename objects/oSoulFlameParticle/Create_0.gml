if (live_call()) return live_result;

sprite_index = array_choose([
	sSoulFlameParticle1,
	sSoulFlameParticle2,
	sSoulFlameParticle3,
	sSoulFlameParticle4
])
image_xscale = 2/3*coin_flip();
image_yscale = 2/3*coin_flip();
image_angle = random(360);

move_speed = 1.2;
t = 0;