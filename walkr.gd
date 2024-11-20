extends CharacterBody2D

@onready var player : CharacterBody2D

@export var SPEED = 5.0
@export var DAMAGE = 10.0
@export var HP = 10.0

func _ready():
	player = get_node("/root/Tower_1/Player")

func _physics_process(delta):
	position = position.move_toward(player.position, SPEED*delta)
	#move_and_slide()

func reduce_hp_by(damage: float):
	HP -= damage
	if(HP <= 0):
		queue_free()
