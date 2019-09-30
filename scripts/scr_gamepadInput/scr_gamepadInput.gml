global.moveLeft = false;
global.moveRight = false;
global.jumpPressed = false;
global.jumpHeld = false;
global.crouch = false;

if(keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0, gp_face1)){
	global.jumpPressed = true;
}

if(gamepad_button_check(0, gp_face1) || keyboard_check(vk_space)){
	global.jumpHeld = true;
}

if( (gamepad_axis_value(0, gp_axislh) < -gamepad_get_axis_deadzone(0)) || 
	keyboard_check(vk_left)){
	global.moveLeft = true;
}
else if( (gamepad_axis_value(0, gp_axislh) > gamepad_get_axis_deadzone(0)) || 
	keyboard_check(vk_right)){
	global.moveRight = true;
}

if( (gamepad_axis_value(0, gp_axislv) < -gamepad_get_axis_deadzone(0)) || 
	keyboard_check(vk_down)){
		global.crouch = true;
}
