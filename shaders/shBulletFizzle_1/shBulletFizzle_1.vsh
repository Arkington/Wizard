/*
//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

uniform float progress;                      // Progress of the fizzle effect (in [0, 1])
uniform float sprite_h;                      // Height of the sprite
uniform float sprite_w;                      // Width of the sprite
const float max_fizzle_distance = 10.0;      // Maximum displacement distance for the fizzle effect
const float fizzle_frequency = 5.0;          // Frequency of the sine wave for the fizzle effect

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Calculate wavy distortion using sine wave function
	float rel_y = in_Position.y / sprite_h;
    float fizzle_offset = max_fizzle_distance * progress * sin(mod(rel_y * fizzle_frequency * 2.0 * 3.14, 2.0*3.14));

	vec4 object_space_pos = vec4(
		in_Position.x + fizzle_offset,
		in_Position.y,
		in_Position.z,
		1.0
	);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

*/



//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}
