//
// NOT simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress;                      // Progress of the fizzle effect (in [0, 1])
uniform float mid_x;
uniform float mid_y;

const float max_scale = 2.5;      // Maximum displacement ratio for the fizzle effect
varying float image_scale;
varying float adj_scale;
varying float prog;

void main()
{
	adj_scale = (max_scale - 1.0)*progress; // in [0, max_scale - 1.0] because 1.0 of the final width is reserved for the actual sprite
	image_scale = (1.0 - progress) + max_scale*progress; // in [1, max_scale] because the image needs to be max_scale by the end

	//vec4 object_space_pos = vec4(in_Position.xyz, 1.0);
    vec4 object_space_pos = vec4(
		mid_x - image_scale*(mid_x - in_Position.x),
		in_Position.y,
		in_Position.z,
		1.0
	);

    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	prog = progress;
}