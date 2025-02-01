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
	if Input.is_key_pressed(KEY_D):
		direction = 1
	if Input.is_key_pressed(KEY_A):
		direction = -1
		
	rotation += angular_speed * delta * direction
	
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_SPACE):
		speed = 800
	if Input.is_key_pressed(KEY_W):
		velocity = Vector2.UP.rotated(rotation) * speed
	if Input.is_key_pressed(KEY_S):
		velocity = Vector2.DOWN.rotated(rotation) * speed * 0.5


	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	print_debug(rotation_degrees)
	var normalized_rotation = fmod(rotation_degrees, 360)
	if normalized_rotation > 0 and normalized_rotation < 180:
		flip_h = true
	else:
		flip_h = false
	
