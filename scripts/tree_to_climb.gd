extends Node2D

var can_climp = false

func _ready() -> void:
	can_climp = false 


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("climb up") and can_climp:
		TransitionLayer.change_scene("res://scenes/high_tree.tscn")
	
	
func _on_back_body_entered(body: Node2D) -> void:
	TransitionLayer.change_scene("res://scenes/level_1.tscn")


func _on_climb_body_entered(body: Node2D) -> void:
	can_climp = true



func _on_climb_body_exited(body: Node2D) -> void:
	can_climp = false
