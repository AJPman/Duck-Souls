extends Node2D

@onready var bread = get_node("TileMap/bread")
@onready var library_card = get_node("TileMap/Library_card")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $soundtrack.playing==false:
		$soundtrack.play()
	pass


func _on_bread_body_entered(body):
	bread.queue_free()
	pass # Replace with function body.


func _on_library_card_body_entered(body):
	library_card.queue_free()
	pass # Replace with function body.
