extends Control


@onready var main_node = get_tree().get_first_node_in_group("main")


func update():
	pass


func _on_play_btn_pressed() -> void:
	main_node.change_scene("select_player")
