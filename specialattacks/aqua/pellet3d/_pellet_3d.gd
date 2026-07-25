extends Area3D
class_name Pellet3D

@export var damage := 1
## The amount of TP gained by grazing
@export var graze_points := 5
##Whether the pellet gets destroyed if it collides
@export var destructible: bool = false
##If the pellet can hit you even if you have i-frames
@export var ignore_iframes: bool = false
var grazed := false
func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area3D) -> void:
	if area is AquaPlayer:
		print("PLAYER HIT")
		area.hurt(damage,ignore_iframes)
		if destructible:
			destroy()

func destroy() -> void:
	queue_free()
