extends Node

onready var dialog_box = preload("res://Scenes/UI/Dialog Box/DialogBoxPlayer.tscn").instance()
onready var player = get_node("Player")
onready var canvas_layer = get_node("CanvasLayer")

func _ready():
	Global.connect("start_dialog", self, "_on_start_dialog")

func _on_start_dialog(item_name):
	canvas_layer.add_child(dialog_box) # set the dialog box as the child of canvas layer
	dialog_box.set_dialog(item_name) # pass the data to set_dialog function
	get_tree().paused = true # pause the tree, the dialog box pause mode is set to process.
	
func _process(_delta):
	# remove the dialog box when the player moves.
	if player.moving and dialog_box.is_inside_tree():
		canvas_layer.remove_child(dialog_box)
