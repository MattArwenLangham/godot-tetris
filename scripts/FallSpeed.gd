extends Timer

func _on_timeout():
	Messenger.TETRISBEHAVIOUR_FALL.emit()