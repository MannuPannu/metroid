//if((keyboard_check(vk_space) || global.jump) && grounded)
//{
//	jumpCounter = jumpTime;	
//}

//if(keyboard_check_released(vk_space) || global.jump){
//	jumpCounter = 0;
//}

//if(jumpCounter > 0){
//	velY -= jumpForce;			
//}

//jumpCounter--;
velY += grv;

if(global.jumpPressed && grounded)
{
	velY -= jumpSpeed;
}

if(velY > 0) {
	velY += grv * 0.5;	
}

if(velY < 0 && !global.jumpHeld){
	velY = max(velY, -jumpSpeed/4);
}


