extends Node2D

@onready var to_open: Area2D = $"to open"
@onready var chest: AnimatedSprite2D = $chest

var can_open = false
var player

func _ready() -> void:
	pass



func _process(delta: float) -> void:
	if can_open &&  Input.is_action_just_pressed("climb up"):
		chest.play("default")
		player.keys_t += 1

func _on_to_open_body_entered(body: Node2D) -> void:
	can_open = true
	player = body


func _on_chest_animation_finished() -> void:
	if chest.animation == "default":
		can_open = false
		chest.queue_free()
		to_open.queue_free()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	TransitionLayer.change_scene("res://scenes/level_1.tscn")
