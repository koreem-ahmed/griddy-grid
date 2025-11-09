extends CanvasLayer

@onready var animate_pl: AnimationPlayer = $AnimationPlayer


func change_scene(target: String) -> void:
	animate_pl.play("dissolve")
	get_tree().change_scene_to_file(target)
	animate_pl.play_backwards("dissolve")
