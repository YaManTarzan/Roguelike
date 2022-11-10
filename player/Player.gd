extends KinematicBody2D
class_name Player
var velocity : Vector2 = Vector2(0,0)
var up : Vector2 = Vector2(0,-1)
var health : float = 100.0

export var walkSpeed = 150
export var jumpStrength = 150

var gravity = 400
