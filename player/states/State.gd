extends BaseState
var player : Player

func _ready():
	yield(owner, "ready")
	player = owner as Player
	assert(player != null)
