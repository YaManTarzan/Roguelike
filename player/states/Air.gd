extends 'State.gd'

export var walkSpeed = 150
export var jumpStrength = 150
#Euler's method:
# https://www.youtube.com/watch?v=_0mvWedqW7c
# https://www.youtube.com/watch?v=BIz-wEu0QwE

#Verlet Integration
# https://www.algorithm-archive.org/contents/verlet_integration/verlet_integration.html

# Purpose of this approach is to simply tweak certain parameters, to better adjust to the type of jump we want
# By integrating twice, f''(t) = g, you will get the position function is  1/2*g*t^2 + v0*t + p0
# Let t(h) be the time it took to reach max height of jump, Given that f'(t) = g*t +v0, which represents velocity,
# This would mean f'(t(h)) = 0, thus v0 = -g*t(h) which represents the initial velocity of the jump in y direction
# Substituting for f(t) with f(t(h)) and v0 in the position function, you will get g = (-2*h) / t(h)^2 
# You can now substitute g into the v0 equation and get v0 = 2*h / t(h)

# Equations so far, t(h) represents time to reach max height
# v0 = 2*h/t(h) in y direction
# g = (-2*h) / t(h)^2

# Now we need to define the horizontal movement in that x direction, the above only corresponds to the y direction component so far and how high the jump goes
# So now we introduce horizontal velocity and how it affects the distance of the jump,
# To get t(h) based on the velocity in the x direction, we can do t(h) = x(h) / v(x), utilizing the distance over time formula.
# We can substitute t(h) into the equations above which gets us equations of how high and far we can jump based on initial velocity and gravity now:
# v0 = 2*h*v(x)/t(h)
# g = (-2*h*v(x)^2) / x(h)^2

# We will be using velocity verlet integration over euler integration because euler integration(method) can become inaccurate if the time it took to change from one frame to the next is fairly large.
# Velocity verlet will: previous velocity + previous velocity + (gravity*timeStep) 

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
