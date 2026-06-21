extends Label
var COOKIESPRITE = preload("res://cursor.tscn")
var score := 0
var amount := 1
var price := 15
var clicker_price := 100
@onready var mark_pos = $"/root/Game/Markers".get_children()
@onready var clickers = $"/root/Game/Clickers"
func _ready():
	text = "Score: 0"

func _on_cookie_area_cookie_clicked() -> void:
	print('clicked')
	score += amount
	text = "Cookies: " + str(score)


func _on_cookie_upgrade_pressed() -> void:
	if score >= price:
		score -= price
		amount *= 2
		price *= 2
		$"../CookieUpgrade/CookiePrice".text = str(price)
		text = 'Cookies: ' + str(score)
		$"../../Powerup".play()
	else:
		$"../../Error".play()


func _on_clicker_upgrade_pressed() -> void:
	if score >= clicker_price:
		var cookie_sprite = COOKIESPRITE.instantiate()
		clickers.add_child(cookie_sprite)
		cookie_sprite.position = mark_pos.pick_random().global_position
		clicker_price *= 2
		$"../ClickerUpgrade/CookiePrice2".text = str(clicker_price)
		text = "Cookies: " + str(score)
		$"../../Powerup".play()
	else:
		$"../../Error".play()
		
		

func _on_timer_timeout() -> void:
	if clickers != null:
		var current_clickers = clickers.get_child_count()
		score += current_clickers * 10
		text = 'Cookies: ' + str(score)
		
