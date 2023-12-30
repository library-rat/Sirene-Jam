extends Node2D

var score : int = 0
var random :RandomNumberGenerator
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	random = RandomNumberGenerator.new()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func add_nageur(nageur,boat_position,size):
	$SwimmerManager.add_child(nageur)
	nageur.connect("eaten",_on_nageur_eaten)
	nageur.connect("blood",_on_blood_appear)
	nageur.connect("blood_dissipated",_on_blood_desappear)
	
	var randomvect = Vector2(random.randf_range(-size.x, size.x),random.randf_range(-size.y, size.y))
	nageur.position = boat_position + randomvect
	
func _on_nageur_eaten():
	score += 1
	$Control/Score.text = "%d" % score

func _on_blood_appear(pos):
	
	$"Horror".add_attention_point(pos)

func _on_blood_desappear(pos):
	$"Horror".remove_attention_point(pos)

func _on_sirene_gameover():
	get_tree().paused = true
	$Panel.visible = true
