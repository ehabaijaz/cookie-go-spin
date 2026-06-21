extends Sprite2D

var rotation_speed : float = TAU

func _process(delta: float) -> void:
	rotation += rotation_speed * delta
