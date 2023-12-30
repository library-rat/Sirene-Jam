extends State

var searching_speed = 100
var random : RandomNumberGenerator
var actual_target : Vector2


func _ready():
	random = RandomNumberGenerator.new()

func onSetState():
	actual_target = hunter.attention_points[random.randi_range(0, hunter.attention_points.size()-1)]
	$Timer.start(30)
	
func state_process(delta):
	var direction = hunter.position.direction_to(actual_target)
	var distance = hunter.position.distance_to(actual_target)
	if distance < 10 :
		hunter.attention_points.erase(actual_target)
		if hunter.attention_points.size() <10 :
			var sirene = get_tree().get_nodes_in_group("Sirene")[0]
			if (sirene.position.distance_to(hunter.position) < hunter.hunting_radius ):
				hunter.target = sirene
				hunter.set_state("Hunting")
			else :
				hunter.set_state("Resting") 
		actual_target = hunter.attention_points[random.randi_range(0, hunter.attention_points.size()-1)]
	else :
		hunter.velocity = direction*searching_speed


func _on_timer_timeout():
	hunter.set_state("Resting")
