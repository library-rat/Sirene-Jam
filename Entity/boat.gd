class_name Boat extends CharacterBody2D

var speed = Vector2(200,0);
var angular_speed = 0.4
var target = null
var initial_dir = 0
@onready var size = $"CollisionShape2D".shape.extents
var nageur = preload("res://Entity/nageur.tscn")
var random : RandomNumberGenerator


func _ready():
	random = RandomNumberGenerator.new()
	
func _physics_process(delta):

	if target != null and target.active:
		rotation = rotate_toward(rotation, position.angle_to_point(target.position), 3*angular_speed*delta)
	else :
		rotation = rotate_toward(rotation, initial_dir, angular_speed*delta)
	velocity = speed.rotated(rotation)
	
	var collider = move_and_collide(velocity*delta)
	if collider != null :
		for i in range(random.randi_range(1,12)):
			$"..".add_nageur(nageur.instantiate(),position,size)
		queue_free()


func set_target(newt : CharacterBody2D):
	target = newt
