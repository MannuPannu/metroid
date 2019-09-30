global.moveLeft = false;
global.moveRight = false;
global.jumpPressed = false;
global.jumpHeld = false;
global.crouch = false;

gamepad_set_axis_deadzone(0, 0.1);

instance_create_layer(objPlayerSpawn.x, objPlayerSpawn.y, 
						"Instances", objPlayer);
						
