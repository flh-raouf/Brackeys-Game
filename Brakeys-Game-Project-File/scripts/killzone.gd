extends Area2D

@onready var timer = $Timer
@onready var death_sfx = $DeathSFX

func _on_body_entered(body):
	Engine.time_scale = 0.5
	death_sfx.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
	Engine.time_scale = 1.0
