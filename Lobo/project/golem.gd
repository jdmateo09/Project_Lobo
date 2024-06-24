extends CharacterBody3D

@export var speed = 4
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO
var animated_sprite_3D


func _ready():
	# Reference the AnimatedSprite3D node
	animated_sprite_3D = $AnimatedSprite3D
	
			
func _physics_process(delta):
	animated_sprite_3D.play("idle")

func take_damage():
	animated_sprite_3D.play("hit")
		
	

	

	
		

		
		

	
