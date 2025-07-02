extends Node

var brick = preload("res://brick/brick.tscn")

var spawn_position: Vector2 = Vector2(95, 80)
var brick_size: Vector2 = Vector2(61, 21)
var current_level: int = 0
var total_bricks: int = 0

func _init() -> void:
	Signals.track_score.connect(_on_track_score)

func _ready() -> void:
	spawn_bricks(BrickFormation.new().generate_brick(current_level))

func _on_track_score() -> void:
	total_bricks -= 1
	if total_bricks == 0:
		current_level += 1
		var ball: Ball = owner.get_child(3)
		ball.reset_ball()
		
		var hud = owner.get_child(5)
		hud.game_started = false
		
		spawn_bricks(BrickFormation.new().generate_brick(current_level))

func spawn_bricks(level) -> void:
	var column = level.size()
	var row = level[0].size()
	
	for i in column:
		for j in row:
			if level[i][j] == 0:
				continue
			
			total_bricks += 1
			var b = brick.instantiate() as Brick
			var x = j * brick_size.x + spawn_position.x
			var y = i * brick_size.y + spawn_position.y
			b.position = Vector2(x, y)
			add_child(b)
