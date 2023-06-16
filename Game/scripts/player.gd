extends CharacterBody2D

@export var vertical_speed = 30000
@export var horizontal_speed = 20000

func _physics_process(delta):
	velocity.x = Input.get_axis("move_left", "move_right") * delta * vertical_speed
	velocity.y = Input.get_axis("slow_down", "speed_up") * delta * horizontal_speed

	move_and_slide()
