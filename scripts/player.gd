extends KinematicBody2D
var vect = Vector2(0,0)
var up = Vector2(0,-1)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		
	if Input.is_action_pressed('d'):
		vect.x = 200
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.offset = Vector2(0,0)
		$AnimatedSprite.set_animation('walk')
	elif Input.is_action_pressed('a'):
		vect.x = -200
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.offset = Vector2(5,0)
		$AnimatedSprite.set_animation('walk')
	else:
		vect.x = 0
		$AnimatedSprite.set_animation('idle')
	if Input.is_action_pressed('w') and is_on_floor() == true:
		vect.y = -300
	elif is_on_floor() == false:
		vect.y += 10
		$AnimatedSprite.set_animation('jump')
		
	move_and_slide(vect, up)
	
