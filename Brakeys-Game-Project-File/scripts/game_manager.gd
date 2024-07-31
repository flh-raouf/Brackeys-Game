extends Node

var score = 0

@onready var score_label = $"Score_label"
@onready var special_label = $"Special_label"

func add_point():
	score+=1
