extends Node2D
@onready var playernode = get_node("CharacterBody2D")
var music = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Boss_music.playing==false and music == true:
		$Boss_music.play()
	if Input.is_action_just_pressed("enter"):
		playernode.queue_free()
		music = false
		$Boss_music.stop()

	pass
