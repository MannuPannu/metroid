//Set animations
idleAnim = sprPlayerIdle;
runningAnim = sprPlayerRunning;
jumpStartAnim = sprJumpStart;
jumpAirAnim = sprJumpAir;
jumpLandAnim = sprJumpLand;
crouchAnim = sprCrouch;

//First draft for player controller
grv = 1.4;

velX = 0;
velY = 0;

maxSpeedVertical = 10;
maxSPeedHorizontal = 6.5;

groundFrict = 0.72;
airFrict = 0.91;

minSpeedToStop = 0.1;

playerAccelerationGround = 2;
playerAccelerationAir = 0.8;

grounded = false;
groundedPrev = grounded;

jumpSpeed = 20
