extends Node2D

func _ready() -> void:
	Global.soul.assign_heart_properties(SoulType.ORANGE)
	Global.soul.visually_rotate(180)

func _exit_tree() -> void:
	Global.soul.assign_heart_properties(SoulType.RED)
	Global.soul.visually_rotate(180)
	
	
