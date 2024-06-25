//
// Shader to increase the scale of an object.
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float progress;                      // Progress of the effect in [0, 1]
uniform vec2 mid_pt;

const float split_dist = 0.3;      // Maximum displacement for the split effect
varying float split_dst;
varying float image_scale;
varying float prog;

void main()
{
	image_scale = 1.0 + 2.0*split_dist*progress; // in [1, 1 + 2.0*split_dist]

	//vec4 object_space_pos = vec4(in_Position.xyz, 1.0);
    vec4 object_space_pos = vec4(
		mid_pt.x - image_scale*(mid_pt.x - in_Position.x),
		mid_pt.y - image_scale*(mid_pt.y - in_Position.y),
		in_Position.z,
		1.0
	);

    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;

    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	prog = progress;
	split_dst = split_dist;
}