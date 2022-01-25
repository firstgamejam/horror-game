extends KinematicBody

# define variables
onready var nav = $"../Navigation" as Navigation
onready var car = $"../car" as VehicleBody
var path = []
var current_node = 0
var speed = 2
var target = null

# nessecary?
func _ready():
	pass

# monster movement
func _physics_process(delta):
	self.look_at(car.global_transform.origin, Vector3.UP) # look at car
	if current_node < path.size():
		var direction: Vector3 = path[current_node] - global_transform.origin
		if direction.length() < 1:
			current_node += 1
		else:
			move_and_slide(direction.normalized() * speed)

# update path to car
func update_path(target_position):
	path = nav.get_simple_path(global_transform.origin, target_position)

# timer for updating path to car
func _on_Timer_timeout():
	# print("Looking for Car! Current node:", current_node)
	update_path(car.global_transform.origin)
	current_node = 0
