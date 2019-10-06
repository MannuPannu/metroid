window_set_size(1024*1.25, 768*1.25);
window_set_position(100, 100);

global.moveLeft = false;
global.moveRight = false;
global.jumpPressed = false;
global.jumpHeld = false;
global.crouch = false;
global.isShooting = false;

gamepad_set_axis_deadzone(0, 0.1);

instance_create_layer(objPlayerSpawn.x, objPlayerSpawn.y, 
						"Instances", objPlayer);
						
