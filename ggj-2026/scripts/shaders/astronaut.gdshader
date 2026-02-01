shader_type canvas_item;

uniform vec3 suit_color;
uniform vec3 visor_color;

void fragment() {
    vec4 tex = COLOR;

    // Convert to luminance (perceptual brightness)
    float light = dot(tex.rgb, vec3(0.299, 0.587, 0.114));

    // Decide which region this pixel belongs to
    vec3 target_color;
    if (tex.g >= tex.r) {
		light = tex.g;
        target_color = suit_color;
    } else {
		light = tex.r;
        target_color = visor_color;
    }

    // Apply baked lighting
    COLOR.rgb = target_color * light;
    COLOR.a   = tex.a;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
