extends KinematicBody2D
var velocity : Vector2 = Vector2(0,0)
var up : Vector2 = Vector2(0,-1)
var health : float = 100.0


func _physics_process(_delta):
		
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
	
