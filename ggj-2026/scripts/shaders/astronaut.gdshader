shader_type canvas_item;
uniform vec3 suit_color;
uniform vec3 visor_color;

vec3 rgb2hsl(in vec3 c) {
    vec3 hsl = vec3(0.0, 0.0, 0.0);
    float cMin = min(min(c.r, c.g), c.b);
    float cMax = max(max(c.r, c.g), c.b);
    float delta = cMax - cMin;

    hsl.z = (cMax + cMin) / 2.0; // Lightness

    if (delta > 0.0) {
        hsl.y = delta / (1.0 - abs(2.0 * hsl.z - 1.0));

        if (c.r == cMax) {
            hsl.x = (c.g - c.b) / delta + (c.g < c.b ? 6.0 : 0.0);
        } else if (c.g == cMax) {
            hsl.x = (c.b - c.r) / delta + 2.0;
        } else {
            hsl.x = (c.r - c.g) / delta + 4.0;
        }
        hsl.x /= 6.0;
    }
    return hsl;
}

float hue2rgb(float f1, float f2, float hue) {
    if (hue < 0.0) hue += 1.0;
    if (hue > 1.0) hue -= 1.0;
    if ((6.0 * hue) < 1.0) return f1 + (f2 - f1) * 6.0 * hue;
    if ((2.0 * hue) < 1.0) return f2;
    if ((3.0 * hue) < 2.0) return f1 + (f2 - f1) * (2.0 / 3.0 - hue) * 6.0;
    return f1;
}

vec3 hsl2rgb(vec3 hsl) {
    vec3 rgb;
    if (hsl.y == 0.0) {
        rgb = vec3(hsl.z);
    } else {
        float f2 = hsl.z < 0.5 ? hsl.z * (1.0 + hsl.y) : (hsl.z + hsl.y) - (hsl.y * hsl.z);
        float f1 = 2.0 * hsl.z - f2;
        
        rgb.r = hue2rgb(f1, f2, hsl.x + (1.0/3.0));
        rgb.g = hue2rgb(f1, f2, hsl.x);
        rgb.b = hue2rgb(f1, f2, hsl.x - (1.0/3.0));
    }
    return rgb;
}
void fragment() {
	vec3 c = COLOR.rgb;
	vec3 hsl = rgb2hsl(c);
	if (c.g > c.r) {
		hsl.r = rgb2hsl(suit_color).r;
	}
	else {
		hsl.r = rgb2hsl(visor_color).r;
	}
	
	COLOR = vec4(hsl2rgb(hsl), COLOR.a);
}
//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
