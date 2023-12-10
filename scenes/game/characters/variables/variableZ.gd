class_name VariableZ
extends CharacterBody2D


@onready
var ray = $RayCast2D;
var GRID_SIZE = 64;
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT,
};

var slurp_sound = preload("res://assets/Pink Slime.mp3")

func _ready():
	$AnimatedSprite2D.play("default")

func play_sound():
	$AudioStreamPlayer2D.stream = slurp_sound
	$AudioStreamPlayer2D.play()

func move(dir):
	var vector_pos = inputs[dir] * GRID_SIZE
	ray.target_position = inputs[dir] * GRID_SIZE
	ray.force_raycast_update()
	if !ray.is_colliding():
#		play_sound()
		position += vector_pos
		return true
	return false
