/// @description Like place_meeting but for tiles ! :)
/// @param x position x to check for
/// @param y position y to check for
/// @param layer name

var xx = argument0;
var yy = argument1;
var tileMapId = layer_tilemap_get_id(layer_get_id(argument2));

//Save position
xp = x;
yp = y;

//Update object position
x = xx;
y = yy;

//Check collision
var meeting = tilemap_get_at_pixel(tileMapId, bbox_left, bbox_top) ||
			  tilemap_get_at_pixel(tileMapId, bbox_right, bbox_top) ||
			  tilemap_get_at_pixel(tileMapId, bbox_left, y) ||
			  tilemap_get_at_pixel(tileMapId, bbox_right, y) ||
			  tilemap_get_at_pixel(tileMapId, bbox_left, bbox_bottom) ||
			  tilemap_get_at_pixel(tileMapId, bbox_right, bbox_bottom) ||
			  tilemap_get_at_pixel(tileMapId, x, y);

//Move back
x = xp;
y = yp;

return meeting;