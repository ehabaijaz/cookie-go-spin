extends Node2D
var spin_speed = TAU
@onready var button1 = $CanvasLayer/ClickerUpgrade
@onready var button2 = $CanvasLayer/CookieUpgrade
@onready var button3 = $CanvasLayer/MenuButton
@onready var icon1 = $CanvasLayer/ClickerUpgrade/Cursorcookie
@onready var icon2 = $CanvasLayer/CookieUpgrade/Cookie
@onready var cookielabel = $CanvasLayer/CookieLabel

func _ready() -> void:
	center_pivot(button1)
	center_pivot(button2)
	center_pivot(button3)
	center_pivot(cookielabel)
	center_sprite(icon1)
	center_sprite(icon2)

func center_pivot(node: Control) -> void:
	node.pivot_offset = node.size / 2

func center_sprite(sprite: Sprite2D) -> void:
	sprite.centered = true
	sprite.position = sprite.get_parent().size / 2


func _process(delta: float) -> void:
	button1.rotation += spin_speed * delta
	button2.rotation += spin_speed * delta
	button3.rotation += spin_speed * delta
	icon1.rotation += spin_speed * 0.1 * delta 
	icon2.rotation += spin_speed * 0.1 * delta 
	cookielabel.rotation += spin_speed * delta
	if $CanvasLayer/CookieLabel.score == 5000:
		get_tree().call_deferred('change_scene_to_file',"res://scenes/paradise.tscn")

func _on_menu_button_pressed() -> void:
	get_tree().quit()
