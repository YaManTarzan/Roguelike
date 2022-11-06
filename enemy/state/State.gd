extends BaseState

# We will want to access the fields of the current enemy type such as velocity and modify based on the current state
var enemy: Enemy

func _ready() -> void:
  # Once all nodes have been added in the scene tree, they receive the NOTIFICATION_READY notification and their respective _ready callbacks are triggered.
  # For groups of nodes, the _ready callback is called in reverse order, starting with the children and moving up to the parent nodes.

  #This means that when adding a node to the scene tree, the following order will be used for the callbacks:
  # _enter_tree of the parent, _enter_tree of the children, _ready of the children and finally _ready of the parent (recursively for the entire scene tree).

  # Since state nodes will extend EnemyState, and become children of the state machine we must wait for them to be ready, and define it here.

  yield(owner, "ready")

  # Type casts the owner (current node) to be Enemy Type
  # If the `owner` is not a `Enemy`, we'll get `null`.
  enemy = owner as Enemy

  # This check will tell us if we inadvertently assign a derived state script
  # in a scene other than `Enemy.tscn`, which would be unintended. This can
  # help prevent some bugs that are difficult to understand.
  assert(enemy != null)




  
