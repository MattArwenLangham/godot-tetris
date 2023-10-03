extends Node2D

#Main level

@onready var background = get_node("Background")
@onready var boundary = background.get_rect()

func on_ready():
	Messenger.LEVEL_START.EMIT()