extends KinematicBody2D

#Player walk speed
export(int) var speed = 120
#Player Jump Speed
export(int) var jump_speed = -180
#Player Gravity
export(int) var gravity = 400

#Player Velocity
var velocity = Vector2(0,0)

#Player Friction
export(float,0,1,0) var friction = 0.2
#Player Acceleration
export(float,0,1,0) var acceleration = 0.25

#Player States
enum state{IDLE, RUNNING, ROLLING, FALL, JUMP}

#Player Starting State
var player_state = state.IDLE

func get_input():
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
func update_animation():
	#Flip sprite based on direction
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	match(player_state):
		#Player State Animations
		state.IDLE:
			$AnimatedSprite.play("Idle")
		state.RUNNING:
			$AnimatedSprite.play("Running")
			yield()
		state.FALL:
			$AnimatedSprite.play("Falling")
		state.ROLLING:
			$AnimatedSprite.play("Sliding")
		state.FALL:
			$AnimatedSprite.play("Falling")
	
func _physics_process(delta):
		get_input()
		print(velocity)
			
		if -29 <= velocity.x and velocity.x <= 29:
			velocity.x = 0
			player_state = state.IDLE
		elif velocity.x != 0 and Input.is_action_just_pressed("ui_down"):
			player_state = state.ROLLING
		elif velocity.x != 0:
			player_state = state.RUNNING
			
		if is_on_floor() and player_state != state.ROLLING:
			if Input.is_action_just_pressed("ui_up"):
				velocity.y = jump_speed
				player_state = state.JUMP
		if not is_on_floor():
			if velocity.y < 0:
				player_state = state.JUMP
			else:
				player_state = state.FALL
				
		velocity.y += gravity * delta
		velocity = move_and_slide(velocity, Vector2.UP)
		update_animation()
