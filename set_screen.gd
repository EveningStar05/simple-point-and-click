extends Node2D

onready var viewport = get_viewport()
onready var base_window = Vector2(get_viewport().get_visible_rect().size.x, get_viewport().get_visible_rect().size.y)

func _ready():
	viewport.connect("size_changed", self, "window_resize")
	
func window_size():
	var current_size = OS.get_screen_size()
	
	var scale_factor
	var new_size = Vector2(current_size.x * scale_factor, base_window.y)
	
	if new_size.x < base_window.x:
		scale_factor = base_window.x / current_size.x
		new_size = Vector2(base_window.x * scale_factor, base_window.y)
	if new_size.y < base_window.y:
		scale_factor = base_window.y / current_size.y
		new_size = Vector2(base_window.x * scale_factor, base_window.y)
		
	viewport.set_size_override(true, new_size)

