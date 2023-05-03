extends Node

onready var dialog_box = preload("res://Scenes/UI/Dialog Box/DialogBoxPlayer.tscn").instance()
onready var player = get_node("Player")
onready var canvas_layer = get_node("CanvasLayer")

var start_dialog = false

func _ready():
	Global.connect("start_dialog", self, "_on_start_dialog")
	
			
func _on_start_dialog(item_name):
	canvas_layer.add_child(dialog_box)
	dialog_box.set_dialog(item_name)
	
func _process(delta):
#	TODO:
#		If the dialog starts, pause the player.
#		until the tween animation finished playing then player can move again
#		and remove the dialog box.
	if player.moving and is_instance_valid(dialog_box):
		if dialog_box.is_inside_tree():
			canvas_layer.remove_child(dialog_box)
#	dialog_start()
			
#func dialog_start():
#	if Global.dialog_start:
#		player.set_physics_process(true)
#	else:
#		player.set_physics_process(false)
#		if player.moving and is_instance_valid(dialog_box):
#			if dialog_box.is_inside_tree():
#				canvas_layer.remove_child(dialog_box)
