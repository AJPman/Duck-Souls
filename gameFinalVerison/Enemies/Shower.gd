extends CharacterBody2D

enum {
	IDLE,
	WANDER,
	CHASE
}

@onready var _animated_sprite = $AnimatedSprite2D
@onready var stats = $Stats
@onready var playerDetection = $PlayerDetectionZone
@onready var global_vars = get_node("/root/Global")
var state = IDLE

func _ready():
	_animated_sprite.play("default")

func _physics_process(delta):
	match state:
		IDLE:
			idle_state(delta)
		WANDER:
			wander_state(delta)
	move_and_slide()

func idle_state(delta):
	velocity = velocity.move_toward(Vector2.ZERO, 100)
	seek_player()

func wander_state(delta):
	pass

func seek_player():
	if playerDetection.can_see_player():
		state = CHASE


func _on_stats_no_health():
	queue_free()


func _on_hurtbox_area_entered(area):
	stats.health -= 1
	velocity = global_vars.knockback_vector * 30
