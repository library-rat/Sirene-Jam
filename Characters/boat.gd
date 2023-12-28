extends RigidBody2D


const SPEED = 200.0
var angular_force = 2500
var target = null

func _ready():
	linear_velocity = Vector2(200,0)
	
	
func _physics_process(delta):
	if target != null :
		var dir = transform.y.dot(position.direction_to(target.position))
		apply_torque(dir * angular_force)

func set_target(newt : CharacterBody2D):
	target = newt
