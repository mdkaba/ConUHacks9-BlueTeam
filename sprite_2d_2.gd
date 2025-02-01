extends Sprite2D

var angular_speed = PI

var screen_size

@export var health = 100

func _init() -> void:
	print("Started")
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	var speed = 300
	var direction = 0
	if Input.is_key_pressed(KEY_RIGHT):
		direction = 1
	if Input.is_key_pressed(KEY_LEFT):
		direction = -1
		
	rotation += angular_speed * delta * direction
	
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_ENTER):
		speed = 800
	if Input.is_key_pressed(KEY_UP):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_key_pressed(KEY_DOWN):
		velocity = Vector2.DOWN.rotated(rotation) * speed * 0.5
	position += velocity * delta
	var screen_size = get_viewport_rect().size  # Get screen width & height
	var sprite_pos = global_position  # Sprite's world position
	
	if sprite_pos.x < 0 or sprite_pos.x > screen_size.x or sprite_pos.y < 0 or sprite_pos.y > screen_size.y:
		health -= 1
	position = position.clamp(Vector2.ZERO, screen_size)
	
	var normalized_rotation = fmod(rotation_degrees, 360)
	if normalized_rotation > 0 and normalized_rotation < 180:
		flip_h = true
	else:
		flip_h = false
	
