extends State

var hunt_speed = 200

func onSetState():
	pass

func state_process(delta):
	if hunter.target == null :
		hunter.set_state("Resting")
	else :
		var direction = hunter.position.direction_to(hunter.target.position)
		hunter.rotation = direction.angle()
		hunter.velocity = direction*hunt_speed
		if hunter.target.is_in_group("Sirene"):
			if hunter.target.onland :
				hunter.target = null
	

