extends KinematicBody2D
class_name Enemy

export var speed := 100.0

export var gravity : = 3000.0

export var jumpSpeed : float = 1200.0

export var direction: float = 1.0

var velocity : Vector2 = Vector2.ZERO

onready var stateMachine : StateMachine = $StateMachine
onready var animatedSprite : AnimatedSprite = $AnimatedSprite
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():
# 	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
