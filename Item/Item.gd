extends Control
class_name Item
@export var ID:int =2
@export var NameItem:String="Key"
@export var Icon:Texture=preload("res://icon.svg")
const BUTTON_LEFT=1

func _ready():
	get_child(0).texture=Icon

func use_effect():
	pass

func transport_item():
	match get_where_item(self):
		"MainInventory":
			if MainInventory.Chest.add(self.duplicate()):
				self.queue_free()
			else: print("Ошибка добавления")
		"Chest":
			if MainInventory.Inventory.add(self.duplicate()):
				self.queue_free()
			else: print("Ошибка добавления")
func _use(event):
	if event.is_pressed() and event.button_index==BUTTON_LEFT:
		if MainInventory.Chest !=null:
			transport_item()
		else:
			use_effect()





func get_where_item(item)->String:
	for slot in MainInventory.Inventory.InventoryItems:
		if slot.get_child_count()>0:
			if slot.get_child(0)==self:
				print("Предмет у игрока добовляю в сундук"  )
				return "MainInventory"
	print("Предмет в сундуке добовляю в инвентарь"  )
	return "Chest"
