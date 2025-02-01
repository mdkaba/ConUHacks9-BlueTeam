extends Sprite2D

var angular_speed = PI * 1.2

var screen_size
var dash_cooldown: float = 2
var current_dash_cooldown: float = 0
var dash_duration: float = 0.07
var current_dash_duration: float = 0

@export var health = 100

func _init() -> void:
	print("Started")
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta: float) -> void:
	process_dash(delta)
		
	var speed = 800
	if(current_dash_duration > 0):
		speed = 3500
	var direction = 0
	if Input.is_key_pressed(KEY_D):
		direction = 1
	if Input.is_key_pressed(KEY_A):
		direction = -1
		
	rotation += angular_speed * delta * direction
	
	var velocity = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W):
		velocity = Vector2.UP.rotated(rotation) * speed

	if Input.is_key_pressed(KEY_S):
		velocity = Vector2.DOWN.rotated(rotation) * speed * 0.5

	if Input.is_key_pressed(KEY_SPACE):
			if(current_dash_cooldown == 0):
				current_dash_cooldown = dash_cooldown
				current_dash_duration = dash_duration

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	print_debug(rotation_degrees)
	var normalized_rotation = fmod(rotation_degrees, 360)
	if normalized_rotation > 0 and normalized_rotation < 180:
		flip_h = true
	else:
		flip_h = false
	
func process_dash(delta: float) -> void:
	if (current_dash_duration > 0):
		current_dash_duration -= delta
		if(current_dash_duration < 0):
			current_dash_duration = 0
		return
		
	if(current_dash_cooldown > 0):
		current_dash_cooldown -= delta
		if(current_dash_cooldown < 0):
			current_dash_cooldown = 0
		print(current_dash_cooldown)
	

	
