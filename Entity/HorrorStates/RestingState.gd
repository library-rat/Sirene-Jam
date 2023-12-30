extends State

var actual_resting_point : Node2D
var resting_speed = 100
var resting_time = 20 
var random : RandomNumberGenerator
var waiting = false
# Called when the node enters the scene tree for the first time.
func onSetState():
	random = RandomNumberGenerator.new()
	actual_resting_point = hunter.resting_points[random.randi_range(0, hunter.resting_points.size()-1)]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func state_process(delta):
	var direction = hunter.position.direction_to(actual_resting_point.position)
	var distance = hunter.position.distance_to(actual_resting_point.position)
	if distance > 10 :
		hunter.velocity = direction *resting_speed 
	else :
		if not waiting :
			print("wait")
			waiting = true
			$"RestTimer".start(resting_time)
	if waiting :
		hunter.velocity = Vector2.ZERO
		
	


func _on_rest_timer_timeout():
	print("move")
	waiting = false
	if hunter.resting_points.size() >2 :
		var temp = hunter.resting_points[random.randi_range(0, hunter.resting_points.size()-1)]
		while temp == actual_resting_point :
			temp = hunter.resting_points[random.randi_range(0, hunter.resting_points.size()-1)]
		actual_resting_point = temp
		
