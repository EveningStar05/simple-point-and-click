extends Control

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
