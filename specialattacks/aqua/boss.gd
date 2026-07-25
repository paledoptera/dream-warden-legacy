extends Node3D

@export var player: Node3D
@export var player_sprite: Sprite3D
@export var model: Node3D
var target_position: Vector3 = Vector3.ZERO
@export var rot_speed: float = 7.0

var attacks: Array = []
var attack_pool: Array = [0]

func _process(delta: float) -> void:
	var pos = model.global_position
	pos.y = model.global_position.y
	target_position = target_position.slerp(player_sprite.global_position,rot_speed*delta)
	model.look_at_from_position(model.global_position,target_position)
	model.rotate_y(deg_to_rad(180.0))


func _on_attack_timer_timeout() -> void:
	var attack = attack_pool.pick_random()
	var time: float = 3.0
	match attack:
		0: # lasers
			var target = player.current_circle.sprite
			instantiate_attack(preload("uid://dmlaifxf3g148"),target.global_position)
	
	$AttackTimer.start(time)


func instantiate_attack(scene: PackedScene, attack_position := Vector3.ZERO) -> void:
	var attack := scene.instantiate()
	
	get_parent().add_child(attack)
	attack.global_position = attack_position
	
	attacks.append(attack)
