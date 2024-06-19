varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const float W = 336.0;
const float H = 224.0;

void main() {
	vec2 ts = vec2(1.0/336.0, 1.0/224.0);
	vec2 pix = vec2(
		floor(v_vTexcoord.x/W)*W,
		floor(v_vTexcoord.y/H)*H
	);
	gl_FragColor = texture2D(gm_BaseTexture, pix);
}
