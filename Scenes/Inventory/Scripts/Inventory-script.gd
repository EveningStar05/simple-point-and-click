extends Control

var inspect_item_window = preload("res://Scenes/Inventory/Item_Description/Item-description-base.tscn").instance()
var slot = preload("res://Scenes/Inventory/item-slot.tscn")

# Nodes
onready var main_node = get_parent() # World
onready var panel = get_node("Background")
onready var gridcontainter = get_node("Background/ScrollContainer/GridContainer")
onready var scroll_container = get_node("Background/ScrollContainer")
onready var next_button = get_node("Background/Next")
onready var prev_button = get_node("Background/Previous")
onready var slot_item = get_tree().get_nodes_in_group("slots")

func _ready():
	panel.hide()
	Inventory.connect("extend_slot", self, "_on_extend_slot")
	for slots in slot_item:
		slots.get_node("Item").connect("inspect_item", self, "_on_inspect_item")

func _on_extend_slot():
	var new_slot = slot.instance()
	gridcontainter.columns += 1
	gridcontainter.add_child(new_slot)
	
	new_slot.add_to_group("slots")
	new_slot.connect("inspect_item", self, "_on_inspect_item")
	
func _on_inspect_item(slot_index):
#	get the data from item-list.json file
	var get_item = Inventory.inventory_list[slot_index]
	var get_item_description = Inventory.item_data[get_item]["description"]
	var get_item_texture = Inventory.item_data[get_item]["texture-path"]
	
	add_child(inspect_item_window)
	get_tree().paused = true # set the panel Puse Mode to Process
	
	inspect_item_window.set_item_description(get_item, get_item_description, get_item_texture)
	
# Toggle button
func _on_ToggleButton_toggled(button_pressed)-> void:
	if button_pressed:
		panel.show()
	else:
		panel.hide()

# scroll button
# Note: Scrollbar is hidden.
func _on_Next_pressed() -> void:
	scroll_container.scroll_horizontal += 95
	
func _on_Previous_pressed() -> void:
	scroll_container.scroll_horizontal -= 95
