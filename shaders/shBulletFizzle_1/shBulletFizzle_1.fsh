//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;                      // Progress of the fizzle effect (in [0, 1])
const float max_fizzle_distance = 0.1;      // Maximum displacement distance for the fizzle effect
const float fizzle_frequency = 1.0;          // Frequency of the sine wave for the fizzle effect

void main()
{
	
	vec2 uv = v_vTexcoord;
	
	float centre_x = 0.5;
	float centre_y = 0.5;
	
    vec2 dir = v_vTexcoord - vec2(0.5);
    float dist = distance(uv, vec2(centre_x,centre_y));
    vec2 offset = dir * (sin(dist * 0.0001 - progress * 0.0005));
	
	
	
	float x_adj = max_fizzle_distance * progress * sin(v_vTexcoord.y * fizzle_frequency * 2.0 * 3.14);
    vec4 distort = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
	
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);

}
