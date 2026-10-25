shader_type canvas_item;

uniform int amount = 40;

void fragment()
{
	vec2 grid_uv = floor(UV * float(amount)) / float(amount);
	COLOR = texture(TEXTURE, grid_uv);
}