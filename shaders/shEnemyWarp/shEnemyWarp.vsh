//
// Shader which compresses a sprite horizontally without regard for object rotation, then moves it upwards.
//
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)
uniform float progress;                      // Progress of the effect in [0, 1]
uniform vec2 mid_pt;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float prog;

void main() {
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
	vec4 adjusted_mid = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(mid_pt.xy, 0.0, 1.0);
    vec4 adjusted_position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
	adjusted_position.x = adjusted_mid.x + (1.0 - progress)*(adjusted_position.x - adjusted_mid.x);
	adjusted_position.y += pow(progress, 4.0);
	
	gl_Position = adjusted_position;
	
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
	prog = progress;
}
