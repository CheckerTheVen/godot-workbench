extends Camera2D

@export var camera_speed := 150.0

var direction = Vector2.ZERO
var target_position := Vector2(800,290)

var pan_right = false
var pan_left = false
var pan_up = false
var pan_down = false

func _process(delta: float) -> void:
	get_camera_key_movement()
	direction = get_direction()
	
	if Input.is_action_just_pressed("debug_1"):
		move_to_position(Vector2(100,340))
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		target_position += direction * camera_speed * delta
	
	position = position.lerp(target_position, delta * 15.0)
	position = position.round()

func move_to_position(pos : Vector2):
	target_position = pos

func jump_to_position(pos : Vector2):
	# TODO - fix jump to position
	position = pos
	target_position = pos

func get_direction() -> Vector2:
	if pan_right:
		direction.x = 1
	elif pan_left:
		direction.x = -1
	else:
		direction.x = 0
		
	if pan_up:
		direction.y = -1
	elif pan_down:
		direction.y = 1
	else:
		direction.y = 0
		
	return direction

func get_camera_key_movement() -> void:
	if Input.is_action_pressed("camera_pan_right"):
		pan_right = true
	if Input.is_action_just_released("camera_pan_right"):
		pan_right = false	
	if Input.is_action_pressed("camera_pan_left"):
		pan_left = true
	if Input.is_action_just_released("camera_pan_left"):
		pan_left = false
	if Input.is_action_pressed("camera_pan_up"):
		pan_up = true
	if Input.is_action_just_released("camera_pan_up"):
		pan_up = false 
	if Input.is_action_pressed("camera_pan_down"):
		pan_down = true
	if Input.is_action_just_released("camera_pan_down"):
		pan_down = false

func _on_camera_border_right_mouse_entered() -> void:
	pan_right = true 

func _on_camera_border_right_mouse_exited() -> void:
	pan_right = false

func _on_camera_border_top_mouse_entered() -> void:
	pan_up = true

func _on_camera_border_top_mouse_exited() -> void:
	pan_up = false

func _on_camera_border_left_mouse_entered() -> void:
	pan_left = true

func _on_camera_border_left_mouse_exited() -> void:
	pan_left = false

func _on_camera_border_bottom_mouse_entered() -> void:
	pan_down = true

func _on_camera_border_bottom_mouse_exited() -> void:
	pan_down = false 
