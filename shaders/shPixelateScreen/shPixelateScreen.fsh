varying vec2 v_vTexcoord;
varying vec4 v_vColour;


const vec4 pixel = vec4(336.0, 224.0, 2.0, 2.0);
void main() {
	vec2 ts = vec2(pixel.z*(1./pixel.x),pixel.w*(1./pixel.y));
	vec2 coord = vec2(
		ts.x*floor(v_vTexcoord.x/ts.x),
		ts.y*floor(v_vTexcoord.y/ts.y));
	gl_FragColor = texture2D(gm_BaseTexture, coord);
}
