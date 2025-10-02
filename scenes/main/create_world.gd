extends Control


var name_arr = []
var skin_idx : int = 0
var seed : int = 2147483647
@onready var main_node = get_tree().get_first_node_in_group("main")
@onready var name_input: LineEdit = $Panel/Control/name_input
@onready var current_mode_label: Label = $Panel/Control/current_mode_label
@onready var seed_input: LineEdit = $Panel/Control/seed_input
@onready var next_btn: Button = $Panel/next_btn


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()


func update():
	name_arr = Global.get_world_arr()
	skin_idx = 0
	seed = randi_range(-2147483648, 2147483647)
	seed_input.text = str(seed)
	name_input.text = "CLICK TO WRITE"
	current_mode_label.text = Global.world_skin.keys()[skin_idx]
	
	
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


func _on_left_btn_pressed() -> void:
	skin_idx -= 1
	if skin_idx == -1:
		skin_idx = Global.world_skin.size() - 1
	current_mode_label.text = Global.world_skin.keys()[skin_idx]


func _on_right_btn_pressed() -> void:
	skin_idx += 1
	if skin_idx == Global.world_skin.size():
		skin_idx = 0
	current_mode_label.text = Global.world_skin.keys()[skin_idx]


func _on_seed_input_text_changed(new_text: String) -> void:
	var num_text = ""
	for i in new_text:
		if i in "0123456789":
			num_text += i
		elif i == "-" and len(new_text) == 0:
			num_text += i
	seed_input.text = num_text
	seed_input.set("caret_column", len(num_text))


func _on_next_btn_pressed() -> void:
	Global.save_world_data(
		name_input.text, 
		Global.world_skin.keys()[skin_idx],
		[],
		"0.1.0",
	)
	main_node.change_scene("select_world")


func _on_back_btn_pressed() -> void:
	main_node.change_scene("select_world")
