extends CharacterBody2D

@onready var player : CharacterBody2D

@export var SPEED = 25.0
@export var DAMAGE = 1.0

func _ready():
	player = get_node("/root/Main/Player")

func _physics_process(delta):
	position = position.move_toward(player.position, SPEED*delta)
	#move_and_slide()
