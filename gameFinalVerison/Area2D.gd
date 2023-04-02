extends Area2D



var entered = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("enter"):
			get_tree().change_scene_to_file("res://hall.tscn")

func _on_body_entered(body):
	entered = true

func _on_body_exited(body):
	entered  = false
