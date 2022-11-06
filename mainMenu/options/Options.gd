extends Button

export(Color,RGB) var mouse_entered
export(Color,RGB) var mouse_exited

func _on_Options_mouse_entered():
	set_modulate(mouse_entered)


func _on_Options_mouse_exited():
	set_modulate(mouse_exited)


func _on_Options_pressed():
	.get_tree().change_scene("res://mainMenu/options/Options.tscn")

