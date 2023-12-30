extends CharacterBody2D

var current_state : State 
var target : Node2D
var resting_points : Array[Node]
var attention_points : Array[Vector2]
var hunting_radius = 175

@onready var resting_state = $"RestingState"
@onready var hunting_state = $"HuntingState"
@onready var searching_state = $SearchingState
func _ready():
	$Prey_detect/CollisionShape2D.shape.radius = hunting_radius
	resting_points = get_tree().get_nodes_in_group("RestingPoint")
	resting_state.setHunter(self)
	hunting_state.setHunter(self)
	searching_state.setHunter(self)
	current_state = resting_state
	current_state.onSetState()

func set_state(str :String):
	match str :
		"Hunting" :
			if current_state == resting_state :
				resting_state.waiting = false
			current_state = hunting_state
		"Resting" :
			current_state = resting_state
		
		"Searching":
			searching_state.onSetState()
			current_state = searching_state
			


func _physics_process(delta):
	current_state.state_process(delta)
	var collider = move_and_collide(velocity*delta);
	if collider != null:

		if collider.get_collider().is_in_group("Sirene") :
			if not collider.get_collider().onland :
				collider.get_collider().game_over()


func _on_prey_detect_body_entered(body):
	if body.is_in_group("Sirene") :
		print("Detected")
		if current_state != hunting_state:
			target = body
			set_state("Hunting")

func add_attention_point(pos) :
	attention_points.append(pos)
	if attention_points.size() > 10 and current_state != searching_state :
		set_state("Searching")


func remove_attention_point(pos) :
	attention_points.erase(pos)
	print(attention_points)
