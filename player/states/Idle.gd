extends 'State.gd'

func enter(_msg ={}):
	player.velocity = Vector2.ZERO
	
func physics_update(_delta: float):
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
	if Input.is_action_just_pressed("up"):
		state_machine.transition_to("Air", {do_jump = true})
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.transition_to("Walk")
