extends CharacterBody2D


const SPEED = 300.0
var swimming : bool = false;


func _physics_process(delta):
	# Add the gravity.
	if not swimming :
		$"Area2D/CollisionShape2D".set_debug_color(Color(1,0,0))
	else :
		$"Area2D/CollisionShape2D".set_debug_color(Color(0,0,1))

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	if direction :
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y,0, SPEED)
	move_and_slide()
	if (velocity == Vector2.ZERO):
		swimming = false;
		$Area2D.gravity_space_override = Area2D.SPACE_OVERRIDE_COMBINE
		
	else:
		swimming = true;
		$Area2D.gravity_space_override = Area2D.SPACE_OVERRIDE_DISABLED
	


func _on_area_2d_body_entered(body):
	if body != self :
		body.set_target(self)



func _on_area_2d_body_exited(body):
	body.set_target(null)
