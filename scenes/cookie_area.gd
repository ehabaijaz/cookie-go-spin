extends Area2D

var rotation_speed :float = TAU
signal cookie_clicked

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		cookie_clicked.emit()

func _process(delta: float) -> void:
	$Cookie.rotation += rotation_speed * delta
