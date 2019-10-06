velY += grv;
velX = sign(walkDirX) * walkSpeed;

targetX = x;
targetY = y;

grounded = scr_placeMeetingTileMap(x, y + 0.3, "Tiles1");

if(grounded){
	targetX = x + velX;	
}

targetY = y + velY;

//Collisions
//Horizontal collisions
if(scr_placeMeetingTileMap(targetX, y, "Tiles1") || 
			!scr_placeMeetingTileMap(targetX + sign(velX)*32, y +1, "Tiles1")) {
	mov_step = sign(velX);	

	x += -mov_step;
	walkDirX = -walkDirX;
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

image_xscale = -walkDirX;