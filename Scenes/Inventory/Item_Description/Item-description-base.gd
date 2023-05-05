extends Panel

onready var item_texture = get_node("PanelContainer/TextureRect")
onready var item_label = get_node("PanelContainer/TextureRect/Label")
onready var item_description = get_node("PanelContainer2/RichTextLabel")

func set_item_description(item_name, text, texture):
	item_label.text = item_name
	item_description.text = text[0]
	item_texture.texture = load(texture)
	
func _on_Close_pressed() -> void:
	get_tree().paused = false # unpause the tree
	get_parent().remove_child(self) # remove the inspect item window, I am using
#	I am using remove_child instead of queue_free because I'm going to re-adding
#	it everytime the player interacts (double click) with the inventory
