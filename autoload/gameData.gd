extends Node

var colors = ["blue", "green", "red"]

var game_data = {
	"colorRequired": colors[randi() % (colors.size())],
	"totalCollected": 0,
	"totalRequired": 15
}

# Gets value from key value store
#
# key - Identifier of value stored in globally available dictionary
#
# Returns value of any type
func get(key):
	return game_data[key]

# Sets key value pairing in globally available dictionary
#
# key - String identifier to fetch value later
#
# value - Value of any type
#
# Returns nothing
func store(key, data):
	game_data[key] = data

# Decrements value of key value store by one
#
# key - Identifier
func decrement(key):
	game_data[key] -= 1

# Increments value of key value store by one
#
# key - Identifier
func increment(key):
	game_data[key] += 1
	
# Resets data model
func reset():
	randomize()
	self.game_data = {
		"colorRequired": colors[randi() % (colors.size())],
		"totalCollected": 0,
		"totalRequired": 15
	}
