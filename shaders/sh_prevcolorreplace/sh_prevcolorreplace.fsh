//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 targColor;
uniform vec3 repColor;

uniform vec2 textureSize;

void main()
{
	vec4 base = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float outlineSize = 0.2;
	bool hasNonInvisNeighbor = false;
	
	float texelX = 1.0 / textureSize.x;
	float texelY = 1.0 / textureSize.y;
	
	bool isTargColor = distance(base.rgb, targColor) < 0.05;
	
	if(base.a == 0.0) {
		for(float bobo = -outlineSize; bobo <= outlineSize; bobo+=0.1) { // x
			for(float bibi = -outlineSize; bibi <= outlineSize; bibi+=0.1) { // y
				if(bobo == 0.0 && bibi == 0.0) continue; // skip center LUL
			
				vec2 thisTexelPos = vec2((bobo) * texelX, (bibi) * texelY);
				vec4 neighborColor = texture2D(gm_BaseTexture, v_vTexcoord + thisTexelPos);
			
				if(neighborColor.a == 1.0) {
					hasNonInvisNeighbor = true;
					break;
				}
			if(hasNonInvisNeighbor) break;
			}
		}
	}
	
	if(base.a == 0.0 && !hasNonInvisNeighbor)
		isTargColor = false;
	
	if(isTargColor || hasNonInvisNeighbor) {
		gl_FragColor = vec4(repColor.rgb, 1);
	} else {
		gl_FragColor = vec4(base.rgb, base.a);
	}
}
