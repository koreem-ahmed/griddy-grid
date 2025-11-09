extends CharacterBody2D

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D

var speed = 25
var chase = false
var player = null

var health = 100
const max_hel = 100
const min_hel = 0

var death = false

func _physics_process(delta: float) -> void:
	if death:
		animated.play("die")
		return
	
	if chase:
		position += (player.position - position)/ speed
	
		animated.play("walk")
		if (player.position.x < 0) :
			animated.flip_h = true
		else:
			animated.flip_h = false
	
func _on_detection_body_entered(body: Node2D) -> void:
	player = body
	chase = true
	animated.play("walk")


func _on_detection_body_exited(body: Node2D) -> void:
	player = null
	chase = false
	animated.play("idle")


func _on_attack_body_entered(body: Node2D) -> void:
	body.health -= 10


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated.animation == "die":
		queue_free()
