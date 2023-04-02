extends Area2D

var entered = false
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"




func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("enter"):
			DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
			$hello.play()
			$Mk_theme.play()
			

func _on_body_entered(body):
	entered = true

func _on_body_exited(body):
	entered  = false


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	entered = true
