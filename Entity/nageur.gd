extends RigidBody2D

signal eaten()
# Called when the node enters the scene tree for the first time.
func _ready():
	print("hello")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Sirene") :
		emit_signal("eaten") 
		queue_free()
