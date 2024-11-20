class_name Bullet

extends Area2D
@export var DAMAGE = 5.0
var speed = 450

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_body_entered(body):
	print_debug(body)
	if body.is_in_group("mobs"):
		body.reduce_hp_by(DAMAGE)
		queue_free()
	
func setSpeed(speed: float):
	self.speed = speed
