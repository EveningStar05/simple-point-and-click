extends Node

# JSON file structure:
#	{
#   "ITEM-NAME": {
#       "texture-path": "res://Inventory_Items/bucket.png",
#      "craftable-item": {
#          "item-name": "Light-Bulb",
#          "combine-item-result": "Magnifyer"
#       },
#   }
	
func load_data(file_path):
	var file = File.new()
	file.open(file_path, file.READ)
	var get_data = JSON.parse(file.get_as_text())
	file.close()
	
	return get_data.result
	
