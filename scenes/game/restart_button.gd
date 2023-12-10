extends TextureButton


func _on_pressed():
	# redraw whole screen scene of current level (don't change global level index)
	get_tree().change_scene_to_file("res://scenes/game/game_scene.tscn")