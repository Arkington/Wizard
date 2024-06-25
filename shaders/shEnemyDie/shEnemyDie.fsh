//
// Shader to separate an object into horizontal pixel bands and visually split these apart, accounting for object rotation.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress; // in [0, 1]
uniform vec2 sprite_dim;
uniform vec2 sprite_scale;
uniform vec2 uv_mid;
uniform vec2 uv_dim;

varying float split_dst;
varying float image_scale;
varying float prog;

void main()
{
    // Deduce the UV-coords of each pixel after the image splits
    vec2 split_coord = vec2(
        //uv_mid.x + (v_vTexcoord.x - uv_mid.x)*image_scale,
		uv_mid.x + (v_vTexcoord.x - uv_mid.x)*image_scale,
		uv_mid.y + (v_vTexcoord.y - uv_mid.y)*image_scale
	);

	// Calculate how much to add for the split
    vec2 uv_00 = uv_mid - uv_dim / 2.0;
    vec2 pixel_coord = floor((split_coord - uv_00) / uv_dim * (sprite_dim / sprite_scale));
	bool y_even = mod(pixel_coord.y, 2.0) == 0.0;
	float left_right = (y_even) ? -1.0 : 1.0;
	
	split_coord.x = split_coord.x + left_right*split_dst*prog*uv_dim.x;

	
	vec4 pix = v_vColour * texture2D(gm_BaseTexture, split_coord);
	
	// Alpha
	if (split_coord.x >= uv_mid.x - uv_dim.x/2.0 && split_coord.x <= uv_mid.x + uv_dim.x/2.0 && split_coord.y >= uv_mid.y - uv_dim.y/2.0 && split_coord.y <= uv_mid.y + uv_dim.y/2.0) {
		pix.a = min(1.0 - prog, pix.a);
	} else {
		pix.a = 0.0;
	}
	gl_FragColor = pix;
}
