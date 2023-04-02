extends CharacterBody2D

enum {
	MOVE,
	ATTACK
}
var state = MOVE
const ACCELERATION = 7
const MAX_SPEED = Vector2(50, 50)
const FRICTION = 7
var health = 9

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var quackHitbox = $Marker2D2/Hitbox
@onready var stats = $Stats
@onready var global_vars = get_node("/root/Global")
@onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true
	quackHitbox.knockback_vector = Vector2.ZERO

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		global_vars.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Waddle/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Waddle")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION)
		velocity = velocity.clamp(-MAX_SPEED, MAX_SPEED)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
		
	move_and_slide();
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		$QUACK.play()
	
func attack_state(delta):
	animationState.travel("Attack")

func attack_finished():
	state = MOVE

func _on_hurtbox_area_entered(area):
	stats.health -= 1
	if stats.health <= 0:
		queue_free()
	#death
