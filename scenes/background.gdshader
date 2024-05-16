shader_type canvas_item;

uniform sampler2D noise_texture: repeat_enable;

void fragment() {
	float distortion = texture(noise_texture, UV + TIME * 0.1).r;
	COLOR = texture(noise_texture, UV + distortion + vec2(TIME * 0.1, cos(TIME * 0.5)));
}