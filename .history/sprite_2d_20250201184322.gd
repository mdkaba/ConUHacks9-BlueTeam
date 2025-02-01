extends Sprite2D

var screen_size
var dash_cooldown: float = 2
var current_dash_cooldown: float = 0
var dash_duration: float = 0.07
var current_dash_duration: float = 0

@export var health = 100

func _ready():
	print("Started")
	screen_size = get_viewport_rect().size
	
	# Keep ship on the left side
	position.x = screen_size.x * 0.2

func _process(delta: float) -> void:
	process_dash(delta)
	
	var speed = 800
	if current_dash_duration > 0:
		speed = 3500

	var velocity = Vector2.ZERO
	
	# Move only up and down
	if Input.is_key_pressed(KEY_W):
		velocity = Vector2.UP * speed
	elif Input.is_key_pressed(KEY_S):
		velocity = Vector2.DOWN * speed * 0.5

	if Input.is_key_pressed(KEY_SPACE) and current_dash_cooldown == 0:
		current_dash_cooldown = dash_cooldown
		current_dash_duration = dash_duration

	position += velocity * delta
	
	# Keep ship constrained to the left
	position.x = screen_size.x * 0.2
	position.y = clamp(position.y, 0, screen_size.y)

func process_dash(delta: float) -> void:
	if current_dash_duration > 0:
		current_dash_duration -= delta
		if current_dash_duration < 0:
			current_dash_duration = 0
		return
		
	if current_dash_cooldown > 0:
		current_dash_cooldown = max(0, current_dash_cooldown - delta)
		print(current_dash_cooldown)  
