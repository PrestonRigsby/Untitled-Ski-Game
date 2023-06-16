extends Control

@onready var main_scene = load("res://scenes/main.tscn")
@onready var quitpopup = $QuitConfirm

func _on_play_pressed():
	get_tree().change_scene_to_packed(main_scene)

func _on_quit_pressed():
	quitpopup.visible = true

func _on_quit_confirm_confirmed():
	get_tree().quit()
