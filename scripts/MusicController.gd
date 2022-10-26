extends Node

var music = load("res://assets/music.mp3")

func _ready():
	pass

func play_music():
	
	$Music.stream = music
	$Music.play(true)
