extends InteractItem
@onready var ChestInventory:Control = %Inventory
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
	ChestInventory.hide()
