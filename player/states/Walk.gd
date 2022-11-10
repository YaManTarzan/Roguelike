extends 'State.gd'

export var walkSpeed = 150
export var jumpStrength = 150

func _ready():
	pass 
	
func physics_update(_delta: float):
		if player.is_on_floor():
			if Input.is_action_pressed("right"):
				player.velocity.x = -walkSpeed
			if Input.is_action_pressed("left"):
				player.velocity.x = walkSpeed
			player.velocity.y += player.gravity * _delta
			player.velocity = player.move_and_slide(player.velocity, Vector2.UP)
		if Input.is_action_pressed("up"):
			state_machine.transition_to('Air')
