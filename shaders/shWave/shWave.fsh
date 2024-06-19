//
// Fragment shader to convert a sprite into a wave
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 sprite_dim;
uniform vec2 sprite_scale;
uniform vec2 uv_mid;
uniform vec2 uv_dim;
varying float t_s;

const float n_waves = 5.0;
const float speed_factor = 1.0;

void main()
{
	vec2 uv_00 = uv_mid - 0.5*uv_dim;
	
	// Creating the sine wave effect
	vec2 rel_pos = (v_vTexcoord - uv_00)/uv_dim; // In [0, 1], quantile position in UV-space
	float sin_scale = 0.5*(1.0 + sin(rel_pos.y * 2.0 * 3.14 * n_waves + t_s*speed_factor)); // Sine waves in [0, 1]
	vec2 coord = vec2(
		uv_00.x + uv_dim.x*(1.0/sin_scale * rel_pos.x),
		uv_mid.y + (v_vTexcoord.y - uv_mid.y)
	);


    // Check if the current texture coordinate is outside the specified range
    vec4 pix = v_vColour * texture2D(gm_BaseTexture, coord);
	if (
		(coord.x > uv_mid.x + 0.5*uv_dim.x) || (coord.x < uv_mid.x - 0.5*uv_dim.x) ||
		(coord.y > uv_mid.y + 0.5*uv_dim.y) || (coord.y < uv_mid.y - 0.5*uv_dim.y)
	) {
        pix.a = 0.0; // Set alpha to 0
    }

	gl_FragColor = pix;
}
