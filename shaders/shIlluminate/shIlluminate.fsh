//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float illuminate;
uniform float pixel_w;
uniform float pixel_h;

void main() {
	// Return white if the pixel itself isn't coloured, but a neighbour is
	
	vec4 pix = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec4 pix_illuminate = vec4(1.0, 1.0, 1.0, 0.0);
	
	
	// Check neighbours
	for (float x = -1.0; x <= 1.0; x += 1.0) {
		vec2 offset = vec2(x*pixel_w, 0.0);
		vec4 neighbour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
		if (neighbour.a <= 0.0) { pix_illuminate.a = illuminate; }
    }
	for (float y = -1.0; y <= 1.0; y += 1.0) {
		vec2 offset = vec2(0.0, y*pixel_h);
		vec4 neighbour = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord + offset);
		if (neighbour.a <= 0.0) { pix_illuminate.a = illuminate; }
    }
	
	if (pix.a <= 0.0) { pix_illuminate.a = 0.0; }

	gl_FragColor = pix_illuminate;
}
