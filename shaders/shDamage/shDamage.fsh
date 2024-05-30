//
// Shader to apply a red effect with a purple ring of damage moving towards the sprite's center.
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float progress; // in [0, 1]
uniform vec2 sprite_dim;
uniform vec2 sprite_scale;
uniform vec2 uv_mid;
uniform vec2 uv_dim;


void main()
{
	float radius = 0.8*(1.0 - progress)*uv_dim.x; // Arbitratily use the u-axis for scale (since u/v axes aren't normalized)
	// The closer to the radius, the more purple
	
    vec4 pix = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	
    // Round the uv coordinates to the nearest pixel
	vec2 uv_00 = uv_mid - uv_dim/2.0;
	vec2 pixel_coord = (v_vTexcoord - uv_00)/uv_dim * (sprite_dim / sprite_scale);
	vec2 round_pixel_coord = floor(pixel_coord);
	vec2 rounded_uv_coord = round_pixel_coord/(sprite_dim / sprite_scale) * uv_dim + uv_00;
	
	float d = sqrt(pow(rounded_uv_coord.x - uv_mid.x, 2.0) + pow((rounded_uv_coord.y - uv_mid.y)*(uv_dim.x/uv_dim.y), 2.0)); // Scale v-axis to the u-axis as picked arbitrarily
	float d_factor_red = pow(min(d/radius, radius/d), 1.0);
	float d_factor_green = pow(min(d/radius, radius/d), 0.5);
	float d_factor_blue = pow(min(d/radius, radius/d), 2.0);
	
	pix.r = progress*pix.r + (1.0 - progress)*(pix.r*(1.0 - 0.75 - 0.25*d_factor_blue) + 0.75 - 0.5*d_factor_blue); // Make a more red
	pix.g = progress*pix.g + (1.0 - progress)*(0.5*pix.g*(1.0 - d_factor_blue)); // Make less green
	pix.b = progress*pix.b + (1.0 - progress)*(0.5*pix.b*(1.0 - 0.25*d_factor_blue) + 0.25*d_factor_blue); // Make less blue but more near radius
	
	gl_FragColor = pix;
}
