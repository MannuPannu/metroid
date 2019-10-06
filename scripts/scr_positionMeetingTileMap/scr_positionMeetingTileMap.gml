/// @description Like place_position but for tiles ! :)
/// @param x position x to check for
/// @param y position y to check for
/// @param layer name

var xx = argument0;
var yy = argument1;
var tileMapId = layer_tilemap_get_id(layer_get_id(argument2));

//Check collision
var meeting = tilemap_get_at_pixel(tileMapId, xx, yy);

return meeting;