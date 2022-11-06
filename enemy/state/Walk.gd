extends 'State.gd'


func physics_update(delta: float) -> void:

  if enemy.direction == -1.0:
	  enemy.animatedSprite.flip_h = false
  else:
	  enemy.animatedSprite.flip_h = true
	
  if enemy.is_on_wall():
	  enemy.direction = enemy.direction * -1.0

  enemy.velocity.x = enemy.speed * enemy.direction
  enemy.velocity.y = enemy.gravity * delta
  enemy.velocity = enemy.move_and_slide(enemy.velocity, Vector2.UP)

