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
//Todo: a better performance wise would be to get the tile and do checks on that
if(scr_placeMeetingTileMap(targetX, y, "Tiles1")) {
	
	mov_step = sign(velX) * 0.1;	
	
	while(!scr_placeMeetingTileMap(x + mov_step, y, "Tiles1")){
		x += mov_step;
	}
	velX = 0;
}
else {
	x = targetX;	
}

//Vertical collisions
if(scr_placeMeetingTileMap(x, targetY, "Tiles1")) {
	mov_step = sign(velY) * 0.1;	
	
	while(!scr_placeMeetingTileMap(x, y + mov_step, "Tiles1")){
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
grounded = scr_placeMeetingTileMap(x, y + 0.3, "Tiles1");

//Shooting
if(global.isShooting){
	if(weaponCoolDownCur < 0){
		var bullet = instance_create_layer(x + (image_xscale*32) , y -7, "Instances", objBullet);
		bullet.velX = bulletSpeed* image_xscale;
		weaponCoolDownCur = weaponCoolDown;
	}
}
weaponCoolDownCur -= 1;


//Animations
if(grounded) {
	
	if(velX == 0){
		if(global.isShooting){
			sprite_index = idleShootingAnim;
		}else {
			sprite_index = idleAnim;
		}
 		
		image_speed = 0.5;
	}

	if(abs(velX) > 0){
		if(global.isShooting){
			sprite_index = runningShootingAnim;
		}else {
			sprite_index = runningAnim;
		}
		
		image_speed = 1.0;
	}
	
	if(global.crouch && grounded){
		if(global.isShooting){
			sprite_index = crouchingShootingAnim;
		}else {
			sprite_index = crouchAnim;	
		}
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