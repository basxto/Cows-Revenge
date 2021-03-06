extends Area2D

var body_hitted = null

func _fixed_process(delta):
	body_hitted.decrease_life(0.40)
	var t = Timer.new()
	t.set_wait_time(0.01)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
func _on_Area2D_body_enter( body ):
	if (body.is_in_group("enemy")):
		body.decrease_life(0.40)
		body.change_velocity(100, get_parent().get_parent().get_parent().shoot_dir.x > 0)
		body_hitted = body
		set_fixed_process(true)
	
func _on_Area2D_body_exit( body ):
	if (body.is_in_group("enemy")):
		body.restore_velocity()
		set_fixed_process(false)

func enable():
	set_enable_monitoring(true)
	
func disable():
	set_enable_monitoring(false)