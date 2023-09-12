extends CharacterBody2D

@export var speed: int = 20
@export var limit: float = 0.5
@export var end_point: Marker2D

@onready var anim_sprite = $AnimatedSprite2D

const TILE_SIZE: int = 16

var start_pos: Vector2
var end_pos: Vector2


func _ready():
	start_pos = position
	end_pos = end_point.global_position


func _process(delta):
	update_velocity()
	update_animation()
	move_and_slide()


func update_velocity() -> void:
	var move_direction = end_pos - position
	if move_direction.length() < limit:
		change_direction()
	velocity = move_direction.normalized() * speed


func update_animation() -> void:
	var animation = "move_up"
	if velocity.y > 0:
		animation = "move_down"
	
	anim_sprite.play(animation)


func change_direction() -> void:
	var temp_end = end_pos
	end_pos = start_pos
	start_pos = temp_end
