extends Control
onready var itemlist:ItemList = $CanvasLayer/ItemList
var my_dict:Dictionary = {
	"KNIFE": {
	"name": 'Knife',
	'picture': 'res://assets/items/knife.png'
	},
	"HELL_KNIFE": {
	"name": 'Hell Knife',
	'picture': 'res://assets/items/hell_knife.png'
	},
	"WOODEN_KNIFE": {
	"name": 'Wooden Knife',
	"discription": 'A knife made out of wood, not very effective...',
	'picture': 'res://assets/items/wooden_knife.png'
	}
}
func _ready():
	$CanvasLayer.visible = false #<---- I can't do this in editor, so I have to do it via code.
	additem('KNIFE')
	additem('WOODEN_KNIFE')
	additem('HELL_KNIFE')



func _process(_delta):
	if Input.is_action_just_pressed("inventory"):
		if $CanvasLayer.visible == false:
			$CanvasLayer.visible = true
		else:
			$CanvasLayer.visible = false


func _on_Button_pressed():
	if itemlist.get_selected_items().size() >= 1:
		itemlist.remove_item(itemlist.get_selected_items()[0])
	

func additem(id):
	if my_dict.has(id) == true:
		print(my_dict.get(id).name)
		itemlist.add_item(my_dict.get(id).name, load(my_dict.get(id).picture))
	
func _on_ItemList_item_selected(index):
	#print(itemlist.get_item_metadata(index))
	#$RichTextLabel.text = my_dict.get(index.name).discription
	pass
