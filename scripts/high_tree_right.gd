extends Node2D



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("climb down"):
		TransitionLayer.change_scene("res://scenes/tree_to_climb.tscn")
	if Input.is_action_just_pressed("look left"):
		TransitionLayer.change_scene("res://scenes/high_tree.tscn")
