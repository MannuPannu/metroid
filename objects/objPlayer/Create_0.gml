//Set animations
idleAnim = sprPlayerIdle;
runningAnim = sprPlayerRunning;
jumpStartAnim = sprJumpStart;
jumpAirAnim = sprJumpAir;
jumpLandAnim = sprJumpLand;
jumpShooting = sprJumpShooting;
crouchAnim = sprCrouch;
runningShootingAnim = sprRunningShooting;
crouchingShootingAnim = sprCrouchingShooting;
idleShootingAnim = sprIdleShooting;

weaponCoolDownCur = -1;
weaponCoolDown = 20;
bulletSpeed = 15;
//First draft for player controller
grv = 1.2;

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
