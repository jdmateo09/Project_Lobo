class_name HurtBox
extends Area3D

func _init():
	collision_layer = 0
	collision_mask = 2
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$Hitbox.area_entered.connect(Callable(self, "_on_area_entered")) #Call the function on area entered when a Hitbox interacts with the hurtbox

func _on_area_entered(hitbox: HitBox):
	if hitbox == null:
		return
	if owner.has_method("take_damage"): #The owner property allows the hurtbox to work with any node
		owner.take_damage(hitbox.damage)
	
