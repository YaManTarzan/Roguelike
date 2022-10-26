extends Control

func _ready():
	
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("FadeOut")
	yield(get_tree().create_timer(1), "timeout")
	get_node("ColorRect").queue_free()
	music.play_music()
