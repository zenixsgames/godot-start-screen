extends Control


var world_name : String
var world_skin : Texture
@onready var world_img: TextureRect = $Panel/world_img
@onready var world_name_label: Label = $Panel/world_name_label
@onready var main_node = get_tree().get_first_node_in_group("main")


func _ready() -> void:
	world_name_label.text = world_name
	world_img.texture = world_skin


func _on_play_btn_pressed() -> void:
	Global.current_world = world_name
	main_node.change_scene("select_world")
	print("TODO: Update world_info.gd")
	print("Player: ", Global.current_player)
	print("World: ", Global.current_world)


func _on_delete_btn_pressed() -> void:
	Global.delete_world_data(world_name)
	main_node.change_scene("select_world")


func _on_panel_gui_input(event: InputEvent) -> void:
	if event.is_action("click"):
		_on_play_btn_pressed()
