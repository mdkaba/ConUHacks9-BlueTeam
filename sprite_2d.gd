extends Sprite2D

var angular_speed = PI

var screen_size

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


	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
