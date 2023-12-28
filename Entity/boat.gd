class_name Boat extends RigidBody2D


const SPEED = 200.0
var angular_force = 2500
var target = null
var initial_dir = Vector2(1,0)

func _ready():
	linear_velocity = Vector2(200,0)
	
	
func _physics_process(delta):
	if target != null and target.active:
		var dir = transform.y.dot(position.direction_to(target.position))
		apply_torque(dir * angular_force)
	else :
		var dir = transform.y.dot(initial_dir)
		apply_torque(dir * angular_force)
		
func set_target(newt : CharacterBody2D):
	target = newt
