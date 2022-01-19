extends VehicleBody

var horse_power = 200
var accel_speed = 20

var steer_angle = deg2rad(30)
var steer_speed = 3

var brake_power = 40
var brake_speed = 40

func _physics_process(delta):
	
	#acceleration
	var throt_input = -Input.get_action_strength("W")+Input.get_action_strength("S")
	engine_force = lerp(engine_force,throt_input*horse_power,accel_speed*delta)
	
	#steering
	var steer_input = -Input.get_action_strength("D")+Input.get_action_strength("A")
	steering = lerp_angle(steering,steer_input*steer_angle,steer_speed*delta)
	
	#brakeing
	var brake_input = Input.get_action_strength("SPACE")
	brake = lerp(brake,brake_input*brake_power,brake_speed*delta)
