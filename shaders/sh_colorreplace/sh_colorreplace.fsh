//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 targColor;
uniform vec3 repColor;

void main()
{
	vec4 base = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if(distance(base.rgb, targColor) < 0.2) {
		gl_FragColor = vec4(repColor.rgb, 1);
	} else {
		gl_FragColor = vec4(base.rgb, base.a);
	}
}
