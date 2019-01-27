extends Area2D

onready var sprite = $collectibleSprite
onready var texture_base = "res://assets/sprites/"

var color
var color_options = ["blue", "green", "red"]
var texture
var itemType

func _ready():
	# Randomly assign a collectible value
	randomize()
	var random_int = randi() % color_options.size()
	color = color_options[random_int]
	itemType = randi()%3 + 1
	texture = load(texture_base + color + "_pickup" + String(itemType) + ".png")
	sprite.texture = texture

# SIGNALS

func _on_collectible_body_entered(body):
	if body.is_in_group("player"):
		print(self.itemType)
		if self.itemType == 1:
			$shellAudioPlayer.play()
		elif self.itemType == 2:
			$seaweedAudioPlayer.play()
		elif self.itemType == 3:
			$gemAudioPlayer.play()
		if self.color == GameData.get("colorRequired"):
			GameData.increment("totalCollected")


func _on_CollectAudioPlayer_finished():
	self.call_deferred("free")
