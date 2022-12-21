extends KinematicBody2D
class_name Player
var velocity
var health : float = 100.0

export var speed = 300
export var jumpHeight : float = 100
export var jumpTimeToPeak : float = 0
export var jumpTimeToDescent : float = 0 # time it takes to get to the bottom after jumping
onready var jumpGravity : float = -1.0 * ((-2.0 * jumpHeight) / (jumpTimeToPeak * jumpTimeToPeak))
onready var jumpVelocity : float = -1.0 * ((2.0 * jumpHeight) / jumpTimeToPeak)
onready var fallGravity : float = -1.0 * ((-2.0 * jumpHeight) / (jumpTimeToDescent * jumpTimeToDescent))


func getGravity() -> float:
  return jumpGravity if velocity.y < 0.0 else fallGravity
