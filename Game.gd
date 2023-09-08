extends Node

export (PackedScene) var green_balloon
export (PackedScene) var red_balloon
export (PackedScene) var yellow_balloon
export (PackedScene) var blue_balloon


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() # Replace with function body.
	$BalloonTimer.start()


func _on_BalloonTimer_timeout():
	# Choose a random location on Path2D.
	$BalloonPath/BalloonSpawnLocation.offset = randi()
	# Create a Balloon instance and add it to the scene.
	var balloon_type = randi() % 4
	var balloon = yellow_balloon.instance()
	match balloon_type:
		0:
			balloon = green_balloon.instance()
		1:
			balloon = blue_balloon.instance()
		2:
			balloon = red_balloon.instance()
		3:
			balloon = yellow_balloon.instance()
	
	add_child(balloon)
	# Set the mob's position to a random location.
	balloon.position = $BalloonPath/BalloonSpawnLocation.position
	$BalloonTimer.wait_time = randf()
