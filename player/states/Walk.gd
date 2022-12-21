extends 'State.gd'

func physics_update(_delta: float):
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return

	var input_direction_x: float = (
		Input.get_action_strength("right")
		- Input.get_action_strength("left")
	)
	player.velocity.x = player.speed * input_direction_x
	player.velocity.y += player.jumpGravity * _delta
	player.velocity = player.move_and_slide(player.velocity, Vector2.UP)

	if Input.is_action_just_pressed("up"):
		state_machine.transition_to("Air", {do_jump = true})
	elif is_equal_approx(input_direction_x, 0.0):
		state_machine.transition_to("Idle")

