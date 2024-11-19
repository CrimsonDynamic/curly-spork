extends CharacterBody2D

@export_group("Character Movement")
@export var SPEED = 300.0

@export var DASH_SPEED = 600.0
var dashing = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		if dashing:
			velocity.x = direction.x * DASH_SPEED
			velocity.y = direction.y * DASH_SPEED
		else:
			velocity.x = direction.x * SPEED
			velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	if $Timer.is_stopped() and dashing:
		dashing = false
		print_debug("stopped dashing")

	move_and_slide()

func _input(event):
	if event.is_action_pressed("dash"):
		print_debug("dashed")
		dashing = true
		$Timer.start()
