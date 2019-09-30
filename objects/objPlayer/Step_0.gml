velY = min(velY, maxSpeedVertical);

if(global.moveLeft && !global.crouch)
{
	velX -= grounded ? playerAccelerationGround : playerAccelerationAir;
}

if(global.moveRight && !global.crouch)
{
	velX += grounded ? playerAccelerationGround : playerAccelerationAir;
}


scr_jumpCode();

//Clamp max speed
velX = sign(velX) > 0 ? min(velX, maxSPeedHorizontal) : max(-maxSPeedHorizontal, velX);

//Ground friction
velX *= grounded ? groundFrict : airFrict;

//Auto stop when moving to slow
velX = (velX < minSpeedToStop && velX > -minSpeedToStop) ? 0 : velX;

targetX = x + velX
targetY = y + velY;

//Collisions
//Horizontal collisions
if(place_meeting(targetX, y, objWall)) {
	
	mov_step = sign(velX) * 0.1;	
	
	while(!place_meeting(x + mov_step, y, objWall)){
		x += mov_step;
	}
	velX = 0;
}
else {
	x = targetX;	
}

//Vertical collisions
if(place_meeting(x, targetY, objWall)) {
	mov_step = sign(velY) * 0.1;	
	
	while(!place_meeting(x, y + mov_step, objWall)){
		y += mov_step;
	}
	
	if(sign(velY) < 0){
		velY *= 0.5;
	}else {
		velY = 0;
	}
}
else {
	y = targetY;
}

groundedPrev = grounded;
grounded = place_meeting(x, y + 0.3, objWall);

//Animations
if(grounded) {
	
	if(velX == 0){
 		sprite_index = idleAnim;
		image_speed = 0.5;
	}

	if(abs(velX) > 0){
		sprite_index = runningAnim;
		image_speed = 1.0;
	}
	
	if(global.crouch && grounded){
		sprite_index = crouchAnim;	
	}
	
	if(global.moveLeft){
			image_xscale = -1;
		}else if(global.moveRight) {
			image_xscale = 1;
		}
}

if(!grounded && groundedPrev){ //We have just jumped
	sprite_index = jumpStartAnim;
	image_speed = 0.5;
}