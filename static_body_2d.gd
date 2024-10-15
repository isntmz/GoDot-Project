extends StaticBody2D

var BORDER = Vector2(2304,1296)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _process(_delta):
	if Input.is_action_just_pressed("Exit"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)
	elif Input.is_action_just_pressed("Enter"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)





# Called every frame. 'delta' is the elapsed time since the previous frame.
