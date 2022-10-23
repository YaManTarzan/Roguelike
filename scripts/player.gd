extends KinematicBody2D
var vect = Vector2(0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed('d'):
		vect.x = 150
		$Player.set_flip_h(false)
		$AnimationPlayer.set_current_animation('walk')
	elif Input.is_action_pressed('a'):
		vect.x = -150
		$Player.set_flip_h(true)
		$AnimationPlayer.set_current_animation('walk')
	else:
		vect.x = 0
		$AnimationPlayer.set_current_animation('idle')
	move_and_slide(vect)
