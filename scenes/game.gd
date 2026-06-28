extends Node2D
var spin_speed = TAU
# Note: due to inspector issues i had to manually add center pivot/spriet to this, it was annoying but hopefully next time i can do it without code
@onready var button1 = $CanvasLayer/ClickerUpgrade
@onready var button2 = $CanvasLayer/CookieUpgrade
@onready var button3 = $CanvasLayer/MenuButton
@onready var icon1 = $CanvasLayer/ClickerUpgrade/Cursorcookie
@onready var icon2 = $CanvasLayer/CookieUpgrade/uCookie
@onready var cookielabel = $CanvasLayer/CookieLabel
var my_cookie = load('res://cookiebyme.png')
var mouseithink = load('res://cookiemouseithink.png')
var angryexit = load("res://angryexit.png")
var angryexithover = load("res://scripts/angryexithover.png")
var double_cookies := false
var dead := false
func _ready() -> void:
	center_pivot(button1)
	center_pivot(button2)
	center_pivot(button3)
	center_pivot(cookielabel)
	center_sprite(icon1)
	center_sprite(icon2)
	
func _process(delta: float) -> void:
	if $CanvasLayer/CookieLabel.score >= 5000:
		get_tree().call_deferred('change_scene_to_file',"res://scenes/paradise.tscn")
	
	
		
	if Input.is_action_just_pressed("secret"):
		secret()
	if dead == false:
		rotations(delta)
	
	
func center_pivot(node: Control) -> void:
	node.pivot_offset = node.size / 2

func center_sprite(sprite: Sprite2D) -> void:
	sprite.centered = true
	sprite.position = sprite.get_parent().size / 2





func _on_menu_button_pressed() -> void:
	dead = true
	$CookieArea.dead = true
	$GPUParticles2D.amount = 1
	$CanvasLayer/CookieLabel.amount = -9999999
	$Scream.play()
	$AudioStreamPlayer.stop()
	$CanvasLayer/CookieLabel.rotation = 0
	await get_tree().create_timer(5.0).timeout
	get_tree().call_deferred('change_scene_to_file', "res://no_cookies.tscn")



func secret():
	$CookieArea/Cookie.texture = my_cookie
	$CookieArea/Cookie.scale = Vector2(5,5)
	$GPUParticles2D.texture = my_cookie
	if $GPUParticles2D.texture == my_cookie:
		$GPUParticles2D.amount = 1000
	%Mouse/MouseCookie.texture = mouseithink
	%Mouse.scale = Vector2(6,6)
	$CanvasLayer/ClickerUpgrade/Cursorcookie.texture = mouseithink
	$CanvasLayer/ClickerUpgrade/Cursorcookie.scale = Vector2(3,3)
	$CanvasLayer/CookieUpgrade/uCookie.texture = my_cookie
	$CanvasLayer/CookieUpgrade/uCookie.scale = Vector2(3,3)
	$CanvasLayer/MenuButton.texture_normal = angryexit
	$CanvasLayer/MenuButton.scale = Vector2(2,2)
	$CanvasLayer/MenuButton.texture_hover = angryexithover

func rotations(delta : float):
	button1.rotation += spin_speed * delta
	button2.rotation += spin_speed * delta
	button3.rotation += spin_speed * delta
	icon1.rotation += spin_speed * 0.1 * delta 
	icon2.rotation += spin_speed * 0.1 * delta 
	cookielabel.rotation += spin_speed * delta

func double_cookie():
	$CanvasLayer/CookieLabel.amount += 3
	$GPUParticles2D.amount += 1000
	print('yes')
	await get_tree().create_timer(5.0).timeout
	$CanvasLayer/CookieLabel.amount -= 2
	$GPUParticles2D.amount -= 1000
	



func _on_double_cookies_timeout() -> void:
	if randf() < 0.25 and not dead:
		double_cookie()
