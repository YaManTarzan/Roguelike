extends KinematicBody2D
var health : float = 100.0

export (int) var walkSpeed = 120
export (int) var jumpStrength = -180
var velocity = Vector2.ZERO
export(float,0,1,0) var friction = 1
export(float,0,1,0) var acceleration = 0.25

var timeToJumpApex = .85
enum state{RUNNING,FALLING,ROLLING,IDLE,JUMPING}
var player_state = state.IDLE

export (int) var noMathGravity = 400
#var GRAVITY


#func _ready():
	#GRAVITY = (2 * jumpStrength)/ pow(timeToJumpApex,2)
	#jumpStrength = abs(GRAVITY) * timeToJumpApex

func get_input():
	var dir = Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * walkSpeed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)

func update_animation():
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	match(player_state):
		state.IDLE:
			$AnimatedSprite.play("idle")
		state.RUNNING:
			$AnimatedSprite.play("running")
		state.ROLLING:
			$AnimatedSprite.play("rolling")
		state.FALLING:
			$AnimatedSprite.play("falling")
		state.JUMPING:
			$AnimatedSprite.play("jumping")

func _physics_process(delta):
	if player_state != state.RUNNING and player_state != state.ROLLING:
		get_input()
		
		print(velocity)
		
		if -20 <= velocity.x and velocity.x <= 20:
			velocity.x = 0
			player_state = state.IDLE
		elif velocity.x != 0 and Input.is_action_just_pressed("down"):
			player_state = state.ROLLING
		elif velocity.x != 0:
			player_state = state.RUNNING
			
		if is_on_floor() and player_state != state.ROLLING:
			if Input.is_action_just_pressed("up"):
				velocity.y = jumpStrength
				player_state = state.JUMPING
				
	if not is_on_floor():
		if velocity.y < 0:
			player_state = state.JUMPING
		else:
			player_state = state.FALLING
			
	velocity.y += noMathGravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	update_animation()
