extends Node2D


func _ready():
	
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("FadeIn")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://mainMenu/MainMenu.tscn")
