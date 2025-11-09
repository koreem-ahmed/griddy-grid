extends Node2D

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var timer: Timer = $Timer

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "5467":
		label_2.text = "correct password"
		timer.start()
	else:
		label.text = "Wrong password"


func _on_timer_timeout() -> void:
	TransitionLayer.change_scene("res://scenes/inside_tent.tscn")
