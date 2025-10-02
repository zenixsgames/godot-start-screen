extends Control


var name_arr : Array = []
var skin_idx : int = 1
@onready var main_node = get_tree().get_first_node_in_group("main")
@onready var name_input: LineEdit = $Panel/Control/name_input
@onready var current_skin_label: Label = $Panel/Control/current_skin_label
@onready var skin_img: TextureRect = $Panel/Control/skin_img
@onready var next_btn: Button = $Panel/next_btn


func _ready() -> void:
	update()


func update():
	name_arr = Global.get_player_arr()
	skin_idx = 1
	name_input.text = "CLICK TO WRITE"
	current_skin_label.text = Global.skin.keys()[skin_idx]
	skin_img.texture = Global.skin[Global.skin.keys()[skin_idx]]
	next_btn.disabled = true


func _on_left_btn_pressed() -> void:
	skin_idx -= 1
	if skin_idx == -1:
		skin_idx = Global.skin.size() - 1
	current_skin_label.text = Global.skin.keys()[skin_idx]
	skin_img.texture = Global.skin[Global.skin.keys()[skin_idx]]


func _on_right_btn_pressed() -> void:
	skin_idx += 1
	if skin_idx == Global.skin.size():
		skin_idx = 0
	current_skin_label.text = Global.skin.keys()[skin_idx]
	skin_img.texture = Global.skin[Global.skin.keys()[skin_idx]]


func _on_name_input_editing_toggled(toggled_on: bool) -> void:
	if toggled_on:
		name_input.text = ""
	else:
		if name_input.text == "":
			name_input.text = "CLICK TO WRITE"


func _on_name_input_text_changed(new_text: String) -> void:
	if new_text not in name_arr and new_text != "":
		next_btn.disabled = false
	else:
		next_btn.disabled = true


func _on_next_btn_pressed() -> void:
	Global.save_player_data(
		name_input.text,
		current_skin_label.text,
		[
			{ "inventory_index": 0, "item_id": 23, "item_count": 1, "item_info": [] },
			{ "inventory_index": 1, "item_id": 11, "item_count": 1, "item_info": [] },
		],
		"0.1.0"
	)
	main_node.change_scene("select_player")


func _on_back_btn_pressed() -> void:
	main_node.change_scene("select_player")
