extends Node2D
var random :RandomNumberGenerator

@onready var boat = preload("res://Entity/boat.tscn")

func _ready():
	random = RandomNumberGenerator.new()
	$SpawnTimer.one_shot = true
	$SpawnTimer.start(random.randf_range(3,6))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawn_timer_timeout():
	$SpawnTimer.start(random.randf_range(3,6))
	var instance = boat.instantiate()
	instance.position = position
	instance.initial_dir = 0
	instance.rotation = 0
	$"..".add_child(instance)

