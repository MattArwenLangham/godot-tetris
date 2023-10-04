extends Area2D

@onready var is_active = false
@onready var tile_size = 32
@onready var inputs = {"Right": Vector2.RIGHT,
			"Left": Vector2.LEFT,
			"Down": Vector2.DOWN}

func _ready():
	position = Vector2(500, 0)
	is_active = true
	Messenger.TETRISBEHAVIOUR_FALL.connect(fall)

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)

func fall():
	move("Down")

func move(dir):
	position += inputs[dir] * tile_size

# func drop_block():

# func rotate_block():
