extends InteractItem
@onready var ChestInventory:Control 
@onready var ChestCanvas:CanvasLayer = $CanvasLayer
var is_open:bool = false:
	set(value):
		is_open = value
		if value == false:
			ChestCanvas.hide()
			ChestInventory.hide()
		else:
			ChestCanvas.show()
			ChestInventory.show()
			
func _ready():
	pass
	ChestInventory=ChestCanvas.get_child(0)
	ChestInventory.hide()
