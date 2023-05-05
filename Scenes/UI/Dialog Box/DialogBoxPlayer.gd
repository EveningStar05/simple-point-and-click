extends Control

var dialog_text_data = ImportData.load_data("res://dialog-text.json") # load dialog data
onready var get_text = get_node("NinePatchRect/RichTextLabel")
onready var tween = get_node("NinePatchRect/Tween")
onready var dialog_index = 0

func _ready():
	tween.connect("tween_completed", self, "_on_tween_completed")
	
func set_dialog(item_name):
	var keys = dialog_text_data.keys()
	for item in keys:
		if item_name == item:
			if dialog_index < dialog_text_data[item_name]["text"].size():
				Global.dialog_start = true
				get_text.bbcode_text = dialog_text_data[item_name]["text"][dialog_index]
				get_text.percent_visible = 0
				dialog_index += 1
			else:
				dialog_index = 0
			play_tween()

func play_tween():
	tween.interpolate_property(
		get_text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _on_tween_completed(object, key):
	get_tree().paused = false
