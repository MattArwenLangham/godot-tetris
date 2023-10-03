extends Node2D

#Main level

func _ready():
	Messenger.LEVEL_START.emit()
