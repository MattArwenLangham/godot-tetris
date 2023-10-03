extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Messenger.LEVEL_START.connect(start_game)

func start_game():
	print("Game start!")