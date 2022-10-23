extends KinematicBody2D
var velocity:Vector2 = Vector2(0,0)
var up:Vector2 = Vector2(0,-1)
var Health : float = 100.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
		
	if Input.is_action_pressed("right"):
		velocity.x = 200
		$AnimatedSprite.set_flip_h(false)
		$AnimatedSprite.set_animation('walk')
	elif Input.is_action_pressed("left"):
		velocity.x = -200
		$AnimatedSprite.set_flip_h(true)
		$AnimatedSprite.set_animation('walk')
	else:
		velocity.x = 0
		$AnimatedSprite.set_animation('idle')
	if Input.is_action_pressed('up') and is_on_floor() == true:
		velocity.y = -300
	elif is_on_floor() == false:
		velocity.y += 10
		$AnimatedSprite.set_animation('jump')
		
	move_and_slide(velocity, up)
	
