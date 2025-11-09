extends CharacterBody2D

@onready var animate: AnimatedSprite2D = $AnimatedSprite2D
@onready var attacking_area: Area2D = $"attacking area"
@onready var attacking_shape: CollisionShape2D = $"attacking area/attacking shape"
@onready var keys: Label = $keys

var current_dir = "front"
var input = Vector2.ZERO
const speed = 200

var health = 100
const max_hel = 100
const min_hel = 0

var death = false
var is_attacking = false
var attack_animation

var keys_t = 0

func _physics_process(delta: float) -> void:
	if death:
		animate.play("die")
		return
	elif is_attacking:
		attack_animation = "attack_" + current_dir
		animate.play(attack_animation)
		attacking_shape.disabled = false
		return
	if Input.is_action_just_pressed("attack"):
		is_attacking = true
	player_move(delta)
	play_animation()
	keys.text = str(keys_t)
	if keys_t >= 1:
		TransitionLayer.change_scene("res://scenes/win.tscn")

func get_input():
	return Input.get_vector("left", "right", "up", "down")

func player_move(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		
		velocity = Vector2.ZERO
	else:
		
		velocity = input * speed
	
	if input != Vector2.ZERO:
		if abs(input.x) > abs(input.y):
			if input.x > 0:
				current_dir = "side"
				animate.flip_h = false
				attacking_shape.position = Vector2(12.0, -7.0)
			else:
				current_dir = "side"
				animate.flip_h = true
				attacking_shape.position = Vector2(-12.0, -7.0)
		else:
			if input.y > 0:
				current_dir = "front"
				attacking_shape.position = Vector2(0, 0)
			else:
				current_dir = "back"
				attacking_shape.position = Vector2(0, -14)
	
	move_and_slide()

func play_animation():
	var anim_name = ""
	
	if velocity.length() == 0:
		anim_name = "idle_" + current_dir
	else:
		anim_name = "walk_" + current_dir
	animate.play(anim_name)



func _on_animated_sprite_2d_animation_finished() -> void:
	if animate.animation == "die":
		TransitionLayer.reload_current_scene()
	if animate.animation == "attack_side" or "attack_down" or "attack_front":
		is_attacking = false
		attacking_shape.disabled = true


func _on_attacking_area_body_entered(body: Node2D) -> void:
	body.health -= 40
