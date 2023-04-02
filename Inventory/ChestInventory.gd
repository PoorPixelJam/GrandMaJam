extends Control

@onready var InventoryItems = []
@onready var grid:GridContainer = %GridContainer
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
		
	
