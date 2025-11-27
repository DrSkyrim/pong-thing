extends CharacterBody2D

@onready var game_manager: GameManager = ($"../../Game_Manager")
@export var arena_width: float = 1152   # Set this to your screen width
@export var arena_height: float = 640   # Optional (if you want bottom/top detection)
func _ready() -> void:
	print(position)
	_reset_ball()
	print(position)
	velocity = Vector2(200, 200)   # starting speed
	
func _physics_process(delta: float) -> void:
		var collision = move_and_collide(velocity * delta)
		if collision:
			print("Collided")
			velocity = velocity.bounce(collision.get_normal())
			velocity = velocity.normalized() * (velocity.length() + 50)
		_check_out_of_bounds()

func _check_out_of_bounds() -> void:
	if not game_manager:
		print("Error: GameManager is null!")
		return
	var manager: GameManager = game_manager
	# Left side OOB
	if global_position.x < 0:
		manager.add_point_right()   # Right player scores
		_reset_ball()

	# Right side OOB
	if global_position.x > arena_width:
		manager.add_point_left()    # Left player scores
		_reset_ball()

func _reset_ball() -> void:
	# Reset position to center
	print("XD")
	position = Vector2(0, 0)

	# Give the ball a fresh random direction
	var dir = Vector2(randf_range(-1, 1), randf_range(-0.6, 0.6)).normalized()
	velocity = dir * 200   # reset speed
