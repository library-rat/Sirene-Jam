extends State

var hunt_speed = 400

func onSetState():
	$"..".set_Sprite("Hunting")

func state_process(delta):
	if hunter.target == null :
		hunter
	

