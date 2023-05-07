extends Node

# signal for dialog box
signal start_dialog(item_name)
var dialog_finished = false
var dialog_index = 0

var dialog_data = {} # to keep in track of each item text index
