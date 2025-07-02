class_name Ball extends CharacterBody2D

var initial_position: Vector2
var speed = 500
var direction = Vector2(0.5, 1)
var game_started: bool = false

func _init() -> void:
	Signals.game_start.connect(_on_start_game)

func _ready() -> void:
	initial_position = global_position

func _physics_process(delta: float) -> void:
	if game_started:
		direction = direction.normalized()
		velocity = speed * direction * delta
		var collision = move_and_collide(velocity)
		if collision:
			if collision.get_collider() is Paddle:
				direction = direction.bounce(collision.get_normal())
				direction.x = get_x_bounce_direction(collision)
			else:
				if collision.get_collider() is Brick:
					collision.get_collider().break_brick()
				direction = direction.bounce(collision.get_normal())
		
		if collision:
			if collision.get_collider() is Brick:
				$HitBrickSfx.play()
			else:
				$HitWallSfx.play()

func _on_start_game() -> void:
	game_started = true

func get_x_bounce_direction(collision: KinematicCollision2D) -> float:
	var paddle: Paddle = collision.get_collider()
	var relative_x = collision.get_position().x - paddle.global_position.x
	var percentage = relative_x / 60
	return (percentage - 0.5) * 2

func reset_ball() -> void:
	game_started = false
	global_position = initial_position
	velocity = Vector2.ZERO
