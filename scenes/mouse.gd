extends Node2D

@onready var cookie_sprite: Sprite2D = $MouseCookie 

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _physics_process(delta: float) -> void:
	global_position = lerp(global_position, get_global_mouse_position(), 16.5 * delta)
	
	var desired_rotation : float = -12.5 if Input.is_action_pressed('click') else 0.0
	rotation_degrees = lerp(rotation_degrees, desired_rotation, 16.5 * delta)
	
	var desired_scale : Vector2 = Vector2(0.35, 0.35) if Input.is_action_just_pressed('click') else Vector2(0.4, 0.4)
	cookie_sprite.scale = lerp(cookie_sprite.scale, desired_scale, 16.5 * delta)
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		$AudioStreamPlayer2D.play()
