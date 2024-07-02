shader_set(shIlluminate);
shader_set_uniform_f(shader_illuminate_handle, illuminate);
with (oPlayer) {
	
	var _texture = sprite_get_texture(sprite_index, image_index);
	shader_set_uniform_f(other.shader_pw_handle, texture_get_texel_width(_texture));
	shader_set_uniform_f(other.shader_ph_handle, texture_get_texel_height(_texture));

	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y - z,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
}	
shader_reset();