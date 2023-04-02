extends InteractItem
@onready var ChestInventory:CanvasLayer = $CanvasLayer
var is_open:bool = false:
	set(value):
		is_open = value
		if value == false:
			ChestInventory.get_child(0).hide()
			ChestInventory.hide()
		else:
			ChestInventory.get_child(0).show()
			ChestInventory.show()
			
func _ready():
	ChestInventory.hide()
