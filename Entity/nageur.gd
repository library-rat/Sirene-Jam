extends RigidBody2D
var dead : bool = false
signal eaten()
signal blood(pos : Vector2) 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Sirene") and !dead:
		emit_signal("eaten") 
	dead = true
	emit_signal("blood", position)
	$"Sprite2D".visible = false
	$"Blood".visible = true
	$Timer.start(10)
	





func _on_timer_timeout():
	queue_free()
