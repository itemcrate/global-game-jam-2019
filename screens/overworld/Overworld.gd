extends Node

onready var wave = $wave

func _ready():
	wave.flow()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
