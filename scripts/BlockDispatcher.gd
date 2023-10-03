extends Node

@onready var i_block = preload("res://scenes/BlockTypes/I.tscn")
@onready var t_block = preload("res://scenes/BlockTypes/T.tscn")
@onready var block_array = [i_block, t_block]
@onready var level = $/root/Level

func _ready():
	Messenger.BLOCKDISPATCHER_DISPATCHBLOCK.connect(dispatch_block)

func dispatch_block():
	var block_to_dispatch = get_random_block().instantiate()
	level.add_child(block_to_dispatch)

func get_random_block():
	var random_block = randi_range(0, block_array.size() - 1)
	return block_array[random_block]
