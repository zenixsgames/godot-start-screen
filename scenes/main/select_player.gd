extends Control


var name_arr : Array = []
var player_info = preload("uid://1oyanh88quf")
@onready var v_box_container: VBoxContainer = $Panel/ScrollContainer/VBoxContainer
@onready var main_node = get_tree().get_first_node_in_group("main")


func _ready() -> void:
	update()


func update():
	for child in v_box_container.get_children():
		v_box_container.remove_child(child)
		child.queue_free()
	name_arr = Global.get_player_arr()
	for i in name_arr:
		var data = Global.load_player_data(i)
		var new_player = player_info.instantiate()
		new_player.player_name = data["name"]
		new_player.player_skin = Global.skin[data["skin"]]
		v_box_container.add_child(new_player)


func _on_next_btn_pressed() -> void:
	main_node.change_scene("create_player")


func _on_back_btn_pressed() -> void:
	main_node.change_scene("title_screen")
