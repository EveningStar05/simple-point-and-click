extends Control

onready var get_text = get_node("NinePatchRect/RichTextLabel")
onready var tween = get_node("NinePatchRect/Tween")

var dialog_text_data = ImportData.load_data("res://dialog-text.json") # load dialog data

func _ready():
	tween.connect("tween_completed", self, "_on_tween_completed")
	
func set_dialog(item_name):
	if !Global.dialog_data.has(item_name):
#		if item_nae does not exist within dialog_data (key),
#		then create a new key with "index" as key and set its value as 0
		Global.dialog_data[item_name] = {"index": 0}
	
	# reset the dialog index
	if Global.dialog_data[item_name]["index"] == dialog_text_data[item_name]["text"].size():
		Global.dialog_data[item_name]["index"] = 0 
	
	if Global.dialog_data[item_name]["index"] < dialog_text_data[item_name]["text"].size():
		Global.dialog_finished = false
		get_text.bbcode_text = dialog_text_data[item_name]["text"][Global.dialog_data[item_name]["index"]]
		get_text.percent_visible = 0
		
	Global.dialog_data[item_name]["index"] += 1
	play_tween()

func play_tween():
	tween.interpolate_property(
		get_text, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func _on_tween_completed(_object, _key):
	get_tree().paused = false # unpause the tree
	Global.dialog_finished = true # mark dialog as finished
