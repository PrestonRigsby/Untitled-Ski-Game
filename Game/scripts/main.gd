extends Node2D

@export var backgroundspeed = 600

@onready var background1 = $BackgroundTilemaps/Background1
@onready var background2 = $BackgroundTilemaps/Background2

@onready var hud = $HUD
@onready var timelabel = $HUD/Time

@onready var obstacle = load("res://scenes/obstacle.tscn")
@onready var obstacletimer = $ObstacleSpawner

@onready var obstacles = $Obstacles

@onready var gameoverscreen = $GameOverScreen
@onready var gameoverscoretext = $GameOverScreen/Score

@onready var skisound = $Ski
@onready var airwooshsound = $Airwoosh

@onready var timer = $Time

var gameover = false
var time = 0

func _ready():
	timelabel.text = str(time)
	gameoverscreen.visible = false
	timelabel.visible = true

func _process(delta):
	backgroundmovement(delta)
	
	if Input.is_action_just_released("move_left") or Input.is_action_just_released("move_right") and not gameover:
		airwooshsound.play()

func _on_obstacle_spawner_timeout():
	var instance = obstacle.instantiate()
	
	obstacles.add_child(instance)
	instance.connect("body_entered", _on_area_entered)

func backgroundmovement(delta):
	background1.position.y -= backgroundspeed * delta
	background2.position.y -= backgroundspeed * delta
	
	var newposition = 500
	
	if background1.position.y <= -675:
		background1.position.y = newposition
	if background2.position.y <= -675:
		background2.position.y = newposition
		
func _on_area_entered(body):
	gameoverscreen.visible = true
	timelabel.visible = false
	gameoverscoretext.text = "Score: " + str(time)
	timer.stop()
	skisound.stop()
	airwooshsound.stop()
	gameover = true
		
func _on_time_timeout():
	time += 1
	timelabel.text = str(time)
