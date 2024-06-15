//
// Shader to decrease transparency in a parabolic fashion.
//

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying float prog;

void main() {
    vec4 pix = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	pix.a = min(1.0 - pow(prog, 2.0), pix.a);
	gl_FragColor = pix;
}
