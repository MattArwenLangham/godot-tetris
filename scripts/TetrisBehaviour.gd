extends Node2D

@onready var is_active = false
@onready var reached_bottom = false
@onready var current_speed
@onready var xpos = 515
@onready var ypos = 0

func _ready():
	is_active = true
	self.position = Vector2(xpos, ypos)