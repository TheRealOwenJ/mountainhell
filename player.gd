extends RigidBody2D

var force := 1000.0
var last_press := 0
var max_power := 1000.0
var decay_speed := 1000.0


func _process(delta):
	if Input.is_action_just_pressed("push_left") or Input.is_action_just_pressed("push_right"):
		var current_time := Time.get_ticks_msec()
		var time_between := current_time - last_press

		if last_press != 0 and time_between < 300:
			force += (200.0 - time_between) * 0.5

		force = minf(force, max_power)
		last_press = current_time

	if Time.get_ticks_msec() - last_press > 300:
		force = maxf(force - decay_speed * delta, 0.0)


func _physics_process(_delta):
	apply_central_force(Vector2.RIGHT * force)
