//Check jump animations
if(sprite_index == jumpStartAnim){
	if(global.isShooting){
		sprite_index = jumpShooting;
	}else {
		sprite_index = jumpAirAnim;
	}
}