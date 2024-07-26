extends Area2D

@onready var game_manager = %GameManager
@onready var score_label = %GameManager/Score_label
@onready var special_label = %GameManager/Special_label
@onready var you_survived_bold_label = %GameManager/you_survived_bold_label


func _on_body_entered(body):
	score_label.text = "You collected "+str(game_manager.score)+" coins out of 60."
	special_label.text = "Press 'R' to restart."
	you_survived_bold_label.text = "You survived!"
	body.stop_player_movement()
