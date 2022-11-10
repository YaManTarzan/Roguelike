extends 'State.gd'

func _ready():
	pass

func enter(_msg ={}):
	player.velocity = Vector2.ZERO
	
func physics_update(_delta: float):
	if player.is_on_floor():
		if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
			state_machine.transition_to('Walk')
		if Input.is_action_pressed("up"):
			state_machine.transition_to('Air')
	else:
		state_machine.transition_to('Air') 
		return
