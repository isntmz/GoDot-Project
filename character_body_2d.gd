extends CharacterBody2D

@onready var _animated_sprite = self.get_node("Player_Sprite")

func _process(_delta):
	global_position = global_position.clamp(Vector2.ZERO, BORDER)
	if Input.is_action_pressed("ui_accept"):
		_animated_sprite.play("Jumping")
		
	elif Input.is_action_pressed("ui_left"):
		_animated_sprite.flip_h = true
		if Input.is_action_pressed("Sprint"):
			_animated_sprite.play("Running")
		else:
			_animated_sprite.play("Walking")
		
	elif Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = false
		if Input.is_action_pressed("Sprint"):
			_animated_sprite.play("Running")
		else:
			_animated_sprite.play("Walking")
		
	else:
		_animated_sprite.play("Idle")
var player

var BORDER = Vector2(9208,1288)
var SPEED = 100.0
var JUMP_VELOCITY = -400.0

func _physics_process(delta):
	if Input.is_action_pressed("Sprint"):
		SPEED = 200.0
	else:
		SPEED = 100.0
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_just_pressed("ui_left"):
		_animated_sprite.flip_h = true
	if Input.is_action_just_pressed("ui_right"):
		_animated_sprite.flip_h = false
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _on_area_2d_area_entered(_area):
	is_on_floor()
