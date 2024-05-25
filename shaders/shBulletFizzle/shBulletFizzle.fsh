//
// NOT SIMPLE passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 uv_center;
uniform vec2 uv_dimensions;

varying float image_scale;
varying float adj_scale;
varying float prog;
const float wave_freq = 2.0;          // Frequency of the sine wave for the fizzle effect


void main()
{
	
	// Calculate wavy distortion using sine wave function
	float pos_y = v_vTexcoord.y;
    float x_adj = adj_scale * 0.5 * uv_dimensions.x * sin((v_vTexcoord.y - uv_center.y)/uv_dimensions.y * wave_freq * 2.0 * 3.14);

	vec2 coord = vec2(
		uv_center.x + image_scale*(v_vTexcoord.x - uv_center.x) + x_adj,
		v_vTexcoord.y
	);

    // Check if the current texture coordinate is outside the specified range
    vec4 pix = v_vColour * texture2D(gm_BaseTexture, coord);
	if (coord.x > uv_center.x + 0.5*uv_dimensions.x || coord.x < uv_center.x - 0.5*uv_dimensions.x) {
        pix.a = 0.0; // Set alpha to 0
    } else {
		pix.a = 1.0 - prog;
    }
	
	gl_FragColor = pix;
}
