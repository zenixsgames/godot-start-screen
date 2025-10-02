extends Node


var savefile_path = "user://saves/"
var player_path = "user://saves/player/"
var world_path = "user://saves/world/"
var skin = {
	"dude": preload("uid://0uexilma0ilb"),
	"owlet": preload("uid://bwwjafjgpv8lf"),
	"pink": preload("uid://67wtytfywg3i"),
}
var world_skin = {
	"survival": preload("uid://33tdhj40awe"),
	"creative": preload("uid://cbedf30jhivqi"),
}
var current_player = ""
var current_world = ""


func get_player_arr():
	var name_arr : Array[String] = []
	if not DirAccess.dir_exists_absolute(Global.player_path):
		DirAccess.make_dir_recursive_absolute(Global.player_path)
	var dir: DirAccess = DirAccess.open(Global.player_path)
	if not dir == null:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".json"):
				name_arr.append(file_name.get_basename())
			file_name = dir.get_next()
	return name_arr
	
	
func get_world_arr():
	var name_arr : Array[String] = []
	if not DirAccess.dir_exists_absolute(Global.world_path):
		DirAccess.make_dir_recursive_absolute(Global.world_path)
	var dir: DirAccess = DirAccess.open(Global.world_path)
	if not dir == null:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not dir.current_is_dir() and file_name.ends_with(".json"):
				name_arr.append(file_name.get_basename())
			file_name = dir.get_next()
	return name_arr


func save_player_data(
	player_name,
	skin_name,
	inv_arr = [
		{ "inventory_index": 0, "item_id": 23, "item_count": 1, "item_info": [] },
		{ "inventory_index": 1, "item_id": 11, "item_count": 1, "item_info": [] },
	],
	version = "0.1.0",):
	var data = {
		"type": "player",
		"name": player_name,
		"skin": skin_name,
		"inventory": inv_arr,
		"version": version,
	}
	var file = FileAccess.open(Global.player_path + player_name + ".json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()


func save_world_data(
	world_name,
	mode = "survival",
	seed = 12345678,
	map_arr = [],
	version = "0.1.0",):
	var data = {
		"type": "world",
		"name": world_name,
		"mode": mode,
		"seed": seed,
		"map": map_arr,
		"version": version,
	}
	var file = FileAccess.open(Global.world_path + world_name + ".json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()


func load_player_data(player_name):
	var file = FileAccess.open(Global.player_path + player_name + ".json", FileAccess.READ)
	if file != null:
		var data = JSON.parse_string(file.get_as_text())
		file.close()
		if data.has("type") and data["type"] == "player":
			return data
		else:
			return null
	else:
		return null


func load_world_data(world_name):
	var file = FileAccess.open(Global.world_path + world_name + ".json", FileAccess.READ)
	if file != null:
		var data = JSON.parse_string(file.get_as_text())
		file.close()
		if data.has("type") and data["type"] == "world":
			return data
		else:
			return null
	else:
		return null


func delete_player_data(player_name):
	var path = Global.player_path + player_name + ".json"
	if FileAccess.file_exists(path):
		var dir = DirAccess.open("user://")
		dir.remove(path)


func delete_world_data(world_name):
	var path = Global.world_path + world_name + ".json"
	if FileAccess.file_exists(path):
		var dir = DirAccess.open("user://")
		dir.remove(path)
