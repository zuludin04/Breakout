extends CanvasLayer

@onready var score: Label = $GameInfo/Score
@onready var lives: Label = $GameInfo/Lives
@onready var state_message: Label = $GameState/StateMessage

var current_score: int = 0
var total_lives: int = 3
var game_started: bool = false

func _init() -> void:
	Signals.track_score.connect(_on_track_score)
	Signals.ball_out.connect(_on_ball_out)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		if not game_started:
			game_started = true
			$GameState.visible = false
			Signals.game_start.emit()

func _on_track_score() -> void:
	current_score += 1
	score.text = str(current_score)

func _on_ball_out() -> void:
	total_lives -= 1
	lives.text = "Lives : " + str(total_lives)
	game_started = false
	if total_lives == 0:
		get_tree().reload_current_scene()
