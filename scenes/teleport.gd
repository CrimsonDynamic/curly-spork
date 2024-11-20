extends Area2D
@onready var arraydoors = [$"../Area2D/Room1Door1/R1D1".global_position,$"../Area2D/Room1Door2/R1D2$Room1Door1/R1D1".global_position,$"../Room1/Room1Door3/R1D3".global_position]

func _on_body_entered(body: Node2D) -> void:
	print_debug("collided")
	if body.is_in_group("Player"):
		body.set_position(arraydoors.pick_random())
	pass # Replace with function body.
