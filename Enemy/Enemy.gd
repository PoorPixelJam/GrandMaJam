extends CharacterBody2D

signal character_died

signal max_health_changed(value:int)
@export var	MAX_HEALTH:int =5:
	set(new_MAX_HEALTH):
		MAX_HEALTH=max(new_MAX_HEALTH,HEALTH)
		max_health_changed.emit(MAX_HEALTH)

signal health_changed(value:int)
@export var HEALTH:int = 5 :
	set(new_HEALTH):
		HEALTH=max(min(new_HEALTH,MAX_HEALTH),0)
		if(HEALTH <= 0):
			character_died.emit()
			die()
		else:health_changed.emit(HEALTH)

@onready var sprite:Sprite2D = $Sprite2D
@export var SPEED:float = 35.0
var Ускорение:float = 20
var Трение:float = 50
@onready var states = $EnemyStateManager
var BulletScene = preload("res://Bullet/bullet.tscn")
var can_attack:bool = true
func _ready():
	states.init(self)


func _physics_process(delta):
	states.physics_process(delta)

func _process(delta):
	pass
	
func take_damage(value:int):
	print("Damage",value)
	var tween = create_tween()
	tween.tween_property(self,"modulate",Color(1,0.5,0.44,1),0.07)
	tween.tween_property(self,"modulate",Color(1,1,1,1),0.07)
#	.from(HpBarBack.value)
	HEALTH-=value

func shoot(target):
	if(can_attack==true):
		can_attack=false
		get_tree().create_timer(randf_range(0.5,0.6),false).connect("timeout",_on_cooldown_timeout)
		var bullet_instance = BulletScene.instantiate()
		bullet_instance.get_child(2).collision_layer=4
		bullet_instance.position=self.global_position	
		bullet_instance.direction=global_position.direction_to(target.global_position)
		add_child(bullet_instance)
		
func _on_cooldown_timeout():
	can_attack=true
	
func die()->void:
	queue_free()

#@onready var animPlayer = $AnimationPlayer
#
#var can_attack:bool = true
#var AI = null
#var direction:Vector2 = Vector2.ZERO
#func _ready():
#	pass
#func _physics_process(delta):
#	move_and_slide()
#	match state:
#		ATTACK:
#			pass
#		PATROL:
#			_patrol()
#		MOVE:
#			pass
#		IDLE:
#			pass


#func _process(delta):
#	pass
#func take_damage(amount:int)->void:
#	animPlayer.play("hit")
#	print("Damage: ",amount)
#
#func chase(player):
#	if(player!=null):
#		direction=global_position.direction_to(player.global_position)
#	velocity=velocity.move_toward(direction*SPEED,Ускорение)

#func idle():
#		velocity=velocity.move_toward(Vector2.ZERO*Трение,Ускорение)


