extends Control
onready var itemlist:ItemList = $CanvasLayer/ItemList
var my_dict:Dictionary = {
	"IP1": {
	"name": 'Sunkist',
	'picture': 'res://assets/items/ItemPlaceholder1.png'
	},
	"IP2": {
	"name": 'Man',
	'picture': 'res://assets/items/ItemPlaceholder2.png'
	},
	"IP3": {
	"name": 'Squid',
	'picture': 'res://assets/items/ItemPlaceholder3.png'
	}
}
func _ready():
	$CanvasLayer.visible = false #<---- I can't do this in editor, so I have to do it via code.
	additem('IP1')
	additem('IP2')
	additem('IP3')



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
	
		
