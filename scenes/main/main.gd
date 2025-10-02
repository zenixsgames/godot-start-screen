extends Node


@onready var title_screen: Control = $title_screen
@onready var select_player: Control = $select_player
@onready var create_player: Control = $create_player
@onready var select_world: Control = $select_world
@onready var create_world: Control = $create_world


func _ready() -> void:
	change_scene("title_screen")


func change_scene(scene):
	title_screen.visible = false
	select_player.visible = false
	create_player.visible = false
	select_world.visible = false
	create_world.visible = false
	match scene:
		"title_screen":
			title_screen.update()
			title_screen.visible = true
		"select_player":
			select_player.update()
			select_player.visible = true
		"create_player":
			create_player.update()
			create_player.visible = true
		"select_world":
			select_world.update()
			select_world.visible = true
		"create_world":
			create_world.update()
			create_world.visible = true
