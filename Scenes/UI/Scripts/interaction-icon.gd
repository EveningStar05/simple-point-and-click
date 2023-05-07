extends StaticBody2D

onready var button = get_node("Icon/TextureButton")
onready var interaction_node = get_node("Interaction")
onready var tween = get_node("Tween")

var show_icon = false

export (String) var item_type = ""

func _ready():
	button.connect("pressed", self , "_on_button_pressed")
	interaction_node.connect("body_entered", self, "_on_body_entered")
	interaction_node.connect("body_exited", self, "_on_body_exited")
	
func _on_body_entered(body):
	$Icon.show()
	button.disabled = false
	play_tween(button, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 0.5)

func _on_body_exited(_body):
	button.disabled = true
	play_tween(button, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 0.2)
	
func play_tween(object, property, init_val, final_val, duration):
	tween.interpolate_property(object, property, init_val, final_val, duration, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	if tween.is_inside_tree():
		tween.start()
	
func _on_button_pressed():
	match item_type:
		"view": # signpost
			Global.emit_signal("start_dialog", get_name())
		"pickable":
			Inventory.add_item(self)
			queue_free()
