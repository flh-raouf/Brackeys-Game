extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite = $AnimatedSprite2D
@onready var jump_sfx = $JumpSFX

# Variable to control if the player can move
var can_move = true

func _physics_process(delta):
	if can_move:
		# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			jump_sfx.play()
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("move_left", "move_right")

		# Flipping player according to the direction
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true

		# Player animation
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("IDLE")
			else:
				animated_sprite.play("RUN")
		else:
			animated_sprite.play("JUMP")

		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()

	# Restart the game.
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func stop_player_movement():
	animated_sprite.play("IDLE")
	can_move = false
	
