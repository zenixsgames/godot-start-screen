extends Control


var player_name : String
var player_skin : Texture


@onready var skin_img: TextureRect = $Panel/Panel/skin_img
@onready var name_label: Label = $Panel/name_label
@onready var main_node = get_tree().get_first_node_in_group("main")


func _ready() -> void:
	name_label.text = player_name
	skin_img.texture = player_skin


func _on_play_btn_pressed() -> void:
	Global.current_player = player_name
	main_node.change_scene("select_world")


func _on_delete_btn_pressed() -> void:
	Global.delete_player_data(player_name)
	main_node.change_scene("select_player")


func _on_panel_gui_input(event: InputEvent) -> void:
	if event.is_action("click"):
		_on_play_btn_pressed()
