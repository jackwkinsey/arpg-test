extends CharacterBody2D

@export var speed: int = 35
@onready var animation_player = $AnimationPlayer


func _process(_delta) -> void:
	handle_input()
	move_and_slide()
	update_animation()

func handle_input() -> void:
	var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = move_direction * speed

func update_animation() -> void:
	if velocity.length() == 0:
		animation_player.stop()
		return
	var direction = "down"
	if velocity.x < 0 and abs(velocity.x) > abs(velocity.y): direction = "left"
	elif velocity.x > 0 and abs(velocity.x) > abs(velocity.y): direction = "right"
	elif velocity.y < 0: direction = "up"
	
	animation_player.play("walk_" + direction)
