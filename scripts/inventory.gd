extends Control
onready var itemlist:ItemList = $CanvasLayer/ItemList
var items:Dictionary = {
	"Knife": {
		'picture': 'res://assets/items/knife.png',
		"description": 'A standard knife',
	},
	"Hell Knife": {
		'picture': 'res://assets/items/hell_knife.png',
		"description": 'The most powerful knife',
	},
	"Wooden Knife": {
		"description": 'A knife made out of wood, not very effective...',
		'picture': 'res://assets/items/wooden_knife.png',
	}
}
func _ready():
	$CanvasLayer.visible = false #<---- I can't do this in editor, so I have to do it via code.
	var count = 0
	while not count == 3:
		additem(items.keys()[count])
		count += 1



func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		if $CanvasLayer.visible == false:
			$CanvasLayer.visible = true
		else:
			$CanvasLayer.visible = false
			$CanvasLayer/ColorRect/RichTextLabel.text = 'Select an item'

func _on_Button_pressed():
	if itemlist.get_selected_items().size() >= 1:
		var selectedItems = itemlist.get_selected_items()
		itemlist.remove_item(selectedItems[0])
	

func additem(id):
	if items.has(id) == true:
		itemlist.add_item(id, load(items.get(id).picture))
	
func _on_ItemList_item_selected(index):
	$CanvasLayer/ColorRect/RichTextLabel.text = items.get(itemlist.get_item_text(index)).description
