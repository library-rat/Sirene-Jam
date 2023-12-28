extends Node2D

var score : int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func add_nageur(nageur,boat_position):
	add_child(nageur)
	nageur.connect("eaten",_on_nageur_eaten)
	nageur.position = boat_position
	
func _on_nageur_eaten():
	print("yum yum")

func _on_sirene_gameover():
	get_tree().paused = true
	$Panel.visible = true
