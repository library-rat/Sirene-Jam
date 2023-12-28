class_name Boat extends CharacterBody2D

var speed = Vector2(200,0);
var angular_speed = 0.4
var target = null
var initial_dir = 0

var nageur = preload("res://Entity/nageur.tscn")
	
	
	
func _physics_process(delta):

	if target != null and target.active:
		rotation = rotate_toward(rotation, position.angle_to_point(target.position), 3*angular_speed*delta)
	else :
		rotation = rotate_toward(rotation, initial_dir, angular_speed*delta)
	velocity = speed.rotated(rotation)
	
	var collider = move_and_collide(velocity*delta)
	if collider != null :
		$"..".add_nageur(nageur.instantiate(),position)
		queue_free()


func set_target(newt : CharacterBody2D):
	target = newt
