
shader_type canvas_item;

uniform sampler2D ball_texture : source_color;
uniform float shading : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 p = UV * 2.0 - 1.0;
    float r2 = dot(p, p);

    if (r2 > 1.0) {
        discard;
    }

    vec2 uv = vec2(UV.x, 1.0 - UV.y);
    vec4 tex = texture(ball_texture, uv);

    vec3 normal = normalize(vec3(-p.x, -p.y, sqrt(max(0.0, 1.0 - r2))));
    vec3 light_dir = normalize(vec3(-0.5, -0.6, 1.0));
    float light = max(dot(normal, light_dir), 0.0);
    float shade = mix(1.0, 0.4 + 0.6 * light, shading);

    COLOR = vec4(tex.rgb * shade, tex.a);
}
