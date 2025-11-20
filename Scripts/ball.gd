extends CharacterBody2D


func _physics_process(delta: float) -> void:
		velocity = Vector2(200, 200)  # starting speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			print("Collided")
			velocity = velocity.bounce(collision.get_normal())
