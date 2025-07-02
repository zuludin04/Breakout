class_name BrickFormation extends Node

var level_one = [
	[1, 0, 1, 0, 1, 0, 1, 0, 1, 0],
	[0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
]

var level_two = [
	[1, 0, 0, 0, 1, 1, 0, 0, 0, 1],
	[0, 1, 1, 1, 1, 1, 1, 1, 1, 0],
]

var level_three = [
	[1, 1, 1, 0, 1, 1, 0, 1, 1, 1],
	[1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
	[1, 1, 1, 0, 1, 1, 0, 1, 1, 1],
]

var game_levels = [level_one, level_two, level_three]

func generate_brick(level: int):
	return game_levels[level]
