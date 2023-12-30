extends CharacterBody2D

var current_state : State 
var target : Node2D
var resting_points : Array[Node]
var attention_points : Array[Node]

@onready var resting_state = $"RestingState"
@onready var hunting_state = $"HuntingState"
func _ready():
	
	resting_points = get_tree().get_nodes_in_group("RestingPoint")
	resting_state.setHunter(self)
	hunting_state.setHunter(self)
	
	current_state = resting_state
	current_state.onSetState()

func set_state(str :String):
	match str :
		"Hunting" :
			current_state = $"HuntingState"
		"Resting" :
			current_state = $"RestingState"

func _physics_process(delta):
	current_state.state_process(delta)
	var collider = move_and_collide(velocity*delta);
	if collider != null:

		if collider.get_collider().is_in_group("Sirene") :
			if not collider.get_collider().onland :
				collider.get_collider().game_over()

func _on_blood_detect_body_entered(body):
	pass # Replace with function body.

func _on_prey_detect_body_entered(body):
	if body.is_in_group("Sirene") :
		print("Detected")
		if current_state != hunting_state:
			target = body
			current_state = hunting_state

