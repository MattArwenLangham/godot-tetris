extends Node2D

@onready var is_active = false
@onready var reached_bottom = false
@onready var xpos = 500
@onready var ypos = 0
@onready var one_movement = 32

func _ready():
	is_active = true
	_update_position()
	Messenger.TETRISBEHAVIOUR_FALL.connect(move_down)

func _input(event):
	if event is InputEventKey and event.pressed and is_active :
	#Keys are Left, Right, Down, Drop and Rotate
		if Input.is_action_pressed("Left"):
			move_left()
		elif Input.is_action_pressed("Right"):
			move_right()
		elif Input.is_action_pressed("Down"):
			move_down()
		elif Input.is_action_pressed("Drop"):
			drop_block()
		elif Input.is_action_pressed("Rotate"):
			rotate_block()

func move_left():
	if xpos - one_movement >= Main.xbound_left:
		xpos -= one_movement
		_update_position()

func move_right():
	if xpos + one_movement <= Main.xbound_right:
		xpos += one_movement
		_update_position()

func move_down():
	ypos += one_movement
	_update_position()
	_deactivate_if_landed()

func drop_block():
	print("Dropped")

func rotate_block():
	print("Rotated")

func _update_position():
	self.position = Vector2(xpos, ypos)
	print(self.position)

func _deactivate_if_landed():
	if ypos >= Main.ybound:
		is_active = false
		Messenger.TETRISBEHAVIOUR_FALL.disconnect(move_down)
		Messenger.BLOCKDISPATCHER_DISPATCHBLOCK.emit()
