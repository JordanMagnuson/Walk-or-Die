FADE_OUT_DURATION = 5;
fadeTween = image_alpha;

//graphic
sprite_index = sprPlayerDying;
image_index = 0;
image_speed = 1;

//hit box
sprite_set_offset(sprite_index, sprite_width/2,0);
sprite_collision_mask(sprite_index, true, 1, 0, 0, 0, 0, bboxkind_rectangular,0);
/*
ev_alarm

function fadeOut(){
	playerDying = instance_create_depth(0, 0, 0, oGravestone);
	playerDying.x = x;
	playerDying.y = y; 
	instance_destroy(oPlayer);
}
*/