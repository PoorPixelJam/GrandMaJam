extends Control
class_name Inventory
@onready var InventoryItems = []
@onready var grid:GridContainer = $MarginContainer/GridContainer
func _ready():
	for child in grid.get_children():
		print(child)
		InventoryItems.append(child)
	print(InventoryItems)

func add(item)->bool:
	if item is Item:
		for slot in InventoryItems:
			print(slot)
			if slot.get_child_count()>0:
				print("add Clot занят")
			else:
				print(slot)
				slot.add_child(item)
#				slot.add_child(test.instantiate())
				print("add added item")
				return true
		print("add For not")
		return false
	else: 
		print("add NOt item")
		return false
		

func have_item(name_item:String):
	for slot in InventoryItems:
		if slot.get_child_count()>0:
			if slot.get_child(0).NameItem ==name_item:
				return true

