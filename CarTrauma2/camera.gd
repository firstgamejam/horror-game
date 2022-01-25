extends SpringArm

# set camera
func _ready():
	$ClippedCamera.make_current()
	pass
	
# look around
func _input(event):
	if event.is_action_pressed("left"):
		print("LEFT")
		$ClippedCamera2.make_current()
	elif event.is_action_pressed("right"):
		print("RIGHT")
		$ClippedCamera3.make_current()
	elif event.is_action_pressed("down"):
		print("DOWN")
		$ClippedCamera4.make_current()
	elif event.is_action_pressed("up"):
		print("UP")
		$ClippedCamera.make_current()
#	else:
#		$ClippedCamera.make_current()
