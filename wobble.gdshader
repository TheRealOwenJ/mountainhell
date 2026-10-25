
shader_type canvas_item;

uniform float wobble_speed = 4.5;
uniform float wobble_strength = 0.025;
uniform float wobble_frequency = 18.0;
uniform float vertical_wobble = 0.012;
uniform float color_bleed = 0.002;

void fragment() {
    vec2 uv = UV;
    float t = TIME * wobble_speed;

    uv.x += sin(uv.y * wobble_frequency + t) * wobble_strength;
    uv.x += sin(uv.y * wobble_frequency * 0.45 - t * 0.7)
        * wobble_strength * 0.5;
    uv.y += sin(uv.x * wobble_frequency * 0.8 + t * 1.3)
        * vertical_wobble;
    uv.y += sin(uv.x * 8.0 - t * 0.6) * vertical_wobble * 0.5;
	
    float shift = color_bleed
        * (1.0 + sin(uv.y * 30.0 + t) * 0.5);

    vec4 col;
    col.r = texture(TEXTURE, uv + vec2(shift, 0.0)).r;
    col.g = texture(TEXTURE, uv).g;
    col.b = texture(TEXTURE, uv - vec2(shift, 0.0)).b;
    col.a = texture(TEXTURE, uv).a;

    COLOR = col * COLOR;
}
