extends Node

onready var player = get_node("Player")
onready var canvas_layer = get_node("CanvasLayer")

var dialog_box = preload("res://Scenes/UI/Dialog Box/DialogBoxPlayer.tscn")
var inst_dialog

func _ready():
	Global.connect("start_dialog", self, "_on_start_dialog")

func _on_start_dialog(item_name):
	inst_dialog = dialog_box.instance()
	canvas_layer.add_child(inst_dialog) # set the dialog box as the child of canvas layer
	inst_dialog.set_dialog(item_name) # pass the data to set_dialog function
	get_tree().paused = true # pause the tree, the dialog box pause mode is set to process.

func _process(delta):
	# remove the dialog box when the player starts to move and tween animation finished playing.
	if is_instance_valid(inst_dialog):
		if player.moving and Global.dialog_finished:
			inst_dialog.queue_free()
