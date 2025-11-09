extends Node2D

@onready var open: Label = $labels/open

var can_pass = false

func _ready() -> void:
	open.text = ""

func _process(delta: float) -> void:
	if can_pass:
		if Input.is_action_just_pressed("climb up"):
			TransitionLayer.change_scene("res://scenes/tent_to_open.tscn")


func _on_hight_tree_body_entered(body: Node2D) -> void:
	TransitionLayer.change_scene("res://scenes/tree_to_climb.tscn")


func _on_tent_body_entered(body: Node2D) -> void:
	open.text = "open with the up arrow"
	can_pass = true
