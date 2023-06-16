extends Panel

@onready var menu_scene = load("res://scenes/menu.tscn")

func _on_play_again_pressed():
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().change_scene_to_packed(menu_scene)
