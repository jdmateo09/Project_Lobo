extends CharacterBody3D

@export var speed = 4
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO
var animated_sprite_3D
var attack_hitbox  # Reference for the hitbox
var last_x_direction = 1  # Track the last movement direction on the x-axis


func _ready():
	# Reference the AnimatedSprite3D node
	animated_sprite_3D = $AnimatedSprite3D
	attack_hitbox = $AnimatedSprite3D/HitBox/SwordHitBox


func _physics_process(delta):
	var direction = Vector3.ZERO

	# Check input and update direction
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Handle vertical velocity
	if not is_on_floor():
		target_velocity.y -= fall_acceleration * delta
	else:
		target_velocity.y = 0  # Reset vertical velocity when on the floor

	# Apply movement
	velocity = target_velocity
	move_and_slide()

	# Animation handling
	if direction != Vector3.ZERO:
		if direction.x != 0:
			animated_sprite_3D.flip_h = direction.x > 0 # Face left if moving left, right if moving right
			last_x_direction = direction.x # Saves the last direction it was looking at
			animated_sprite_3D.play("walk")


		if direction.z != 0:
			animated_sprite_3D.flip_h = last_x_direction > 0
			animated_sprite_3D.play("walk")


			
		# Check for attack input
	elif Input.is_action_pressed("attack"):
		animated_sprite_3D.flip_h = last_x_direction < 0
		animated_sprite_3D.play("attack")
		
	else:
		animated_sprite_3D.flip_h = last_x_direction < 0
		animated_sprite_3D.play("idle")

#Creates active hitbox all the time
func attack_activated():
	attack_hitbox.disabled = false
		
	

	

	
		

		
		

	
