class_name Bullet

extends Area2D

var speed = 450

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_body_entered(body):
	print_debug(body)
	if body.is_in_group("mobs"):
		body.queue_free()
		queue_free()
