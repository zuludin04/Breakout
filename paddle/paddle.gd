class_name Paddle extends StaticBody2D

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		var speed = -500 * delta
		global_position.x = clamp(global_position.x + speed, 0, 670)
	if Input.is_action_pressed("right"):
		var speed = 500 * delta
		global_position.x = clamp(global_position.x + speed, 0, 670)
