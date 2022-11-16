extends 'State.gd'

export var walkSpeed = 150
export var jumpStrength = 150

func enter(msg:={}):
	if msg.has("do_jump"):
		player.velocity.y = -1200
	
func physics_update(_delta: float):
	if Input.is_action_pressed("right"):
		player.velocity.x = walkSpeed * 2
	elif Input.is_action_pressed("left"):
		player.velocity.x = -walkSpeed * 2
	player.velocity.y += player.gravity * _delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x,0.0):
			state_machine.transition_to('Idle')
			
		else:
			state_machine.transition_to('Walk')
