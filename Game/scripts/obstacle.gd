extends Area2D

@onready var sprite = $AnimatedSprite2D

@onready var gruntsound = $Grunt

func _ready():
	position = Vector2(randi_range(8, 1152-8), 648 + 30)
	sprite.frame = randi_range(0, 5)
	
func _physics_process(delta):
	position.y -= 600 * delta
	
	if position.y <= -30:
		queue_free()

func _on_body_entered(body):
	gruntsound.play()
	body.queue_free()
	print("PLAYER IS DEAD")
	
func _on_area_entered(area):
	queue_free()
	print("obstacle relocated")
