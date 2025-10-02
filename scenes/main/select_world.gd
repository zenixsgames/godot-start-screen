extends Control


var world_info = preload("uid://bb8glen1dqegx")
var name_arr : Array = []
@onready var v_box_container: VBoxContainer = $Panel/ScrollContainer/VBoxContainer
@onready var main_node = get_tree().get_first_node_in_group("main")


func _ready() -> void:
	update()


func update():
	for child in v_box_container.get_children():
		v_box_container.remove_child(child)
		child.queue_free()
	name_arr = Global.get_world_arr()
	for i in name_arr:
		var data = Global.load_world_data(i)
		var new_world = world_info.instantiate()
		new_world.world_name = data["name"]
		new_world.world_skin = Global.world_skin[data["mode"]]
		v_box_container.add_child(new_world)	


func _on_next_btn_pressed() -> void:
	main_node.change_scene("create_world")


func _on_back_btn_pressed() -> void:
	main_node.change_scene("select_player")
