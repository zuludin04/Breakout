class_name Brick extends StaticBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation.play("idle")

func break_brick() -> void:
	animation.play("break")
	Signals.track_score.emit()
	animation.animation_finished.connect(func(_anim): call_deferred("free"))
