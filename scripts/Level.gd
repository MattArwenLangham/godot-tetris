extends Node2D

#Main level

@onready var background = $Background
@onready var boundary = background.get_rect()

func _ready():
	Messenger.LEVEL_START.emit()
